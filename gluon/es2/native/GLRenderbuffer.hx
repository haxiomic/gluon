package gluon.es2.native;

@:allow(gluon.es2.native.GLContext)
final class GLRenderbuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteRenderbuffer(this);
        handle = 0;
    }

}