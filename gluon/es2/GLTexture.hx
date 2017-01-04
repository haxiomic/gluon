package gluon.es2;

private typedef InternalGLTexture =
	#if js
		js.html.webgl.Texture;
	#else if cpp
		GLuint;
	#end

typedef GLTexture = GLObject<InternalGLTexture>;