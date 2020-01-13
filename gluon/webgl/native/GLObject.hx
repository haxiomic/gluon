package gluon.webgl.native;

import cpp.NativeGc;
import gluon.webgl.GLContext.GLuint;

@:allow(gluon.webgl.native.GLContext)
class GLObject {

    final context: GLContext;
    var handle: GLuint;

    function new(context: GLContext, handle: GLuint) {
        this.context = context;
        this.handle = handle;
        NativeGc.addFinalizable(this, false);
    }

    @:noCompletion
    public function finalize() {
        // override this in extending classes
        handle = 0;
    }

}