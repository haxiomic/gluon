package gluon.es2.native;

@:allow(gluon.es2.native.GLContext)
final class GLTexture extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteTexture(this);
        handle = 0;
    }

}