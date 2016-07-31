package gluon;

private typedef InternalGLBuffer =
	#if js
		js.html.webgl.Buffer;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLBuffer(GLObject<InternalGLBuffer>) to GLObject<InternalGLBuffer> from GLObject<InternalGLBuffer>{}