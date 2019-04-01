package typedarray;

#if lime
typedef ArrayBufferView = lime.utils.ArrayBufferView;
#elseif js
typedef ArrayBufferView = js.lib.ArrayBufferView;
#else
interface ArrayBufferView {
	var buffer (default,null): ArrayBuffer;
	var byteOffset (default,null): Int;
	var byteLength (default,null): Int;
}
#end
