package gluon.es2.extension;

#if js
typedef ANGLEInstancedArrays = js.html.webgl.extension.ANGLEInstancedArrays;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef ANGLEInstancedArrays = Any;
#end