package gluon.webgl;

#if js
typedef GLShader = js.html.webgl.Shader;
#else
typedef GLShader = gluon.webgl.native.GLShader;
#end