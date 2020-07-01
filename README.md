# Gluon

<img src="https://user-images.githubusercontent.com/3742992/64806667-8fb9ce00-d58b-11e9-9f4a-bf82f83eeba9.png" />

- WebGL implementation for **js** and **cpp** targets with additional typing for better integration with haxe
- Abstract enums are used to type constants, for example:
	`enable(cap:GLenum)`
	becomes
	`enable(cap:Capability)`
	and the compiler can autocomplete valid constants.

	Which means fewer trips to the OpenGL specification :)
- Includes a TypedArray implementation designed for parity with JavaScript's TypedArrays
- GPU resources are freed with garbage collection however best practice is to still do this manually with the gl.delete* methods because both hxcpp and browser garbage collectors [cannot properly estimate memory pressure of GPU objects](https://stackoverflow.com/a/31250301/4038621)

### Examples
See [EXAMPLES.md](EXAMPLES.md)

### Design Goals
- Dependency free and minimalistic