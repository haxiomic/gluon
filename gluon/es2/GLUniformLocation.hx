package gluon.es2;

private typedef InternalGLUniformLocation =
	#if lime
		lime.graphics.opengl.GLUniformLocation;
	#elseif js
		js.html.webgl.UniformLocation;
	#else
		GLContext.GLint;
	#end

/**
	Platform consistent wrapper, so that uniform locations can be compared with null (natively these are Ints and -1 means null)
**/
abstract GLUniformLocation(GLUniformLocationEnum) from GLUniformLocationEnum to GLUniformLocationEnum {


}

// we use an enum so you can do gl.bindBuffer(..., NONE) or if (texture == NONE)
private enum abstract GLUniformLocationEnum(GLContext.GLint) from GLContext.GLint to GLContext.GLint {
	var NONE = #if js null #else -1 #end;
}