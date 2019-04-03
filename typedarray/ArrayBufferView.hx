package typedarray;

#if lime

typedef ArrayBufferView = lime.utils.ArrayBufferView;

#elseif js

typedef ArrayBufferView = js.lib.ArrayBufferView;

#else

interface ArrayBufferView {
	var buffer (default, null): ArrayBuffer;
	var byteOffset (default, null): Int;
	var byteLength (default, null): Int;
}

// internal implementation and types below

@:noCompletion
typedef ArrayLike<T> = {
	var length (default, null): Int;
	function iterator(): Iterator<T>;
};

@:noCompletion
@:nullSafety
class ArrayBufferViewBase implements ArrayBufferView {

	public final buffer: ArrayBuffer;
	public final byteOffset: Int;
	public final byteLength: Int;

	public final BYTES_PER_ELEMENT_: Int;
	public var length (default, null): Int;

	var nativeBytes (get, never): haxe.io.BytesData;

	/**
		Call as either
		- (length: Int)
		- (arrayBufferView: ArrayBufferView)
		- (buffer: ArrayBuffer, byteOffset: Int, byteLength: Int)
	**/
	inline function new(
		BYTES_PER_ELEMENT: Int,

		?length: Int,

		?buffer: ArrayBuffer,
		?byteOffset: Int,
		?byteLength: Int
	) {
		this.BYTES_PER_ELEMENT_ = BYTES_PER_ELEMENT;

		if (length != null) {
			this.buffer = new ArrayBuffer(length * BYTES_PER_ELEMENT);
			this.byteOffset = 0;
			this.byteLength = this.buffer.byteLength;
		}

		else if (buffer != null) {
			this.buffer = buffer;
			this.byteOffset = byteOffset != null ? byteOffset : 0;
			this.byteLength = byteLength != null ? byteLength : buffer.byteLength;
		}

		else {
			this.buffer = new ArrayBuffer(0);
			this.byteOffset = 0;
			this.byteLength = 0;
		}

		// power of two of 3 byte number
		var lengthShift = 
			((1 << 3 & BYTES_PER_ELEMENT) >> 3) * 3 +
			((1 << 2 & BYTES_PER_ELEMENT) >> 2) * 2 +
			((1 << 1 & BYTES_PER_ELEMENT) >> 1)
		;

		this.length = this.byteLength >> lengthShift;

		// validate
		#if debug
		if (this.byteLength % BYTES_PER_ELEMENT != 0) {
			throw haxe.io.Error.Custom('byte length of should be a multiple of ${BYTES_PER_ELEMENT}');
		}
		#end
	}

	inline function get_nativeBytes() {
		return (this.buffer: haxe.io.Bytes).getData();
	}

}

@:noCompletion
class ArrayBufferViewImplIterator<T> {

	var a: {
		var length (default, null): Int;
		function _get(i: Int): T;
		function _set(i: Int, v: T): T;
	};
	var i: Int = 0;

	public inline function new(array) {
		this.a = array;
	}

	public inline function hasNext(): Bool {
		return i < (this.a.length);
	}

	public inline function next(): T {
		return a._get(i++);
	}
	
}

#if macro
class BuildArrayBufferView {

	static function build(arrayType: haxe.macro.Expr) {
		var currentFields = haxe.macro.Context.getBuildFields();

		var arrayTypeName = switch arrayType {
			case macro $i{name}: name;
			default: 
				haxe.macro.Context.error('Array type should be a type name', haxe.macro.Context.currentPos());
				return currentFields;
		}
		
		var modulePath = haxe.macro.Context.getLocalModule();
		var moduleParts = modulePath.split('.');
		var modulePack = moduleParts.slice(0, -1);
		var moduleName = moduleParts[moduleParts.length - 1];

		var This = {
			name: moduleName,
			pack: modulePack
		};
		var ThisImpl = {
			name: moduleName + 'Impl',
			pack: modulePack
		};
		var ThisT: haxe.macro.Expr.ComplexType = TPath(This);

		var ArrayTypeT: haxe.macro.Expr.ComplexType = TPath({
			name: arrayTypeName,
			pack: []
		});
		

		var newFields = (macro class GenericArrayBufferView {
			static public inline var BYTES_PER_ELEMENT : Int = $i{ThisImpl.name}.BYTES_PER_ELEMENT;

			/**
				Call as either
				- (length: Int)
				- (copyFromArray: ArrayLike<$ArrayTypeT>)
				- (buffer: ArrayBuffer, byteOffset: Int, byteLength: Int)
			**/
			@:pure public inline function new(
				?length: Int,

				?copyFromArray: ArrayLike<$ArrayTypeT>,

				?buffer: ArrayBuffer,
				?byteOffset: Int,
				?byteLength: Int
			) {
				if (copyFromArray != null) {
					this = cast $i{This.name}.from(copyFromArray);
				} else {
					this = new $ThisImpl(
						length,
						buffer,
						byteOffset,
						byteLength
					);
				}
			}

			public inline function map(callback: $ArrayTypeT -> Int -> $ThisT -> $ArrayTypeT): $ThisT {
				var newArray = new $This(this.length);
				for (i in 0...this.length) {
					newArray[i] = callback(arrayGet(i), i, this);
				}
				return newArray;
			}

			/*

			# still todo
			function copyWithin( target : Int, start : Int, ?end : Int ) : $ThisT;
			function filter( callbackfn : $ArrayTypeT -> Int -> $ThisT -> Dynamic, ?thisArg : Dynamic ) : $ThisT;
			function find( predicate : $ArrayTypeT -> Int -> $ThisT -> Bool, ?thisArg : Dynamic ) : Dynamic;
			function findIndex( predicate : $ArrayTypeT -> Int -> $ThisT -> Bool, ?thisArg : Dynamic ) : Int;
			function lastIndexOf( searchElement : $ArrayTypeT, ?fromIndex : Int ) : Int;
			@:overload( function( callbackfn : $ArrayTypeT -> $ArrayTypeT -> Int -> $ThisT -> $ArrayTypeT ) : Int {} )
			function reduce( callbackfn : Dynamic -> $ArrayTypeT -> Int -> $ThisT -> Dynamic, initialValue : Dynamic ) : Dynamic;
			@:overload( function( callbackfn : $ArrayTypeT -> $ArrayTypeT -> Int -> $ThisT -> $ArrayTypeT ) : Int {} )
			function reduceRight( callbackfn : Dynamic -> $ArrayTypeT -> Int -> $ThisT -> Dynamic, initialValue : Dynamic ) : Dynamic;
			function reverse() : $ThisT;
			function slice( ?start : Int, ?end : Int ) : $ThisT;
			function some( callbackfn : $ArrayTypeT -> Int -> $ThisT -> Bool, ?thisArg : Dynamic ) : Bool;
			function sort( ?compareFn : $ArrayTypeT -> $ArrayTypeT -> Int ) : $ThisT;
			*/

			public inline function set(copyFromArray: ArrayLike<$ArrayTypeT>, ?offset: Int = 0): Void {
				var i = 0;
				for (v in copyFromArray) {
					arraySet(offset + i++, v);
				}
			}

			public inline function join(?separator: String): String {
				return [for (v in this) v].join(separator);
			}

			public inline function indexOf(searchElement: $ArrayTypeT, ?fromIndex: Int = 0) : Int {
				if (fromIndex < 0) fromIndex = this.length + fromIndex;
				var result = -1;
				for (i in fromIndex...this.length) {
					if (arrayGet(i) == searchElement) {
						result = i;
						break;
					}
				}
				return result;
			}

			public inline function subarray(start: Int, ?end: Int) {
				if (end == null) end = this.length;
				if (start < 0) start = this.length + start;
				if (end < 0) end = this.length + end;
				return new $This(this.buffer, start * BYTES_PER_ELEMENT + this.byteOffset, (end - start) * BYTES_PER_ELEMENT);
			}

			public inline function fill(value: $ArrayTypeT, ?start: Int = 0, ?end: Int) {
				if (end == null) end = this.length;
				if (start < 0) start = this.length + start;
				if (end < 0) end = this.length + end;
				for (i in 0...(end - start)) {
					arraySet(i + start, value);
				}
			}

			public inline function forEach(callback: $ArrayTypeT -> Int -> $ThisT -> Void): Void {
				var i = 0;
				for (v in this) {
					callback(v, i++, this);
				}
			}

			public inline function every(callback: $ArrayTypeT -> Int -> $ThisT -> Bool): Bool {
				var result: Bool = true;
				var i = 0;
				for (v in this) {
					if (!callback(v, i++, this)) {
						result = false;
						break;
					}
				}
				return result;
			}

			function toString() {
				return [for (i in 0...this.length) arrayGet(i)].join(',');
			}

			@:arrayAccess
			@:pure inline function arrayGet(i: Int) {
				return this._get(i);
			}

			@:arrayAccess
			inline function arraySet(i: Int, v: $ArrayTypeT) {
				return this._set(i, v);
			}

			// @:pure static function of( items : haxe.extern.Rest<Array<Dynamic>> ) : $ThisT {}
			@:pure static public inline function from(source: ArrayLike<$ArrayTypeT>, ?mapFn: $ArrayTypeT -> Int -> $ArrayTypeT): $ThisT {
				var view = new $This(source.length);
				var i = 0;
				for (v in source) {
					view[i] = mapFn != null ? mapFn(v, i) : v;
					i++;
				}
				return view;
			}
		}).fields;

		// add target specific fields
		if (haxe.macro.Context.getDefines().exists('cpp')) {
			newFields = newFields.concat((macro class CppFields {
				@:pure
				@:access(typedarray.ArrayBufferViewBase)
				public inline function toCppPointer(): cpp.Pointer<$ArrayTypeT> {
					return cast cpp.NativeArray.address((cast this.nativeBytes: Array<$ArrayTypeT>), 0);
				}
			}).fields);
		}

		return currentFields.concat(newFields);
	}

}
#end

#end
