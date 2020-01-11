# Gluon

<img src="https://user-images.githubusercontent.com/3742992/64806667-8fb9ce00-d58b-11e9-9f4a-bf82f83eeba9.png" />

- Haxe OpenGL interface, enabling unified OpenGL API for haxe targets (currently js and hxcpp)
- Abstracts only (so no runtime overhead)
- Abstract enums are used to improve OpenGL API typing, for example:
	`enable(cap:GLenum)`
	becomes
	`enable(cap:Capability)`
	and the compiler can autocomplete valid constants.

	Which means fewer trips to the OpenGL specification :)
- A TypedArray implementation designed for parity with JavaScript's TypedArrays

### State

- This project is ready to use with the js and hxcpp targets and is used in production projects, however a small number of GL reflection methods are not yet implemented

### Design Goals
- Dependency free and minimalistic

### Versions
Gluon aims to execute with parity across platforms, consequently, it's usually bounded by the WebGL feature set (which tracks OpenGL ES closely)

| Gluon     | WebGL     | OpenGL |
|-----------|-----------|--------|
| es2       | WebGL 1.0 | ES 2.0 |
