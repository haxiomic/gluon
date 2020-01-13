package gluon.es2.native;

@:allow(gluon.es2.native.GLContext)
final class GLProgram extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteProgram(this);
        handle = 0;
    }

}