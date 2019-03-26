package gluon.es2.extension;

#if js
typedef EXTShaderTextureLod = js.html.webgl.extension.EXTShaderTextureLod;
#else
@:deprecated("@! typed extensions not yet complete for this target")
typedef EXTShaderTextureLod = Any;
#end