package gluon.es2;

import gluon.es2.GLContext;

typedef GLActiveInfo = {
	var size(default, null):GLint;
	var type(default, null):UniformType;
	var name(default, null):String;
}