package typedarray;

typedef ArrayBufferView =
	#if lime
	lime.utils.ArrayBufferView;
	#elseif js
	js.lib.ArrayBufferView;
	#else
	// todo
	#end
