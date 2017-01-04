package gluon.es2;

abstract GLObject<InternalType>(InternalType){

	public var invalidated(get, never):Bool;

	inline function get_invalidated(){
		#if js
		return untyped !!this.invalidated;
		#else
		return false;
		#end
	}
	
	@:to
	inline function toInternal():InternalType{
		#if js
		return this;
		#else if cpp
		return this != null ? this : 0;
		#else
		#end
	}

	@:from
	static inline function fromInternal<InternalType>(v:InternalType):GLObject<InternalType>{
		#if js
		return untyped v;
		#else if cpp
		return (v != 0) ? untyped v : null;
		#else
		#end
	}

}