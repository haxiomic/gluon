package gluon.es2.extension;

#if js
typedef OESTextureHalfFloat = js.html.webgl.extension.OESTextureHalfFloat;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESTextureHalfFloat = Any;
#end