package gluon.es2.extension;

#if js
typedef EXTSrgb = js.html.webgl.extension.EXTSrgb;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTSrgb = Any;
#end