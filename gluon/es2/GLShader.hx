package gluon.es2;

private typedef InternalGLShader =
	#if js
		js.html.webgl.Shader;
	#else if cpp
		GLuint;
	#end

typedef GLShader = GLObject<InternalGLShader>;