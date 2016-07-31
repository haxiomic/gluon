package gluon;

private typedef InternalGLFramebuffer =
	#if js
		js.html.webgl.Framebuffer;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLFramebuffer(GLObject<InternalGLFramebuffer>) to GLObject<InternalGLFramebuffer> from GLObject<InternalGLFramebuffer>{}