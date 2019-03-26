package gluon.es2.extension;

#if js
typedef OESStandardDerivatives = js.html.webgl.extension.OESStandardDerivatives;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESStandardDerivatives = Any;
#end