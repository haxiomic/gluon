package typedarray;

typedef Uint8ClampedArray =
	#if js
	js.lib.Uint8ClampedArray;
	#else
	#end
