package gluon.webgl.native;

@:allow(gluon.webgl.native.GLContext)
final class GLBuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteBuffer(this);
        handle = 0;
    }

}