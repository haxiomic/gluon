package typedarray;

typedef ArrayBuffer =
	#if lime
	lime.utils.ArrayBuffer;
	#elseif js
	js.lib.ArrayBuffer;
	#else
	// todo
	#end
