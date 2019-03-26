package typedarray;

typedef ArrayBufferView =
	#if js
	js.lib.ArrayBufferView;
	#else
	#end
