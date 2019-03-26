package typedarray;
typedef Int32Array =
	#if js
	js.lib.Int32Array;
	#else
	#end
