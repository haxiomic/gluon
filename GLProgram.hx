package gluon;

private typedef InternalGLProgram =
	#if js
		js.html.webgl.Program;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLProgram(GLObject<InternalGLProgram>) to GLObject<InternalGLProgram> from GLObject<InternalGLProgram>{}