package gluon.es2;

/**
	Platform consistent wrapper, so that objects can be compared with null (natively these are Ints and 0 means null)
**/
abstract GLObject<InternalType>(Null<InternalType>) from InternalType to InternalType {

	public var invalidated(get, never):Bool;

	inline function get_invalidated(){
		#if js
		return untyped !!this.invalidated;
		#else
		return false;
		#end
	}

	#if !js
	static inline var nullValue = 0;

	@:op(A == B)
	static function eq(lhs: GLObject<Any>, rhs: GLObject<Any>): Bool;

	@:op(A == B)
	static inline function eqA<T>(lhs: GLObject<T>, rhs: Any) {
		var lhsInternal: Null<T> = cast lhs; 
		if (lhsInternal == (cast nullValue) && rhs == null) return true;
		if (lhsInternal == null && rhs == nullValue) return true;
		return lhsInternal == rhs;
	}

	@:op(A == B)
	static inline function eqB<T>(lhs: Any, rhs: GLObject<T>) {
		var rhsInternal: Null<T> = cast rhs; 
		if (rhsInternal == (cast nullValue) && lhs == null) return true;
		if (rhsInternal == null && lhs == nullValue) return true;
		return rhsInternal == lhs;
	}
	#end

}