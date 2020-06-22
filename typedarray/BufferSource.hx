package typedarray;

/**
	"The BufferSource typedef is used to represent objects that are either themselves an ArrayBuffer or which provide a view on to an ArrayBuffer."

	https://heycam.github.io/webidl/#BufferSource
**/
abstract BufferSource(BufferSourceType) from BufferSourceType {

	public var byteLength(get, never): Int;

	inline function get_byteLength(): Int {
		return switch this {
			case Buffer(buffer): buffer.byteLength;
			case BufferView(bufferView): bufferView.byteLength;
		}
	}

	#if cpp
	@:pure
	public inline function toCPointer(): cpp.Star<cpp.UInt8> {
		return switch this {
			case Buffer(buffer): buffer.toCPointer();
			case BufferView(bufferView): bufferView.toCPointer();
		}
	}
	#end

	@:from public static inline function fromBuffer(buffer: ArrayBuffer): BufferSource {
		return Buffer(buffer);
	}

	@:from public static inline function fromBufferView(bufferView: ArrayBufferView): BufferSource {
		return BufferView(bufferView);
	}

}

private enum BufferSourceType {
	Buffer(buffer: ArrayBuffer);
	BufferView(bufferView: ArrayBufferView);
}