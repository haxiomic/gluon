package typedarray;

typedef Int32Array =
	#if lime
	lime.utils.Int32Array;
	#elseif js
	js.lib.Int32Array;
	#else
	// todo
	#end
