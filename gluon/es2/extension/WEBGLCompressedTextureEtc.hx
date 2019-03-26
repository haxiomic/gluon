package gluon.es2.extension;

#if js
typedef WEBGLCompressedTextureEtc = js.html.webgl.extension.WEBGLCompressedTextureEtc;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLCompressedTextureEtc = Any;
#end