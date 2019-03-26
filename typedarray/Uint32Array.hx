package typedarray;

typedef Uint32Array =
	#if js
	js.lib.Uint32Array;
	#else
	#end
