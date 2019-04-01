package typedarray;

#if lime

typedef ArrayBuffer = lime.utils.ArrayBuffer;

#elseif js

typedef ArrayBuffer = js.lib.ArrayBuffer;

#elseif cpp

@:nullSafety
abstract ArrayBuffer(haxe.io.Bytes) from haxe.io.Bytes to haxe.io.Bytes {

	public var byteLength (get, never): Int;
	
	@:pure
	public inline function new(length: Int) {
		this = haxe.io.Bytes.alloc(length);
	}

	/**
		Returns a new ArrayBuffer whose contents are a copy of this ArrayBuffer's bytes from begin, inclusive, up to end, exclusive. If either begin or end is negative, it refers to an index from the end of the array, as opposed to from the beginning.
	**/
	@:pure
	public function slice(begin: Int, ?end: Int): ArrayBuffer {
		final lastIndex = this.length - 1;

		if (end == null) {
			end = this.length;
		}

		if (begin < 0) {
			begin = this.length + begin;
		}

		if (end < 0) {
			end = this.length + end;
		}

		end = imin(imax(end, 0), this.length);
		begin = imin(imax(begin, 0), lastIndex);

		var copyLength = imax(end - begin, 0);

		var copy: haxe.io.Bytes = new ArrayBuffer(copyLength);
		copy.blit(0, this, begin, copyLength);

		return copy;
	}

	@:pure inline function imax(a: Int, b: Int) return a > b ? a : b;
	@:pure inline function imin(a: Int, b: Int) return a < b ? a : b;

	@:pure inline function get_byteLength(): Int {
		return this.length;
	}

	static public inline function isView(value: Dynamic): Bool {
		return Std.is(value, ArrayBufferView.ArrayBufferViewBase);
	}

}

#end
