package gluon.webgl;

#if js
typedef GLProgram = js.html.webgl.Program;
#else
typedef GLProgram = gluon.webgl.native.GLProgram;
#end