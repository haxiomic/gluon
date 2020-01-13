package gluon.webgl.native;

@:allow(gluon.webgl.native.GLContext)
final class GLFramebuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteFramebuffer(this);
        handle = 0;
    }

}