package gluon.es;

private typedef InternalGLTexture =
	#if js
		js.html.webgl.Texture;
	#else if cpp
		GLuint;
	#end

@:forward
abstract GLTexture(GLObject<InternalGLTexture>) to GLObject<InternalGLTexture> from GLObject<InternalGLTexture>{}