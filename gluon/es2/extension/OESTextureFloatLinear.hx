package gluon.es2.extension;

#if lime
typedef OESTextureFloatLinear = lime.graphics.opengl.ext.OES_texture_float_linear;
#elseif js
typedef OESTextureFloatLinear = js.html.webgl.extension.OESTextureFloatLinear;
#end