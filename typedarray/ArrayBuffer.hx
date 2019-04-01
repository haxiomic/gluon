package typedarray;

#if lime
typedef ArrayBuffer = lime.utils.ArrayBuffer;
#elseif js
typedef ArrayBuffer = js.lib.ArrayBuffer;
#elseif cpp
// todo
#end
