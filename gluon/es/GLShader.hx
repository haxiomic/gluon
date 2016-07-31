package gluon.es;

private typedef InternalGLShader =
	#if js
		js.html.webgl.Shader;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLShader(GLObject<InternalGLShader>) to GLObject<InternalGLShader> from GLObject<InternalGLShader>{}