package gluon.webgl.native;

@:allow(gluon.webgl.native.GLContext)
final class GLProgram extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteProgram(this);
        handle = 0;
    }

}