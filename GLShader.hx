package gluon;

private typedef InternalGLShader =
	#if js
		js.html.webgl.Shader;
	#else if cpp
		GLuint;
	#end

abstract GLShader(InternalGLShader){

	@:to
	inline function toInternal():InternalGLShader{
		#if js
		return this;
		#else if cpp
		return this != null ? this : 0;
		#else
		#end
	}

	@:from
	static inline function fromInternal(v:InternalGLShader):GLShader{
		#if js
		return untyped v;
		#else if cpp
		return v != 0 ? untyped v : null;
		#else
		#end
	}

}