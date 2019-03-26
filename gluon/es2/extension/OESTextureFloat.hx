package gluon.es2.extension;

#if js
typedef OESTextureFloat = js.html.webgl.extension.OESTextureFloat;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESTextureFloat = Any;
#end