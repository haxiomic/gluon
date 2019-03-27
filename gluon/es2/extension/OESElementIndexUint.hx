package gluon.es2.extension;

#if lime
typedef OESElementIndexUint = lime.graphics.opengl.ext.OES_element_index_uint;
#elseif js
typedef OESElementIndexUint = js.html.webgl.extension.OESElementIndexUint;
#end