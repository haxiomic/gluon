package gluon.es2.extension;

#if js
typedef OESTextureFloatLinear = js.html.webgl.extension.OESTextureFloatLinear;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESTextureFloatLinear = Any;
#end