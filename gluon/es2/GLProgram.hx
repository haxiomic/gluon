package gluon.es2;

private typedef InternalGLProgram =
	#if js
		js.html.webgl.Program;
	#else
		GLContext.GLuint;
	#end

@:notNull enum abstract GLProgram(InternalGLProgram) from InternalGLProgram to InternalGLProgram {
	var NONE = #if js null #else 0 #end;
}