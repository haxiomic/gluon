package typedarray;

typedef Int16Array =
	#if lime
	lime.utils.Int16Array;
	#elseif js
	js.lib.Int16Array;
	#else
	// todo
	#end
