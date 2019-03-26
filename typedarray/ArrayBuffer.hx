package typedarray;

typedef ArrayBuffer =
	#if js
	js.lib.ArrayBuffer;
	#else
	#end
