import gluon.webgl.GLContext;
import gluon.webgl.native.GLContext;

class Example {

    static function main() {
        trace("Hello from haxe!");
    }

    static var gl: GLContext;

    @:keep
    static public function init() {
        gl = new GLContext();
    }

    @:keep
    static public function onFrame() {
        cpp.vm.Gc.run(true);

        var t_s = haxe.Timer.stamp();

        // execute commands on the OpenGL context
        gl.clearColor(Math.sin(t_s * 0.1), Math.cos(t_s * 0.5), Math.sin(t_s * 0.3), 1);
        gl.clear(COLOR_BUFFER_BIT);
    }

}