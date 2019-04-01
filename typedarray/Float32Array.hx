package typedarray;

import haxe.io.Bytes;
#if lime

typedef Float32Array = lime.utils.Float32Array;

#elseif js

typedef Float32Array = js.lib.Float32Array;

#else

import typedarray.ArrayBufferView.ArrayBufferViewBase;
import typedarray.ArrayBufferView.ArrayLike;
import typedarray.ArrayBufferView.ArrayAccessImpl;

@:nullSafety
@:forward
abstract Float32Array(Float32ArrayImpl)
	to Float32ArrayImpl from Float32ArrayImpl
 	to ArrayBufferView
	to ArrayLike<Float>
{

	static public inline var BYTES_PER_ELEMENT : Int = Float32ArrayImpl.BYTES_PER_ELEMENT;

	/**
		Call as either
		- (length: Int)
		- (copyFromArray: ArrayLike<Float>)
		- (buffer: ArrayBuffer, byteOffset: Int, byteLength: Int)
	**/
	@:pure public inline function new(
		?length: Int,

		?copyFromArray: ArrayLike<Float>,

		?buffer: ArrayBuffer,
		?byteOffset: Int,
		?byteLength: Int
	) {
		if (copyFromArray != null) {
			this = cast Float32Array.from(copyFromArray);
		} else {
			this = new Float32ArrayImpl(
				length,
				buffer,
				byteOffset,
				byteLength
			);
		}
	}

	/*

	# still todo
	function copyWithin( target : Int, start : Int, ?end : Int ) : Float32Array;
	function filter( callbackfn : Float -> Int -> Float32Array -> Dynamic, ?thisArg : Dynamic ) : Float32Array;
	function find( predicate : Float -> Int -> Float32Array -> Bool, ?thisArg : Dynamic ) : Dynamic;
	function findIndex( predicate : Float -> Int -> Float32Array -> Bool, ?thisArg : Dynamic ) : Int;
	function lastIndexOf( searchElement : Float, ?fromIndex : Int ) : Int;
	function map( callbackfn : Float -> Int -> Float32Array -> Float, ?thisArg : Dynamic ) : Float32Array;
	@:overload( function( callbackfn : Float -> Float -> Int -> Float32Array -> Float ) : Int {} )
	function reduce( callbackfn : Dynamic -> Float -> Int -> Float32Array -> Dynamic, initialValue : Dynamic ) : Dynamic;
	@:overload( function( callbackfn : Float -> Float -> Int -> Float32Array -> Float ) : Int {} )
	function reduceRight( callbackfn : Dynamic -> Float -> Int -> Float32Array -> Dynamic, initialValue : Dynamic ) : Dynamic;
	function reverse() : Float32Array;
	function slice( ?start : Int, ?end : Int ) : Float32Array;
	function some( callbackfn : Float -> Int -> Float32Array -> Bool, ?thisArg : Dynamic ) : Bool;
	function sort( ?compareFn : Float -> Float -> Int ) : Float32Array;

	*/

	public inline function set(copyFromArray: ArrayLike<Float>, ?offset: Int = 0): Void {
		var i = 0;
		for (v in copyFromArray) {
			this.set(offset + i++, v);
		}
	}

	public inline function join(?separator: String): String {
		return [for (v in this) v].join(separator);
	}

	public inline function indexOf(searchElement: Float, ?fromIndex: Int = 0) : Int {
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
		return new Float32Array(this.buffer, start * BYTES_PER_ELEMENT, (end - start) * BYTES_PER_ELEMENT);
	}

	public inline function fill(value: Float, ?start: Int = 0, ?end: Int) {
		if (end == null) end = this.length;
		if (start < 0) start = this.length + start;
		if (end < 0) end = this.length + end;
		for (i in 0...(end - start)) {
			this.set(i + start, value);
		}
	}

	public inline function forEach(callback: Float -> Int -> Float32Array -> Void): Void {
		var i = 0;
		for (v in this) {
			callback(v, i++, this);
		}
	}

	public inline function every(callback: Float -> Int -> Float32Array -> Bool): Bool {
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
	inline function arraySet(i: Int, v: Float) {
		return this.set(i, v);
	}

	// @:pure static function of( items : haxe.extern.Rest<Array<Dynamic>> ) : Float32Array {}
	@:pure static public inline function from(source: ArrayLike<Float>, ?mapFn: Float -> Int -> Float): Float32Array {
		var view = new Float32Array(source.length);
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
@:allow(typedarray.Float32Array)
class Float32ArrayImpl extends ArrayBufferViewBase {

	static public inline var BYTES_PER_ELEMENT : Int = 4;

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
		return untyped __global__.__hxcpp_memory_get_float(this.nativeBytes, i * BYTES_PER_ELEMENT + this.byteOffset);
		#else
		return (this.buffer: haxe.io.Bytes).getFloat(i);
		#end
	}

	inline function set(i: Int, v: Float) {
		#if debug
		if (i < 0 || i >= this.length) {
			throw haxe.io.Error.OutsideBounds;
		}
		#end

		#if cpp
		return untyped __global__.__hxcpp_memory_set_float(this.nativeBytes, i * BYTES_PER_ELEMENT + this.byteOffset, v);
		#else
		return (this.buffer: haxe.io.Bytes).setFloat(i, v);
		#end
	}

	@:pure public inline function iterator(): Iterator<Float> {
		return new Float32ArrayIterator(this);
	}

	function toString() {
		return [for (i in 0...this.length) get(i)].join(',');
	}

}

@:access(typedarray.Float32ArrayImpl)
private class Float32ArrayIterator {

	var a: Float32ArrayImpl;
	var i: Int = 0;

	public inline function new(array: Float32ArrayImpl) {
		this.a = array;
	}

	public inline function hasNext(): Bool {
		return i < (this.a.length);
	}

	public inline function next(): Float {
		return a.get(i++);
	}
	
}

#end
