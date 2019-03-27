package typedarray;

typedef DataView =
	#if lime
	lime.utils.DataView;
	#elseif js
	js.lib.DataView;
	#else
	// todo
	#end
