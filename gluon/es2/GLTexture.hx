package gluon.es2;

#if js
typedef GLTexture = js.html.webgl.Texture;
#else
typedef GLTexture = gluon.es2.native.GLTexture;
#end