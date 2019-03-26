package gluon.es2.extension;

#if js
typedef OESVertexArrayObject = js.html.webgl.extension.OESVertexArrayObject;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef OESVertexArrayObject = Any;
#end