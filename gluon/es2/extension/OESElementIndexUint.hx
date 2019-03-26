package gluon.es2.extension;

#if js
typedef OESElementIndexUint = js.html.webgl.extension.OESElementIndexUint;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESElementIndexUint = Any;
#end