package typedarray;

typedef Float64Array =
	#if js
	js.lib.Float64Array;
	#else
	#end
