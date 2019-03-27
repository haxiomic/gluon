package gluon.es2;

typedef InternalGLBuffer =
	#if lime
		lime.graphics.opengl.GLBuffer;
	#elseif js
		js.html.webgl.Buffer;
	#else
		GLContext.GLuint;
	#end

typedef GLBuffer = GLObject<InternalGLBuffer>;