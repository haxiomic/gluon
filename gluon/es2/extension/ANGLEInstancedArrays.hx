package gluon.es2.extension;

#if lime
typedef ANGLEInstancedArrays = lime.graphics.opengl.ext.ANGLE_instanced_arrays;
#elseif js
typedef ANGLEInstancedArrays = js.html.webgl.extension.ANGLEInstancedArrays;
#end