package gluon.es2.extension;

#if js
typedef EXTFragDepth = js.html.webgl.extension.EXTFragDepth;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTFragDepth = Any;
#end