package gluon.es2.native;

@:allow(gluon.es2.native.GLContext)
final class GLFramebuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteFramebuffer(this);
        handle = 0;
    }

}