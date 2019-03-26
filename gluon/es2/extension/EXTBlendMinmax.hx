package gluon.es2.extension;

#if js
typedef EXTBlendMinmax = js.html.webgl.extension.EXTBlendMinmax;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTBlendMinmax = Any;
#end