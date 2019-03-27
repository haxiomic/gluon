package gluon.es2.extension;

#if (lime && js)
typedef WEBGLColorBufferFloat = lime.graphics.opengl.ext.WEBGL_color_buffer_float;
#elseif js
typedef WEBGLColorBufferFloat = js.html.webgl.extension.WEBGLColorBufferFloat;
#else
typedef WEBGLColorBufferFloat = Any;
#end