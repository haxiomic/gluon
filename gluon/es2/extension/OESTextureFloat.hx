package gluon.es2.extension;

#if lime
typedef OESTextureFloat = lime.graphics.opengl.ext.OES_texture_float;
#elseif js
typedef OESTextureFloat = js.html.webgl.extension.OESTextureFloat;
#else
typedef OESTextureFloat = Dynamic;
#end