package gluon.es2.extension;

#if lime
typedef OESVertexArrayObject = lime.graphics.opengl.ext.OES_vertex_array_object;
#elseif js
typedef OESVertexArrayObject = js.html.webgl.extension.EXTTextureFilterAnisotropic;
#else
typedef OESVertexArrayObject = Dynamic;
#end