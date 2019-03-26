package gluon.es2.extension;

#if js
typedef WEBGLDrawBuffers = js.html.webgl.extension.WEBGLDrawBuffers;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLDrawBuffers = Any;
#end