package gluon;

import gluon.GLContext;

typedef GLShaderPrecisionFormat = {
    var rangeMin(default, null):GLint;
    var rangeMax(default, null):GLint;
    var precision(default, null):GLint;
}