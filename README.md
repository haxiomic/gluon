# Gluon
- Haxe OpenGL interface, enabling unified OpenGL API for haxe targets
- Abstracts only (so no runtime overhead)
- Abstract enums are used to improve OpenGL API typing

### Design Goals
- Dependency free and minimalistic

### Versions
Gluon aims to execute with parity across platforms, consequently, it's usually bounded by the WebGL feature set (which is _approximately_ a subset of OpenGL ES)

| Gluon     | WebGL     | OpenGL |
|-----------|-----------|--------|
| es        | WebGL 1.0 | ES 2.0 |
| es2 (wip) | WebGL 2.0 | ES 3.0 |