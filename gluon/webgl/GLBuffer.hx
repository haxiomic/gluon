package gluon.webgl;

#if js
typedef GLBuffer = js.html.webgl.Buffer;
#else
typedef GLBuffer = gluon.webgl.native.GLBuffer;
#end