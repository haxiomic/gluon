package gluon.es2.native;

@:allow(gluon.es2.native.ES2Context)
final class GLTexture extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteTexture(this);
        handle = 0;
    }

}