package gluon.es2;

private typedef InternalGLRenderbuffer =
	#if lime
		lime.graphics.opengl.GLRenderbuffer;
	#elseif js
		js.html.webgl.Renderbuffer;
	#else
		GLContext.GLuint;
	#end

@:notNull enum abstract GLRenderbuffer(InternalGLRenderbuffer) from InternalGLRenderbuffer to InternalGLRenderbuffer {
	var NONE = #if js null #else 0 #end;
}