package typedarray;

typedef Uint8Array =
	#if lime
	lime.utils.UInt8Array;
	#elseif js
	js.lib.Uint8Array;
	#else
	// todo
	#end
