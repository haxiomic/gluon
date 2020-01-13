package gluon.webgl.native;

@:allow(gluon.webgl.native.GLContext)
final class GLTexture extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteTexture(this);
        handle = 0;
    }

}