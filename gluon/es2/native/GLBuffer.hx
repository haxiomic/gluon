package gluon.es2.native;

@:allow(gluon.es2.native.ES2Context)
final class GLBuffer extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteBuffer(this);
        handle = 0;
    }

}