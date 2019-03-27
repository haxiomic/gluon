package typedarray;

typedef Uint16Array =
	#if lime
	lime.utils.UInt16Array;
	#elseif js
	js.lib.Uint16Array;
	#else
	// todo
	#end
