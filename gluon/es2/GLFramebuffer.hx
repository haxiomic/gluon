package gluon.es2;

#if js
typedef GLFramebuffer = js.html.webgl.Framebuffer;
#else
typedef GLFramebuffer = gluon.es2.native.GLFramebuffer;
#end