package typedarray;

/**
	"The BufferSource typedef is used to represent objects that are either themselves an ArrayBuffer or which provide a view on to an ArrayBuffer."

	https://heycam.github.io/webidl/#BufferSource
**/

@:forward
abstract BufferSource(ArrayBuffer) to ArrayBuffer from ArrayBuffer {
	
	// handle lime-specific byteLength...
	public var byteLength(get, never): Int;
	private inline function get_byteLength() {
		#if (lime && !js)
		return this.length;
		#else
		return this.byteLength;
		#end
	}

	@:from public static inline function fromBufferView(view: ArrayBufferView) {
		return cast view.buffer;
	}

}