package gluon.es2.extension;

#if js
typedef WEBGLDepthTexture = js.html.webgl.extension.WEBGLDepthTexture;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLDepthTexture = Any;
#end