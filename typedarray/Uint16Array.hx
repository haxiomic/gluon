package typedarray;

typedef Uint16Array =
	#if js
	js.lib.Uint16Array;
	#else
	#end
