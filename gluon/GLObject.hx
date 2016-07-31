package gluon;

abstract GLObject<InternalType>(InternalType){
	
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
		return v != 0 ? untyped v : null;
		#else
		#end
	}

}