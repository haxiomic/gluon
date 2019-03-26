package gluon.es2.extension;

#if js
typedef WEBGLColorBufferFloat = js.html.webgl.extension.WEBGLColorBufferFloat;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLColorBufferFloat = Any;
#end