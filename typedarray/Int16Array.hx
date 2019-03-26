package typedarray;

typedef Int16Array =
	#if js
	js.lib.Int16Array;
	#else
	#end
