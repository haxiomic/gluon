package gluon.es2.extension;

#if js
typedef WEBGLDebugRendererInfo = js.html.webgl.extension.WEBGLDebugRendererInfo;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLDebugRendererInfo = Any;
#end