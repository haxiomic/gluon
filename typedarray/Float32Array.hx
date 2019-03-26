package typedarray;

typedef Float32Array =
	#if js
	js.lib.Float32Array;
	#else
	#end
