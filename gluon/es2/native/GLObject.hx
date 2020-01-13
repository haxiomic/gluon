package gluon.es2.native;

import cpp.NativeGc;
import gluon.es2.GLContext.GLuint;

@:allow(gluon.es2.native.GLContext)
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