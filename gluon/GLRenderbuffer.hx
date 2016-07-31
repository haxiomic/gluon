package gluon;

private typedef InternalGLRenderbuffer =
	#if js
		js.html.webgl.Renderbuffer;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLRenderbuffer(GLObject<InternalGLRenderbuffer>) to GLObject<InternalGLRenderbuffer> from GLObject<InternalGLRenderbuffer>{}