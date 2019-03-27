package gluon.es2;

private typedef InternalGLTexture =
	#if lime
		lime.graphics.opengl.GLTexture;
	#elseif js
		js.html.webgl.Texture;
	#else
		GLContext.GLuint;
	#end

typedef GLTexture = GLObject<InternalGLTexture>;