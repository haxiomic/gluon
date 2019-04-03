package gluon.es2;

private typedef InternalGLTexture =
	#if lime
		lime.graphics.opengl.GLTexture;
	#elseif js
		js.html.webgl.Texture;
	#else
		GLContext.GLuint;
	#end

// typedef GLTexture = GLObject<InternalGLTexture>;

@:notNull enum abstract GLTexture(InternalGLTexture) from InternalGLTexture to InternalGLTexture {
	var NONE = #if js null #else 0 #end;
}