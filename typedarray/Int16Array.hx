package typedarray;

#if lime

typedef Int16Array = lime.utils.Int16Array;

#elseif js

typedef Int16Array = js.lib.Int16Array;

#else

import typedarray.ArrayBufferView.ArrayBufferViewBase;
import typedarray.ArrayBufferView.ArrayLike;
import typedarray.ArrayBufferView.ArrayBufferViewImplIterator;

#if (!macro && cpp)
private typedef Int16 = cpp.Int16;
#else
private typedef Int16 = Int;
#end


@:nullSafety
@:forward
#if !macro
@:build(typedarray.ArrayBufferView.BuildArrayBufferView.build(Int16))
#end
abstract Int16Array(Int16ArrayImpl)
	to Int16ArrayImpl from Int16ArrayImpl
 	to ArrayBufferView
	to ArrayLike<Int16>
{
	// typed filled by macro
}

@:noCompletion
@:nullSafety
class Int16ArrayImpl extends ArrayBufferViewBase {

	static public inline var BYTES_PER_ELEMENT : Int = 2;

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

	@:noCompletion
	@:pure public function _get(i: Int) {
		#if debug
		if (i < 0 || i >= this.length) {
			throw haxe.io.Error.OutsideBounds;
		}
		#end

		var p = i * BYTES_PER_ELEMENT + this.byteOffset;

		#if cpp
		return cpp.NativeArray.unsafeGet(this.nativeBytes, p);
		#else
		return (this.buffer: haxe.io.Bytes).get(p);
		#end
	}
	
	@:noCompletion
	public inline function _set(i: Int, v: Int16) {
		#if debug
		if (i < 0 || i >= this.length) {
			throw haxe.io.Error.OutsideBounds;
		}
		#end

		var p = i * BYTES_PER_ELEMENT + this.byteOffset;

		#if cpp
		cpp.NativeArray.unsafeSet(this.nativeBytes, p, v);
		#else
		(this.buffer: haxe.io.Bytes).set(p, v);
		#end
		return v;
	}

	@:pure public inline function iterator() {
		return new ArrayBufferViewImplIterator<Int16>(this);
	}

}

#end
