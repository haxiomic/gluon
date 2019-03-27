package gluon.es2.extension;

#if lime
typedef EXTBlendMinmax = lime.graphics.opengl.ext.EXT_blend_minmax;
#elseif js
typedef EXTBlendMinmax = js.html.webgl.extension.EXTBlendMinmax;
#end