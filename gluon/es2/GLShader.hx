package gluon.es2;

#if js
typedef GLShader = js.html.webgl.Shader;
#else
typedef GLShader = gluon.es2.native.GLShader;
#end