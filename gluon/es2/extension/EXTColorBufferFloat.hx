package gluon.es2.extension;

#if lime
typedef EXTColorBufferFloat = lime.graphics.opengl.ext.EXT_color_buffer_float;
#elseif js
typedef EXTColorBufferFloat = js.html.webgl.extension.EXTColorBufferFloat;
#else
typedef EXTColorBufferFloat = Dynamic;
#end