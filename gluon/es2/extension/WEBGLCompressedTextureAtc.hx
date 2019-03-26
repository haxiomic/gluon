package gluon.es2.extension;

#if js
typedef WEBGLCompressedTextureAtc = js.html.webgl.extension.WEBGLCompressedTextureAtc;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLCompressedTextureAtc = Any;
#end