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
typedef ArrayAccessImpl<T> = ArrayLike<T> & {
	function get(i: Int): T;
	function set(i: Int, v: T): T;
}

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

#end
