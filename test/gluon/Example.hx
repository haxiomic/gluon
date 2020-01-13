import gluon.webgl.GLContext;

class Example {

    static function main() {
        trace("Hello from haxe!");
    }

    static var gl: GLContext;

    @:keep
    static public function init() {
        gl = new gluon.webgl.native.GLContext();

        gl.bindFramebuffer(FRAMEBUFFER, null);
        gl.bindBuffer(ARRAY_BUFFER, null);

        trace(gl.getShaderPrecisionFormat(FRAGMENT_SHADER, LOW_INT));
        trace('getVertexAttribOffset', gl.getVertexAttribOffset(0, VERTEX_ATTRIB_ARRAY_POINTER));
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