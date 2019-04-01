package typedarray;

#if lime

typedef Uint16Array = lime.utils.UInt16Array;

#elseif js

typedef Uint16Array = js.lib.Uint16Array;

#else

import typedarray.ArrayBufferView.ArrayBufferViewBase;
import typedarray.ArrayBufferView.ArrayLike;
import typedarray.ArrayBufferView.ArrayBufferViewImplIterator;

#if (!macro && cpp)
private typedef UInt16 = cpp.UInt16;
#else
private typedef UInt16 = Int;
#end


@:nullSafety
@:forward
#if !macro
@:build(typedarray.ArrayBufferView.BuildArrayBufferView.build(UInt16))
#end
abstract Uint16Array(Uint16ArrayImpl)
	to Uint16ArrayImpl from Uint16ArrayImpl
 	to ArrayBufferView
	to ArrayLike<UInt16>
{
	// typed filled by macro
}

@:noCompletion
@:nullSafety
class Uint16ArrayImpl extends ArrayBufferViewBase {

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
	public inline function _set(i: Int, v: UInt16) {
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
		return new ArrayBufferViewImplIterator<UInt16>(this);
	}

}

#end
