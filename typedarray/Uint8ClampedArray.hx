package typedarray;

typedef Uint8ClampedArray =
	#if lime
	lime.utils.UInt8ClampedArray;
	#elseif js
	js.lib.Uint8ClampedArray;
	#else
	// todo
	#end
