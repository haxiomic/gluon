package gluon.es2.extension;

#if js
typedef WEBGLDebugShaders = js.html.webgl.extension.WEBGLDebugShaders;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLDebugShaders = Any;
#end