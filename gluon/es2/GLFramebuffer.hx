package gluon.es2;

private typedef InternalGLFramebuffer =
	#if js
		js.html.webgl.Framebuffer;
	#else if cpp
		GLuint;
	#end

typedef GLFramebuffer = GLObject<InternalGLFramebuffer>;