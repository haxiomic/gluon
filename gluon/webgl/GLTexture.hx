package gluon.webgl;

#if js
typedef GLTexture = js.html.webgl.Texture;
#else
typedef GLTexture = gluon.webgl.native.GLTexture;
#end