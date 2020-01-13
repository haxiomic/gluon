package gluon.webgl;

private typedef InternalGLUniformLocation =
	#if js
		js.html.webgl.UniformLocation;
	#else
		GLContext.GLint;
	#end

/**
	Platform consistent wrapper, so that uniform locations can be compared with null (natively these are Ints and -1 means null).
	We use an enum so you can do: if (uniform == NONE).
**/

@:notNull enum abstract GLUniformLocation(InternalGLUniformLocation) from InternalGLUniformLocation to InternalGLUniformLocation {
	var NONE = #if js null #else -1 #end;
}