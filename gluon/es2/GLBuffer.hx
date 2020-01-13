package gluon.es2;

#if js
typedef GLBuffer = js.html.webgl.Buffer;
#else
typedef GLBuffer = gluon.es2.native.GLBuffer;
#end