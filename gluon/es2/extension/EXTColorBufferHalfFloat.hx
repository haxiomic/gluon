package gluon.es2.extension;

#if lime
typedef EXTColorBufferHalfFloat = lime.graphics.opengl.ext.EXT_color_buffer_half_float;
#elseif js
typedef EXTColorBufferHalfFloat = js.html.webgl.extension.EXTColorBufferHalfFloat;
#end