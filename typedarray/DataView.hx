package typedarray;

typedef DataView =
	#if js
	js.lib.DataView;
	#else
	#end
