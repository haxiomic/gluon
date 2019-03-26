package gluon.es2.extension;

#if js
typedef EXTColorBufferFloat = js.html.webgl.extension.EXTColorBufferFloat;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTColorBufferFloat = Any;
#end