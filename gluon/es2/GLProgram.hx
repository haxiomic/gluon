package gluon.es2;

#if js
typedef GLProgram = js.html.webgl.Program;
#else
typedef GLProgram = gluon.es2.native.GLProgram;
#end