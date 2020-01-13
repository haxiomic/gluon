package gluon.es2.native;

@:allow(gluon.es2.native.GLContext)
final class GLBuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteBuffer(this);
        handle = 0;
    }

}