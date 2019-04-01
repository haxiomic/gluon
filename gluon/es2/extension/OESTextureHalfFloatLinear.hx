package gluon.es2.extension;

#if lime
typedef OESTextureHalfFloatLinear = lime.graphics.opengl.ext.OES_texture_half_float_linear;
#elseif js
typedef OESTextureHalfFloatLinear = js.html.webgl.extension.OESTextureHalfFloatLinear;
#else
typedef OESTextureHalfFloatLinear = Dynamic;
#end