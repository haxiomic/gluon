package gluon.es;

private typedef InternalGLBuffer =
	#if js
		js.html.webgl.Buffer;
	#else if cpp
		GLuint;
	#end

typedef GLBuffer = GLObject<InternalGLBuffer>;