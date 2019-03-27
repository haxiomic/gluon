package gluon.es2.extension;

#if (lime && js)
typedef EXTFragDepth = lime.graphics.opengl.ext.EXT_frag_depth;
#elseif js
typedef EXTFragDepth = js.html.webgl.extension.EXTFragDepth;
#else
typedef EXTFragDepth = Dynamic;
#end