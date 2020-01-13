package gluon.es2;

#if js
typedef GLRenderbuffer = js.html.webgl.Renderbuffer;
#else
typedef GLRenderbuffer = gluon.es2.native.GLRenderbuffer;
#end