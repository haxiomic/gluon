package gluon.webgl;

#if js
typedef GLFramebuffer = js.html.webgl.Framebuffer;
#else
typedef GLFramebuffer = gluon.webgl.native.GLFramebuffer;
#end