package gluon.es2;

private typedef InternalGLFramebuffer =
	#if lime
		lime.graphics.opengl.GLFramebuffer;
	#elseif js
		js.html.webgl.Framebuffer;
	#else
		GLContext.GLuint;
	#end

typedef GLFramebuffer = GLObject<InternalGLFramebuffer>;