package gluon.es2.extension;

#if js
typedef EXTTextureFilterAnisotropic = js.html.webgl.extension.EXTTextureFilterAnisotropic;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTTextureFilterAnisotropic = Any;
#end