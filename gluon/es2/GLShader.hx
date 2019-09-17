package gluon.es2;

private typedef InternalGLShader =
	#if js
		js.html.webgl.Shader;
	#else
		GLContext.GLuint;
	#end

@:notNull enum abstract GLShader(InternalGLShader) from InternalGLShader to InternalGLShader {
	var NONE = #if js null #else 0 #end;
}