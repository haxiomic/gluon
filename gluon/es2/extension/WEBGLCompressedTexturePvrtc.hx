package gluon.es2.extension;

#if js
typedef WEBGLCompressedTexturePvrtc = js.html.webgl.extension.WEBGLCompressedTexturePvrtc;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef WEBGLCompressedTexturePvrtc = Any;
#end