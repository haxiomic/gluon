package gluon.es2.extension;

#if lime
typedef EXTShaderTextureLod = lime.graphics.opengl.ext.EXT_shader_texture_lod;
#elseif js
typedef EXTShaderTextureLod = js.html.webgl.extension.EXTShaderTextureLod;
#else
typedef EXTShaderTextureLod = Dynamic;
#end