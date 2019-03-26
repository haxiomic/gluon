package gluon.es2.extension;

#if js
typedef OESTextureHalfFloatLinear = js.html.webgl.extension.OESTextureHalfFloatLinear;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESTextureHalfFloatLinear = Any;
#end