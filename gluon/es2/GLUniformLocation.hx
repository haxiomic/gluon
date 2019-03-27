package gluon.es2;

private typedef InternalGLUniformLocation =
	#if lime
		lime.graphics.opengl.GLUniformLocation;
	#elseif js
		js.html.webgl.UniformLocation;
	#else
		// GLContext.GLuint;
		Int;
	#end

/**
	Platform consistent wrapper, so that uniform locations can be compared with null (natively these are Ints and -1 means null)
**/
abstract GLUniformLocation(Null<InternalGLUniformLocation>) from InternalGLUniformLocation to InternalGLUniformLocation {

	#if !js
	static inline var nullValue = -1;

	@:op(A == B)
	static function eq(lhs: GLUniformLocation, rhs: GLUniformLocation): Bool;

	@:op(A == B)
	static inline function eqA(lhs: GLUniformLocation, rhs: Any) {
		var lhsInternal: Null<InternalGLUniformLocation> = lhs; 
		if (lhsInternal == nullValue && rhs == null) return true;
		if (lhsInternal == null && rhs == nullValue) return true;
		return lhsInternal == rhs;
	}

	@:op(A == B)
	static inline function eqB(lhs: Any, rhs: GLUniformLocation) {
		var rhsInternal: Null<InternalGLUniformLocation> = rhs; 
		if (rhsInternal == nullValue && lhs == null) return true;
		if (rhsInternal == null && lhs == nullValue) return true;
		return rhsInternal == lhs;
	}
	#end

}