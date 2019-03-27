package gluon.es2;

private typedef InternalGLRenderbuffer =
	#if lime
		lime.graphics.opengl.GLRenderbuffer;
	#elseif js
		js.html.webgl.Renderbuffer;
	#else
		GLContext.GLuint;
	#end

typedef GLRenderbuffer = GLObject<InternalGLRenderbuffer>;