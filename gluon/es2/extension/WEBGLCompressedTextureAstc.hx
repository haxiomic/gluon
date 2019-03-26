package gluon.es2.extension;

#if js
typedef WEBGLCompressedTextureAstc = js.html.webgl.extension.WEBGLCompressedTextureAstc;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLCompressedTextureAstc = Any;
#end