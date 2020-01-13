package gluon.es2.native;

import cpp.NativeGc;
import gluon.es2.GLContext.GLuint;

@:allow(gluon.es2.native.ES2Context)
class GLObject {

    final context: ES2Context;
    var handle: GLuint;

    function new(context: ES2Context, handle: GLuint) {
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