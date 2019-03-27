package gluon.es2;

private typedef InternalGLProgram =
	#if lime
		lime.graphics.opengl.GLProgram;
	#elseif js
		js.html.webgl.Program;
	#else
		GLContext.GLuint;
	#end

typedef GLProgram = GLObject<InternalGLProgram>;