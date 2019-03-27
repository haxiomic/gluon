package gluon.es2;

private typedef InternalGLShader =
	#if lime
		lime.graphics.opengl.GLShader;
	#elseif js
		js.html.webgl.Shader;
	#else
		GLContext.GLuint;
	#end

typedef GLShader = GLObject<InternalGLShader>;