package gluon.es2.extension;

#if js
typedef WEBGLCompressedTextureS3tc = js.html.webgl.extension.WEBGLCompressedTextureS3tc;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLCompressedTextureS3tc = Any;
#end