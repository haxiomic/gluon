package gluon.es2.extension;

#if js
typedef EXTColorBufferHalfFloat = js.html.webgl.extension.EXTColorBufferHalfFloat;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTColorBufferHalfFloat = Any;
#end