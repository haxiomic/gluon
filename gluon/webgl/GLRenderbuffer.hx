package gluon.webgl;

#if js
typedef GLRenderbuffer = js.html.webgl.Renderbuffer;
#else
typedef GLRenderbuffer = gluon.webgl.native.GLRenderbuffer;
#end