package gluon.es2;

typedef InternalGLBuffer =
	#if js
		js.html.webgl.Buffer;
	#else
		GLContext.GLuint;
	#end

@:notNull enum abstract GLBuffer(InternalGLBuffer) from InternalGLBuffer to InternalGLBuffer {
	var NONE = #if js null #else 0 #end;
}