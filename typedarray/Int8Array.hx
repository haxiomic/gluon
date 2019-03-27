package typedarray;

typedef Int8Array =
	#if lime
	lime.utils.Int8Array;
	#elseif js
	js.lib.Int8Array;
	#else
	// todo
	#end
