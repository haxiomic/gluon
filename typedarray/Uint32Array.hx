package typedarray;

typedef Uint32Array =
	#if lime
	lime.utils.UInt32Array;
	#elseif js
	js.lib.Uint32Array;
	#else
	// todo
	#end
