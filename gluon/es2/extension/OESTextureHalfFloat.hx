package gluon.es2.extension;

#if lime
typedef OESTextureHalfFloat = lime.graphics.opengl.ext.EXT_color_buffer_half_float;
#elseif js
typedef OESTextureHalfFloat = js.html.webgl.extension.OESTextureHalfFloat;
#end