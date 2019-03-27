package gluon.es2.extension;

#if lime
typedef EXTSrgb = lime.graphics.opengl.ext.EXT_sRGB;
#elseif js
typedef EXTSrgb = js.html.webgl.extension.EXTSrgb;
#end