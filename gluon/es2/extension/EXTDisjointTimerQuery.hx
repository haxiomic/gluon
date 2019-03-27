package gluon.es2.extension;

#if (lime && js)
typedef EXTDisjointTimerQuery = lime.graphics.opengl.ext.EXT_disjoint_timer_query;
#elseif js
typedef EXTDisjointTimerQuery = js.html.webgl.extension.EXTDisjointTimerQuery;
#else
typedef EXTDisjointTimerQuery = Dynamic;
#end
