package gluon.es2;

import gluon.es2.GLContext.GLuint;
/**
	Platform consistent wrapper, so that objects can be compared with null (natively these are Ints and 0 means null)
**/
@:forward
@:notNull abstract GLObject<InternalType>(GLObjectEnum) from GLObjectEnum to GLObjectEnum {

	public var invalidated(get, never):Bool;

	inline function get_invalidated(){
		#if js
		return untyped !!this.invalidated;
		#else
		return false;
		#end
	}

}

// we use an enum so you can do gl.bindBuffer(..., NONE) or if (texture == NONE)
private enum abstract GLObjectEnum(GLContext.GLuint) from GLContext.GLuint to GLContext.GLuint {
	var NONE = #if js null #else 0 #end;
}