package typedarray;

typedef Int8Array =
	#if js
	js.lib.Int8Array;
	#else
	#end
