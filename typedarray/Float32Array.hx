package typedarray;

typedef Float32Array =
	#if lime
	lime.utils.Float32Array;
	#elseif js
	js.lib.Float32Array;
	#else
	// todo
	#end
