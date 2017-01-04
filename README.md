# Gluon
- Haxe OpenGL interface, enabling unified OpenGL API for haxe targets
- Abstracts only (so no runtime overhead)
- Abstract enums are used to improve OpenGL API typing, for example:
	`enable(cap:GLenum)`
	becomes
	`enable(cap:Capability)`
	so the compiler can autocomplete valid constants

### Design Goals
- Dependency free and minimalistic

### Versions
Gluon aims to execute with parity across platforms, consequently, it's usually bounded by the WebGL feature set (which tracks OpenGL ES closely)

| Gluon     | WebGL     | OpenGL |
|-----------|-----------|--------|
| es2       | WebGL 1.0 | ES 2.0 |
| es3       | WebGL 2.0 | ES 3.0 |