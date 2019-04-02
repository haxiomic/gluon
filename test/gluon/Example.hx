import gluon.es2.GLContext;
import gluon.es2.impl.CppGLContext;

class Example {

    static function main() {
        trace("Hello from haxe!");
    }

    static var gl: GLContext;

    @:keep
    static public function init() {
        gl = new CppGLContext();
    }

    @:keep
    static public function onFrame() {
        gl.clear(COLOR_BUFFER_BIT);
        gl.clearColor(0, 1, 0, 1);
    }

}