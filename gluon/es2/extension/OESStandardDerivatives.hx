package gluon.es2.extension;

#if lime
typedef OESStandardDerivatives = lime.graphics.opengl.ext.OES_standard_derivatives;
#elseif js
typedef OESStandardDerivatives = js.html.webgl.extension.OESStandardDerivatives;
#else
typedef OESStandardDerivatives = Dynamic;
#end