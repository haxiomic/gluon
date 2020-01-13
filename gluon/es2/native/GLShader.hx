package gluon.es2.native;

@:allow(gluon.es2.native.ES2Context)
final class GLShader extends GLObject {

    @:noCompletion
    override public function finalize() {
        context.deleteShader(this);
        handle = 0;
    }

}