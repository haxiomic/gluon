package gluon;

private typedef InternalGLUniformLocation =
	#if js
		js.html.webgl.UniformLocation;
	#else if cpp
		GLint;
	#end

abstract GLUniformLocation(InternalGLUniformLocation){

	@:to
	inline function toInternal():InternalGLUniformLocation{
		#if js
		return this;
		#else if cpp
		return this != null ? this : -1;
		#else
		#end
	}

	@:from
	static inline function fromInternal<InternalGLUniformLocation>(v:InternalGLUniformLocation):GLUniformLocation{
		#if js
		return untyped v;
		#else if cpp
		return v != -1 ? untyped v : null;
		#else
		#end
	}

}