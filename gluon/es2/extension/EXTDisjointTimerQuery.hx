package gluon.es2.extension;

#if js
typedef EXTDisjointTimerQuery = js.html.webgl.extension.EXTDisjointTimerQuery;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTDisjointTimerQuery = Any;
#end