package typedarray;

#if lime

typedef Uint8Array = lime.utils.UInt8Array;

#elseif js

typedef Uint8Array = js.lib.Uint8Array;

#else

import typedarray.ArrayBufferView.ArrayBufferViewBase;
import typedarray.ArrayBufferView.ArrayLike;
import typedarray.ArrayBufferView.ArrayAccessImpl;

#if !macro
import cpp.UInt8;
#else
typedef UInt8 = Int;
#end

@:nullSafety
@:forward
abstract Uint8Array(Uint8ArrayImpl)
	to Uint8ArrayImpl from Uint8ArrayImpl
 	to ArrayBufferView
	to ArrayLike<UInt8>
{

	static public inline var BYTES_PER_ELEMENT : Int = Uint8ArrayImpl.BYTES_PER_ELEMENT;

	/**
		Call as either
		- (length: Int)
		- (copyFromArray: ArrayLike<UInt8>)
		- (buffer: ArrayBuffer, byteOffset: Int, byteLength: Int)
	**/
	@:pure public inline function new(
		?length: Int,

		?copyFromArray: ArrayLike<UInt8>,

		?buffer: ArrayBuffer,
		?byteOffset: Int,
		?byteLength: Int
	) {
		if (copyFromArray != null) {
			this = cast Uint8Array.from(copyFromArray);
		} else {
			this = new Uint8ArrayImpl(
				length,
				buffer,
				byteOffset,
				byteLength
			);
		}
	}

	/*

	# still todo
	function copyWithin( target : Int, start : Int, ?end : Int ) : Uint8Array;
	function filter( callbackfn : UInt8 -> Int -> Uint8Array -> Dynamic, ?thisArg : Dynamic ) : Uint8Array;
	function find( predicate : UInt8 -> Int -> Uint8Array -> Bool, ?thisArg : Dynamic ) : Dynamic;
	function findIndex( predicate : UInt8 -> Int -> Uint8Array -> Bool, ?thisArg : Dynamic ) : Int;
	function lastIndexOf( searchElement : UInt8, ?fromIndex : Int ) : Int;
	function map( callbackfn : UInt8 -> Int -> Uint8Array -> UInt8, ?thisArg : Dynamic ) : Uint8Array;
	@:overload( function( callbackfn : UInt8 -> UInt8 -> Int -> Uint8Array -> UInt8 ) : Int {} )
	function reduce( callbackfn : Dynamic -> UInt8 -> Int -> Uint8Array -> Dynamic, initialValue : Dynamic ) : Dynamic;
	@:overload( function( callbackfn : UInt8 -> UInt8 -> Int -> Uint8Array -> UInt8 ) : Int {} )
	function reduceRight( callbackfn : Dynamic -> UInt8 -> Int -> Uint8Array -> Dynamic, initialValue : Dynamic ) : Dynamic;
	function reverse() : Uint8Array;
	function slice( ?start : Int, ?end : Int ) : Uint8Array;
	function some( callbackfn : UInt8 -> Int -> Uint8Array -> Bool, ?thisArg : Dynamic ) : Bool;
	function sort( ?compareFn : UInt8 -> UInt8 -> Int ) : Uint8Array;

	*/

	public inline function set(copyFromArray: ArrayLike<UInt8>, ?offset: Int = 0): Void {
		var i = 0;
		for (v in copyFromArray) {
			this.set(offset + i++, v);
		}
	}

	public inline function join(?separator: String): String {
		return [for (v in this) v].join(separator);
	}

	public inline function indexOf(searchElement: UInt8, ?fromIndex: Int = 0) : Int {
		if (fromIndex < 0) fromIndex = this.length + fromIndex;
		var result = -1;
		for (i in fromIndex...this.length) {
			if (this.get(i) == searchElement) {
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
		return new Uint8Array(this.buffer, start * BYTES_PER_ELEMENT, (end - start) * BYTES_PER_ELEMENT);
	}

	public inline function fill(value: UInt8, ?start: Int = 0, ?end: Int) {
		if (end == null) end = this.length;
		if (start < 0) start = this.length + start;
		if (end < 0) end = this.length + end;
		for (i in 0...(end - start)) {
			this.set(i + start, value);
		}
	}

	public inline function forEach(callback: UInt8 -> Int -> Uint8Array -> Void): Void {
		var i = 0;
		for (v in this) {
			callback(v, i++, this);
		}
	}

	public inline function every(callback: UInt8 -> Int -> Uint8Array -> Bool): Bool {
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

	@:arrayAccess
	@:pure inline function arrayGet(i: Int) {
		return this.get(i);
	}

	@:arrayAccess
	inline function arraySet(i: Int, v: UInt8) {
		return this.set(i, v);
	}

	// @:pure static function of( items : haxe.extern.Rest<Array<Dynamic>> ) : Uint8Array {}
	@:pure static public inline function from(source: ArrayLike<UInt8>, ?mapFn: UInt8 -> Int -> UInt8): Uint8Array {
		var view = new Uint8Array(source.length);
		var i = 0;
		for (v in source) {
			view[i] = mapFn != null ? mapFn(v, i) : v;
			i++;
		}
		return view;
	}

}

@:noCompletion
@:nullSafety
@:allow(typedarray.Uint8Array)
class Uint8ArrayImpl extends ArrayBufferViewBase {

	static public inline var BYTES_PER_ELEMENT : Int = 1;

	@:pure public inline function new(
		?length: Int,

		?buffer: ArrayBuffer,
		?byteOffset: Int,
		?byteLength: Int
	) {
		super(
			BYTES_PER_ELEMENT,
			length,
			buffer,
			byteOffset,
			byteLength
		);
	}

	@:pure function get(i: Int) {
		#if debug
		if (i < 0 || i >= this.length) {
			throw haxe.io.Error.OutsideBounds;
		}
		#end

		#if cpp
		return cpp.NativeArray.unsafeGet(this.nativeBytes, i + this.byteOffset);
		#else
		return (this.buffer: haxe.io.Bytes).get(i + this.byteOffset);
		#end
	}

	inline function set(i: Int, v: UInt8) {
		#if debug
		if (i < 0 || i >= this.length) {
			throw haxe.io.Error.OutsideBounds;
		}
		#end

		#if cpp
		return cpp.NativeArray.unsafeSet(this.nativeBytes, i + this.byteOffset, v);
		#else
		return (this.buffer: haxe.io.Bytes).set(i + this.byteOffset, v);
		#end
	}

	@:pure public inline function iterator(): Iterator<UInt8> {
		return new Uint8ArrayIterator(this);
	}

	function toString() {
		return [for (i in 0...this.length) get(i)].join(',');
	}

}

@:access(typedarray.Uint8ArrayImpl)
private class Uint8ArrayIterator {

	var a: Uint8ArrayImpl;
	var i: Int = 0;

	public inline function new(array: Uint8ArrayImpl) {
		this.a = array;
	}

	public inline function hasNext(): Bool {
		return i < (this.a.length);
	}

	public inline function next(): UInt8 {
		return a.get(i++);
	}
	
}

#end
