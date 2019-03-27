package typedarray;

typedef Float64Array =
	#if lime
	lime.utils.Float64Array;
	#elseif js
	js.lib.Float64Array;
	#else
	// todo
	#end
