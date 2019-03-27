package gluon.es2.extension;

#if lime
typedef EXTTextureFilterAnisotropic = lime.graphics.opengl.ext.EXT_texture_filter_anisotropic;
#elseif js
typedef EXTTextureFilterAnisotropic = js.html.webgl.extension.EXTTextureFilterAnisotropic;
#end