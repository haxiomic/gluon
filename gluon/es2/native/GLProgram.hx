package gluon.es2.native;

@:allow(gluon.es2.native.ES2Context)
final class GLProgram extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteProgram(this);
        handle = 0;
    }

}