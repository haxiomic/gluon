package gluon.es;

private typedef InternalGLProgram =
	#if js
		js.html.webgl.Program;
	#else if cpp
		GLuint;
	#end

typedef GLProgram = GLObject<InternalGLProgram>;