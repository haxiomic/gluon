package typedarray;

typedef Uint8Array =
	#if js
	js.lib.Uint8Array;
	#else
	#end
