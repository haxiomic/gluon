package gluon.webgl.native;

@:allow(gluon.webgl.native.GLContext)
final class GLRenderbuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteRenderbuffer(this);
        handle = 0;
    }

}