package gluon.es2.extension;

#if lime
typedef OESTextureHalfFloat = lime.graphics.opengl.ext.OES_texture_half_float;
#elseif js
typedef OESTextureHalfFloat = js.html.webgl.extension.OESTextureHalfFloat;
#end