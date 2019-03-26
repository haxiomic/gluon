package gluon.es2.extension;

#if js
typedef WEBGLLoseContext = js.html.webgl.extension.WEBGLLoseContext;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLLoseContext = Any;
#end