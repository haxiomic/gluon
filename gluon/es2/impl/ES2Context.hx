package gluon.es2.impl;

#if !macro

import gluon.es2.GLContext;
import typedarray.Uint32Array;
import typedarray.Int32Array;
import typedarray.Float32Array;
import typedarray.Uint8Array;
import typedarray.BufferSource;
import cpp.RawConstPointer;
import cpp.Native;
import cpp.ConstCharStar;
import cpp.RawPointer;

#if windows

@:cppFileCode("
#include <GL/glew.h>
")

#elseif macos

@:cppFileCode("
#include <OpenGL/gl3.h>
#include <OpenGL/gl3ext.h>
")

#else

@:cppFileCode("
#define GL_GLEXT_PROTOTYPES
#include <GLES2/gl2.h>
")

#end
@:build(gluon.es2.impl.ES2Context.Macro.addBuildConfig())
@:unreflective
class ES2Context {

	#if windows
	
	// initialize GLEW on platforms that require it
	static var glewInitialized = false;
	static function initGlew(): Bool {
		var success: Bool = false;
		untyped __cpp__('
			glewExperimental = GL_TRUE;
			{0} = glewInit() == GLEW_OK; 
		', success);
		return success;
	}

	public function new() {
		if (!glewInitialized) {
			glewInitialized = initGlew();
			if (!glewInitialized) {
				trace("Failed to initialize GLEW");
			}
		}
	}

	#else

	public function new() { }

	#end

	public function getContextAttributes():GLContextAttributes {
		throw 'todo - getContextAttributes';
		return untyped __global__.glGetContextAttributes();
	}

	var _supportedExtensionsCache: Null<Array<String>> = null;
	public function getSupportedExtensions():Array<String> {
		if (_supportedExtensionsCache == null) {
			var extensions = getString(EXTENSIONS);
			// remove GL_ prefix
			_supportedExtensionsCache = extensions.split(' ').map(name -> name.substr(3));
		}

		return _supportedExtensionsCache.copy();
	}

	public function getExtension<T>(name: Extension<T>):T {
		var isSupported = getSupportedExtensions().indexOf(name) != -1;
		return isSupported ? cast {} : null;
	}

	public function activeTexture(unit:TextureUnit) {
		untyped __global__.glActiveTexture(unit);
	}

	public function attachShader(program:GLProgram, shader:GLShader) {
		untyped __global__.glAttachShader(program, shader);
	}

	public function bindAttribLocation(program:GLProgram, index:GLuint, name:String) {
		var nameCharStar = ConstCharStar.fromString(name);
		untyped __global__.glBindAttribLocation(program, index, nameCharStar);
	}

	public function bindBuffer(target:BufferTarget, buffer:GLBuffer) {
		untyped __global__.glBindBuffer(target, buffer);
	}

	public function bindFramebuffer(target:FramebufferTarget, framebuffer:GLFramebuffer) {
		untyped __global__.glBindFramebuffer(target, framebuffer);
	}

	public function bindRenderbuffer(target:RenderbufferTarget, renderbuffer:GLRenderbuffer) {
		untyped __global__.glBindRenderbuffer(target, renderbuffer);
	}

	public function bindTexture(target:TextureTarget, texture:GLTexture) {
		untyped __global__.glBindTexture(target, texture);
	}

	public function blendColor(red:GLclampf, green:GLclampf, blue:GLclampf, alpha:GLclampf) {
		untyped __global__.glBlendColor(red, green, blue, alpha);
	}

	public function blendEquation(mode:BlendEquation) {
		untyped __global__.glBlendEquation(mode);
	}

	public function blendEquationSeparate(modeRGB:BlendEquation, modeAlpha:BlendEquation) {
		untyped __global__.glBlendEquationSeparate(modeRGB, modeAlpha);
	}

	public function blendFunc(sfactor:BlendFactor, dfactor:BlendFactor) {
		untyped __global__.glBlendFunc(sfactor, dfactor);
	}

	public function blendFuncSeparate(srcRGB:BlendFactor, dstRGB:BlendFactor, srcAlpha:BlendFactor, dstAlpha:BlendFactor) {
		untyped __global__.glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha);
	}

	public function bufferData(target:BufferTarget, data:BufferSource, usage:BufferUsage) {
		untyped __global__.glBufferData(target, data.byteLength, data.toCPointer(), usage);
	}

	public function bufferDataOfSize(target:BufferTarget, size:Int, usage:BufferUsage) {
		untyped __global__.glBufferData(target, size, 0, usage);
	}

	public function bufferSubData(target:BufferTarget, offset:GLintptr, data:BufferSource) {
		untyped __global__.glBufferSubData(target, offset, data.byteLength, data.toCPointer());
	}

	public function checkFramebufferStatus(target:FramebufferTarget):FramebufferStatus {
		return untyped __global__.glCheckFramebufferStatus(target);
	}

	public function clear(mask:ClearBufferMask) {
		untyped __global__.glClear(mask);
	}

	public function clearColor(red:GLclampf, green:GLclampf, blue:GLclampf, alpha:GLclampf) {
		untyped __global__.glClearColor(red, green, blue, alpha);
	}

	public function clearDepth(depth:GLclampf) {
		untyped __global__.glClearDepthf(depth);
	}

	public function clearStencil(s:GLint) {
		untyped __global__.glClearStencil(s);
	}

	public function colorMask(red:Bool, green:Bool, blue:Bool, alpha:Bool) {
		untyped __global__.glColorMask(red, green, blue, alpha);
	}

	public function compileShader(shader:GLShader) {
		untyped __global__.glCompileShader(shader);
	}

	public function compressedTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, width:GLsizei, height:GLsizei, border:GLint, data:GLArrayBufferView) {
		var ptr: cpp.Star<cpp.UInt8> = data != null ? data.toCPointer() : null;
		untyped __global__.glCompressedTexImage2D(target, level, internalformat, width, height, border, data.byteLength, ptr);
	}

	public function compressedTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, data:GLArrayBufferView) {
		var ptr: cpp.Star<cpp.UInt8> = data != null ? data.toCPointer() : null;
		untyped __global__.glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, data.byteLength, ptr);
	}

	public function copyTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, x:GLint, y:GLint, width:GLsizei, height:GLsizei, border:GLint) {
		untyped __global__.glCopyTexImage2D(target, level, internalformat, x, y, width, height, border);
	}

	public function copyTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, x:GLint, y:GLint, width:GLsizei, height:GLsizei) {
		untyped __global__.glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);
	}

	public function createBuffer():GLBuffer {
		var ref: GLuint = 0;
		untyped __global__.glGenBuffers(1, Native.addressOf(ref));
		return ref;
	}

	public function createFramebuffer():GLFramebuffer {
		var ref: GLuint = 0;
		untyped __global__.glGenFramebuffers(1, Native.addressOf(ref));
		return ref;
	}

	public function createProgram():GLProgram {
		return untyped __global__.glCreateProgram();
	}

	public function createRenderbuffer():GLRenderbuffer {
		var ref: GLuint = 0;
		untyped __global__.glGenRenderbuffers(1, Native.addressOf(ref));
		return ref;
	}

	public function createShader(type:ShaderType):GLShader {
		return untyped __global__.glCreateShader(type);
	}

	public function createTexture():GLTexture {
		var ref: GLuint = 0;
		untyped __global__.glGenTextures(1, Native.addressOf(ref));
		return ref;
	}

	public function cullFace(mode:CullFaceMode) {
		untyped __global__.glCullFace(mode);
	}

	public function deleteBuffer(buffer:GLBuffer) {
		untyped __global__.glDeleteBuffers(1, Native.addressOf(buffer));
	}

	public function deleteFramebuffer(framebuffer:GLFramebuffer) {
		untyped __global__.glDeleteFramebuffers(1, Native.addressOf(framebuffer));
	}

	public function deleteProgram(program:GLProgram) {
		untyped __global__.glDeleteProgram(program);
	}

	public function deleteRenderbuffer(renderbuffer:GLRenderbuffer) {
		untyped __global__.glDeleteRenderbuffers(1, Native.addressOf(renderbuffer));
	}

	public function deleteShader(shader:GLShader) {
		untyped __global__.glDeleteShader(shader);
	}

	public function deleteTexture(texture:GLTexture) {
		untyped __global__.glDeleteTextures(1, Native.addressOf(texture));
	}

	public function depthFunc(func:ComparisonFunction) {
		untyped __global__.glDepthFunc(func);
	}

	public function depthMask(flag:Bool) {
		untyped __global__.glDepthMask(flag);
	}

	public function depthRange(zNear:GLclampf, zFar:GLclampf) {
		untyped __global__.glDepthRangef(zNear, zFar);
	}

	public function detachShader(program:GLProgram, shader:GLShader) {
		untyped __global__.glDetachShader(program, shader);
	}

	public function disable(cap:Capability) {
		untyped __global__.glDisable(cap);
	}

	public function disableVertexAttribArray(index:GLuint) {
		untyped __global__.glDisableVertexAttribArray(index);
	}

	public function drawArrays(mode:DrawMode, first:GLint, count:GLsizei) {
		untyped __global__.glDrawArrays(mode, first, count);
	}

	public function drawElements(mode:DrawMode, count:GLsizei, type:DataType, offset:GLintptr) {
		var offsetAsPointer: cpp.RawConstPointer<cpp.Void> = untyped __cpp__('reinterpret_cast<void*>({0})', offset);
		untyped __global__.glDrawElements(mode, count, type, offsetAsPointer);
	}

	public function enable(cap:Capability) {
		untyped __global__.glEnable(cap);
	}

	public function enableVertexAttribArray(index:GLuint) {
		untyped __global__.glEnableVertexAttribArray(index);
	}

	public function finish() {
		untyped __global__.glFinish();
	}

	public function flush() {
		untyped __global__.glFlush();
	}

	public function framebufferRenderbuffer(target:FramebufferTarget, attachment:FramebufferAttachement, renderbuffertarget:RenderbufferTarget, renderbuffer:GLRenderbuffer) {
		untyped __global__.glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);
	}

	public function framebufferTexture2D(target:FramebufferTarget, attachment:FramebufferAttachement, textarget:TextureTarget, texture:GLTexture, level:GLint) {
		untyped __global__.glFramebufferTexture2D(target, attachment, textarget, texture, level);
	}

	public function frontFace(mode:FrontFaceDirection) {
		untyped __global__.glFrontFace(mode);
	}

	public function generateMipmap(target:TextureTarget) {
		untyped __global__.glGenerateMipmap(target);
	}

	public function getActiveAttrib(program:GLProgram, index:GLuint):GLActiveInfo {
		final maxNameLength = this.getProgramParameter(program, ACTIVE_ATTRIBUTE_MAX_LENGTH);

		var nameLength: GLsizei = 0;
		var size: GLint = 0;
		var type: GLenum = 0;

		var nameBuffer = new Uint8Array(maxNameLength);
		var nameBufferPtr = nameBuffer.toCPointer();
		var namePointer: RawPointer<cpp.Char> = untyped __cpp__('reinterpret_cast<char*>({0})', nameBufferPtr);

		untyped __global__.glGetActiveAttrib(
			program,
			index,
			maxNameLength,
			Native.addressOf(nameLength),
			Native.addressOf(size),
			Native.addressOf(type),
			namePointer
		);

		var nameCStr: cpp.ConstCharStar = cast namePointer;

		return @:fixed {
			name: nameCStr.toString(),
			size: size,
			type: type,
		};
	}

	public function getActiveUniform(program:GLProgram, index:GLuint):GLActiveInfo {
		final maxNameLength = this.getProgramParameter(program, ACTIVE_UNIFORM_MAX_LENGTH);

		var nameLength: GLsizei = 0;
		var size: GLint = 0;
		var type: GLenum = 0;
		var nameBuffer = new Uint8Array(maxNameLength);
		var nameBufferPtr = nameBuffer.toCPointer();
		var namePointer: RawPointer<cpp.Char> = untyped __cpp__('reinterpret_cast<char*>({0})', nameBufferPtr);

		untyped __global__.glGetActiveUniform(
			program,
			index,
			maxNameLength,
			Native.addressOf(nameLength),
			Native.addressOf(size),
			Native.addressOf(type),
			namePointer
		);

		var nameCStr: cpp.ConstCharStar = cast namePointer;

		return @:fixed {
			name: nameCStr.toString(),
			size: size,
			type: type,
		};
	}

	public function getAttachedShaders(program:GLProgram):Array<GLShader> {
		// return untyped __global__.glGetAttachedShaders(program);
		throw 'todo - getAttachedShaders';
	}

	public function getAttribLocation(program:GLProgram, name:String):GLint {
		var nameCharStar = ConstCharStar.fromString(name);
		return untyped __global__.glGetAttribLocation(program, nameCharStar);
	}

	public function getBufferParameter<T>(target:BufferTarget, pname:BufferParameter<T>):T {
		// return untyped __global__.glGetBufferParameter(target, pname);
		throw 'todo - getBufferParameter';
	}

	public function getParameter<T>(pname:Parameter<T>):T {
		switch (pname) {
			case Parameter.RENDERER, Parameter.SHADING_LANGUAGE_VERSION, Parameter.VENDOR, Parameter.VERSION:
				return getString(pname);

			case Parameter.ALIASED_LINE_WIDTH_RANGE, Parameter.ALIASED_POINT_SIZE_RANGE, Parameter.DEPTH_RANGE: 
				return getFloat32Array(pname, 2);

			case Parameter.BLEND_COLOR, Parameter.COLOR_CLEAR_VALUE:
				return getFloat32Array(pname, 4);

			case Parameter.BLEND, Parameter.CULL_FACE, Parameter.DEPTH_TEST, Parameter.DEPTH_WRITEMASK, Parameter.DITHER, Parameter.POLYGON_OFFSET_FILL, Parameter.SAMPLE_COVERAGE_INVERT, Parameter.SCISSOR_TEST, Parameter.STENCIL_TEST:
				return getBool(pname);

			case Parameter.ACTIVE_TEXTURE:
				return getInt32(pname);

			case Parameter.BLEND_DST_ALPHA, Parameter.BLEND_DST_RGB, Parameter.BLEND_SRC_ALPHA, Parameter.BLEND_SRC_RGB:
				return getInt32(pname);

			case Parameter.BLEND_EQUATION_ALPHA, Parameter.BLEND_EQUATION_RGB:
				return getInt32(pname);

			case Parameter.CULL_FACE_MODE:
				return getInt32(pname);

			case Parameter.DEPTH_FUNC, Parameter.STENCIL_BACK_FUNC, Parameter.STENCIL_FUNC:
				return getInt32(pname);

			case Parameter.STENCIL_PASS_DEPTH_FAIL, Parameter.STENCIL_PASS_DEPTH_PASS, Parameter.STENCIL_BACK_PASS_DEPTH_FAIL, Parameter.STENCIL_BACK_PASS_DEPTH_PASS, Parameter.STENCIL_FAIL, Parameter.STENCIL_BACK_FAIL:
				return getInt32(pname);

			case Parameter.FRONT_FACE:
				return getInt32(pname);

			case Parameter.GENERATE_MIPMAP_HINT:
				return getInt32(pname);

			case Parameter.IMPLEMENTATION_COLOR_READ_FORMAT:
				return getInt32(pname);

			case Parameter.IMPLEMENTATION_COLOR_READ_TYPE:
				return getInt32(pname);

			case Parameter.DEPTH_CLEAR_VALUE, Parameter.LINE_WIDTH, Parameter.POLYGON_OFFSET_FACTOR, Parameter.POLYGON_OFFSET_UNITS, Parameter.SAMPLE_COVERAGE_VALUE:
				return getFloat32(pname);
				
			case Parameter.ALPHA_BITS, Parameter.BLUE_BITS, Parameter.DEPTH_BITS, Parameter.GREEN_BITS, Parameter.MAX_COMBINED_TEXTURE_IMAGE_UNITS, Parameter.MAX_CUBE_MAP_TEXTURE_SIZE, Parameter.MAX_FRAGMENT_UNIFORM_VECTORS, Parameter.MAX_RENDERBUFFER_SIZE, Parameter.MAX_TEXTURE_IMAGE_UNITS, Parameter.MAX_TEXTURE_SIZE, Parameter.MAX_VARYING_VECTORS, Parameter.MAX_VERTEX_ATTRIBS, Parameter.MAX_VERTEX_TEXTURE_IMAGE_UNITS, Parameter.MAX_VERTEX_UNIFORM_VECTORS, Parameter.PACK_ALIGNMENT, Parameter.RED_BITS, Parameter.SAMPLE_BUFFERS, Parameter.SAMPLES, Parameter.STENCIL_BACK_REF, Parameter.STENCIL_BITS, Parameter.STENCIL_CLEAR_VALUE, Parameter.STENCIL_REF, Parameter.SUBPIXEL_BITS, Parameter.UNPACK_ALIGNMENT:
				return getInt32(pname);

			case Parameter.STENCIL_BACK_VALUE_MASK, Parameter.STENCIL_BACK_WRITEMASK, Parameter.STENCIL_VALUE_MASK, Parameter.STENCIL_WRITEMASK:
				return getInt32(pname);
			
			case Parameter.MAX_VIEWPORT_DIMS:
				return getInt32Array(pname, 2);

			case Parameter.SCISSOR_BOX, Parameter.VIEWPORT:
				return getInt32Array(pname, 4);

			case Parameter.COLOR_WRITEMASK:
				return [for (x in getGLbooleanArray(pname, 4)) x != 0];
			
			case Parameter.COMPRESSED_TEXTURE_FORMATS:
				//"The core WebGL specification does not define any supported compressed texture formats" (supported via extensions)
				return new Uint32Array(0);

			case Parameter.ARRAY_BUFFER_BINDING, Parameter.ELEMENT_ARRAY_BUFFER_BINDING:
				return getInt32(pname);

			case Parameter.FRAMEBUFFER_BINDING:
				return getInt32(pname);

			case Parameter.CURRENT_PROGRAM:
				return getInt32(pname);

			case Parameter.RENDERBUFFER_BINDING:
				return getInt32(pname);

			case Parameter.TEXTURE_BINDING_2D, Parameter.TEXTURE_BINDING_CUBE_MAP:
				return getInt32(pname);

			// case UNPACK_COLORSPACE_CONVERSION_WEBGL:
			// 	args.GetReturnValue().Set(args.Holder()->GetHiddenValue(v8::String::NewFromUtf8(isolate, "UNPACK_COLORSPACE_CONVERSION_WEBGL")));
			// case UNPACK_FLIP_Y_WEBGL:
				// args.GetReturnValue().Set(args.Holder()->GetHiddenValue(v8::String::NewFromUtf8(isolate, "UNPACK_FLIP_Y_WEBGL")));
			// case UNPACK_PREMULTIPLY_ALPHA_WEBGL:
				// args.GetReturnValue().Set(args.Holder()->GetHiddenValue(v8::String::NewFromUtf8(isolate, "UNPACK_PREMULTIPLY_ALPHA_WEBGL")));
			// extensions
			// default: //assume pname refers to an extension parameter
		}

		#if debug
		trace('Unknown parameter ${StringTools.hex(pname)} in getParameter, assuming Int32 result');
		#end

		return getInt32(pname);
	}


	public function getError():ErrorCode {
		return untyped __global__.glGetError();
	}

	public function getFramebufferAttachmentParameter<T>(target:FramebufferTarget, attachment:FramebufferAttachement, pname:FramebufferAttachmentParameter<T>):T {
		var ref: GLint = 0;
		untyped __global__.glGetFramebufferAttachmentParameteriv(target, attachment, pname, Native.addressOf(ref));
		return (ref: Dynamic);
	}

	public function getProgramParameter<T>(program:GLProgram, pname:ProgramParameter<T>):T {
		var ref: GLint = 0;
		untyped __global__.glGetProgramiv(program, pname, Native.addressOf(ref));
		return (ref: Dynamic);
	}

	public function getProgramInfoLog(program:GLProgram):String {
		var maxInfoLogLength: GLint = getProgramParameter(program, INFO_LOG_LENGTH);
		var returnedStringLength: GLsizei = 0;

		var infoLogBuffer = new Uint8Array(maxInfoLogLength);
		var infoLogBufferPtr = infoLogBuffer.toCPointer();
		var infoLogPointer: RawPointer<cpp.Char> = untyped __cpp__('reinterpret_cast<char*>({0})', infoLogBufferPtr);

		untyped __global__.glGetProgramInfoLog(program, maxInfoLogLength, Native.addressOf(returnedStringLength), infoLogPointer);

		var cStr: cpp.ConstCharStar = cast infoLogPointer;
		return cStr.toString();
	}

	public function getRenderbufferParameter<T>(target:RenderbufferTarget, pname:RenderbufferParameter<T>):T {
		// return untyped __global__.glGetRenderbufferParameter(target, pname);
		throw 'todo - getRenderbufferParameter';
	}

	public function getShaderParameter<T>(shader:GLShader, pname:ShaderParameter<T>):T {
		var result: GLint = 0;
		switch pname {
			case ShaderParameter.COMPILE_STATUS, ShaderParameter.DELETE_STATUS:
				untyped __global__.glGetShaderiv(shader, pname, Native.addressOf(result));
				return result != 0;
			case ShaderParameter.SHADER_TYPE:
				untyped __global__.glGetShaderiv(shader, pname, Native.addressOf(result));
				return result;
		}
	}

	public function getShaderPrecisionFormat(shadertype:ShaderType, precisiontype:PrecisionType):GLShaderPrecisionFormat {
		// return untyped __global__.glGetShaderPrecisionFormat(shadertype, precisiontype);
		throw 'todo - getShaderPrecisionFormat';
	}

	public function getShaderInfoLog(shader:GLShader):String {
		var maxInfoLogLength: GLint = getShaderParameter(shader, INFO_LOG_LENGTH);
		var returnedStringLength: GLsizei = 0;

		var infoLogBuffer = new Uint8Array(maxInfoLogLength);
		var infoLogBufferPtr = infoLogBuffer.toCPointer();
		var infoLogPointer: RawPointer<cpp.Char> = untyped __cpp__('reinterpret_cast<char*>({0})', infoLogBufferPtr);

		untyped __global__.glGetShaderInfoLog(shader, maxInfoLogLength, Native.addressOf(returnedStringLength), infoLogPointer);

		var cStr: cpp.ConstCharStar = cast infoLogPointer;
		return cStr.toString();
	}

	public function getShaderSource(shader:GLShader):String {
		var maxSourceLength: GLint = getShaderParameter(shader, SHADER_SOURCE_LENGTH);
		var returnedStringLength: GLsizei = 0;
		
		var sourceBuffer = new Uint8Array(maxSourceLength);
		var sourceBufferPtr = sourceBuffer.toCPointer();
		var sourcePointer: RawPointer<cpp.Char> = untyped __cpp__('reinterpret_cast<char*>({0})', sourceBufferPtr);

		untyped __global__.glGetShaderSource(shader, maxSourceLength, Native.addressOf(returnedStringLength), sourcePointer);
		
		var cStr: cpp.ConstCharStar = cast sourcePointer;
		return cStr.toString();
	}

	public function getTexParameter<T>(target:TextureTarget, pname:TextureParameter<T>):T {
		switch pname {
			// float parameters
			case TextureParameter.TEXTURE_MAX_ANISOTROPY_EXT:
				var ref: GLfloat = 0;
				untyped __global__.glGetTexParameterfv(target, pname, Native.addressOf(ref));
				return (ref: Dynamic);
			default:
				var ref: GLint = 0;
				untyped __global__.glGetTexParameteriv(target, pname, Native.addressOf(ref));
				return (ref: Dynamic);
		}
	}

	public function getUniform(program:GLProgram, location:GLUniformLocation):Dynamic {
		var info = getActiveUniform(program, location);

		inline function getUniformFloat32Array(n: Int) {
			var temp = new Float32Array(n);
			untyped __global__.glGetUniformfv(program, location, temp.toCPointer());
			return new Float32Array(temp);
		}

		inline function getUniformInt32Array(n: Int) {
			var temp = new Int32Array(n);
			untyped __global__.glGetUniformiv(program, location, temp.toCPointer());
			return new Int32Array(temp);
		}

		// glGetUniform{f,i}v (GLuint program, GLint location, GLfloat *params)
		switch info.type {
			case UniformType.FLOAT:
				return getUniformFloat32Array(1)[0];

			case UniformType.FLOAT_VEC2: 
				return getUniformFloat32Array(2);

			case UniformType.FLOAT_VEC3:
				return getUniformFloat32Array(3);

			case UniformType.FLOAT_VEC4: 
				return getUniformFloat32Array(4);

			case UniformType.FLOAT_MAT2: 
				return getUniformFloat32Array(4);

			case UniformType.FLOAT_MAT3: 
				return getUniformFloat32Array(9);

			case UniformType.FLOAT_MAT4: 
				return getUniformFloat32Array(16);

			case UniformType.INT:
				return getUniformInt32Array(1)[0];

			case UniformType.INT_VEC2: 
				return getUniformInt32Array(2);

			case UniformType.INT_VEC3: 
				return getUniformInt32Array(3);

			case UniformType.INT_VEC4: 
				return getUniformInt32Array(4);

			case UniformType.BOOL: 
				return getUniformInt32Array(1)[0] != 0;

			case UniformType.BOOL_VEC2: 
				return [for (v in getUniformInt32Array(2)) v != 0];

			case UniformType.BOOL_VEC3: 
				return [for (v in getUniformInt32Array(3)) v != 0];

			case UniformType.BOOL_VEC4: 
				return [for (v in getUniformInt32Array(4)) v != 0];

			case UniformType.SAMPLER_2D, UniformType.SAMPLER_CUBE:
				return getUniformInt32Array(1)[0];
		}
	}

	public function getUniformLocation(program:GLProgram, name:String):GLUniformLocation {
		var nameCharStar = ConstCharStar.fromString(name);
		return untyped __global__.glGetUniformLocation(program, nameCharStar);
	}

	public function getVertexAttrib<T>(index:GLuint, pname:VertexAttributeParameter<T>):T {
		// return untyped __global__.glGetVertexAttrib(index, pname);
		throw 'todo - getVertexAttrib';
	}

	public function getVertexAttribOffset(index:GLuint, pname:VertexAttributeOffsetParameter):GLsizeiptr {
		// return untyped __global__.glGetVertexAttribOffset(index, pname);
		throw 'todo - getVertexAttrib';
	}

	public function hint(target:HintTarget, mode:HintMode) {
		untyped __global__.glHint(target, mode);
	}

	public function isBuffer(buffer:GLBuffer):Bool {
		return untyped __global__.glIsBuffer(buffer);
	}

	public function isEnabled(cap:Capability):Bool {
		return untyped __global__.glIsEnabled(cap);
	}

	public function isFramebuffer(framebuffer:GLFramebuffer):Bool {
		return untyped __global__.glIsFramebuffer(framebuffer);
	}

	public function isProgram(program:GLProgram):Bool {
		return untyped __global__.glIsProgram(program);
	}

	public function isRenderbuffer(renderbuffer:GLRenderbuffer):Bool {
		return untyped __global__.glIsRenderbuffer(renderbuffer);
	}

	public function isShader(shader:GLShader):Bool {
		return untyped __global__.glIsShader(shader);
	}

	public function isTexture(texture:GLTexture):Bool {
		return untyped __global__.glIsTexture(texture);
	}

	public function lineWidth(width:GLfloat) {
		untyped __global__.glLineWidth(width);
	}

	public function linkProgram(program:GLProgram) {
		untyped __global__.glLinkProgram(program);
	}

	public function pixelStorei<T>(pname:PixelStoreParameter<T>, param:T) {
		untyped __global__.glPixelStorei(pname, param);
	}

	public function polygonOffset(factor:GLfloat, units:GLfloat) {
		untyped __global__.glPolygonOffset(factor, units);
	}

	public function readPixels(x:GLint, y:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView) {
		var ptr: cpp.Star<cpp.UInt8> = pixels != null ? pixels.toCPointer() : null;
		untyped __global__.glReadPixels(x, y, width, height, format, type, ptr);
	}

	public function renderbufferStorage(target:RenderbufferTarget, internalformat:RenderbufferFormat, width:GLsizei, height:GLsizei) {
		untyped __global__.glRenderbufferStorage(target, internalformat, width, height);
	}

	public function sampleCoverage(value:GLclampf, invert:Bool) {
		untyped __global__.glSampleCoverage(value, invert);
	}

	public function scissor(x:GLint, y:GLint, width:GLsizei, height:GLsizei) {
		untyped __global__.glScissor(x, y, width, height);
	}

	public function shaderSource(shader:GLShader, source:String) {
		var sourceCharStar = ConstCharStar.fromString(source);
		// here we assume hxcpp strings are null terminated!
		untyped __global__.glShaderSource(shader, 1, Native.addressOf(sourceCharStar), 0);
	}

	public function stencilFunc(func:ComparisonFunction, ref:GLint, mask:GLuint) {
		untyped __global__.glStencilFunc(func, ref, mask);
	}

	public function stencilFuncSeparate(face:CullFaceMode, func:ComparisonFunction, ref:GLint, mask:GLuint) {
		untyped __global__.glStencilFuncSeparate(face, func, ref, mask);
	}

	public function stencilMask(mask:GLuint) {
		untyped __global__.glStencilMask(mask);
	}

	public function stencilMaskSeparate(face:CullFaceMode, mask:GLuint) {
		untyped __global__.glStencilMaskSeparate(face, mask);
	}

	public function stencilOp(fail:Operation, zfail:Operation, zpass:Operation) {
		untyped __global__.glStencilOp(fail, zfail, zpass);
	}

	public function stencilOpSeparate(face:CullFaceMode, fail:Operation, zfail:Operation, zpass:Operation) {
		untyped __global__.glStencilOpSeparate(face, fail, zfail, zpass);
	}

	public function texImage2D(target:TextureTarget, level:GLint, internalformat:GLint, width:GLsizei, height:GLsizei, border:GLint, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView) {
		var ptr: cpp.Star<cpp.UInt8> = pixels != null ? pixels.toCPointer() : null;
		untyped __global__.glTexImage2D(target, level, internalformat, width, height, border, format, type, ptr);
	}

	public function texImage2DPtr(target:TextureTarget, level:GLint, internalformat:GLint, width:GLsizei, height:GLsizei, border:GLint, format:PixelFormat, type:PixelDataType, pixels:cpp.RawConstPointer<cpp.Void>) {
		untyped __global__.glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels);
	}

	public function texParameterf<T:GLfloat>(target:TextureTarget, pname:TextureParameter<T>, param:T) {
		untyped __global__.glTexParameterf(target, pname, param);
	}

	public function texParameteri<T:GLint>(target:TextureTarget, pname:TextureParameter<T>, param:T) {
		untyped __global__.glTexParameteri(target, pname, param);
	}

	public function texSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView) {
		var ptr: cpp.Star<cpp.UInt8> = pixels != null ? pixels.toCPointer() : null;
		untyped __global__.glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, ptr);
	}

	public function uniform1f(location:GLUniformLocation, x:GLfloat) {
		untyped __global__.glUniform1f(location, x);
	}

	public function uniform1fv(location:GLUniformLocation, v:GLFloat32Array) {
		untyped __global__.glUniform1fv(location, v.length, v.toCPointer());
	}

	public function uniform1i(location:GLUniformLocation, x:GLint) {
		untyped __global__.glUniform1i(location, x);
	}

	public function uniform1iv(location:GLUniformLocation, v:GLInt32Array) {
		untyped __global__.glUniform1iv(location, v.length, v.toCPointer());
	}

	public function uniform2f(location:GLUniformLocation, x:GLfloat, y:GLfloat) {
		untyped __global__.glUniform2f(location, x, y);
	}

	public function uniform2fv(location:GLUniformLocation, v:GLFloat32Array) {
		untyped __global__.glUniform2fv(location, cpp.NativeMath.idiv(v.length, 2), v.toCPointer());
	}

	public function uniform2i(location:GLUniformLocation, x:GLint, y:GLint) {
		untyped __global__.glUniform2i(location, x, y);
	}

	public function uniform2iv(location:GLUniformLocation, v:GLInt32Array) {
		untyped __global__.glUniform2iv(location, cpp.NativeMath.idiv(v.length, 2), v.toCPointer());
	}

	public function uniform3f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat) {
		untyped __global__.glUniform3f(location, x, y, z);
	}

	public function uniform3fv(location:GLUniformLocation, v:GLFloat32Array) {
		untyped __global__.glUniform3fv(location, cpp.NativeMath.idiv(v.length, 3), v.toCPointer());
	}

	public function uniform3i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint) {
		untyped __global__.glUniform3i(location, x, y, z);
	}

	public function uniform3iv(location:GLUniformLocation, v:GLInt32Array) {
		untyped __global__.glUniform3iv(location, cpp.NativeMath.idiv(v.length, 3), v.toCPointer());
	}

	public function uniform4f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat) {
		untyped __global__.glUniform4f(location, x, y, z, w);
	}

	public function uniform4fv(location:GLUniformLocation, v:GLFloat32Array) {
		untyped __global__.glUniform4fv(location, cpp.NativeMath.idiv(v.length, 4), v.toCPointer());
	}

	public function uniform4i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint, w:GLint) {
		untyped __global__.glUniform4i(location, x, y, z, w);
	}

	public function uniform4iv(location:GLUniformLocation, v:GLInt32Array) {
		untyped __global__.glUniform4iv(location, cpp.NativeMath.idiv(v.length, 4), v.toCPointer());
	}

	public function uniformMatrix2fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array) {
		untyped __global__.glUniformMatrix2fv(location, cpp.NativeMath.idiv(value.length, 4), transpose, value.toCPointer());
	}

	public function uniformMatrix3fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array) {
		untyped __global__.glUniformMatrix3fv(location, cpp.NativeMath.idiv(value.length, 9), transpose, value.toCPointer());
	}

	public function uniformMatrix4fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array) {
		untyped __global__.glUniformMatrix4fv(location, cpp.NativeMath.idiv(value.length, 16), transpose, value.toCPointer());
	}

	public function useProgram(program:GLProgram) {
		untyped __global__.glUseProgram(program);
	}

	public function validateProgram(program:GLProgram) {
		untyped __global__.glValidateProgram(program);
	}

	public function vertexAttrib1f(index:GLuint, x:GLfloat) {
		untyped __global__.glVertexAttrib1f(index, x);
	}

	public function vertexAttrib1fv(index:GLuint, values:GLFloat32Array) {
		untyped __global__.glVertexAttrib1fv(index, values.toCPointer());
	}

	public function vertexAttrib2f(index:GLuint, x:GLfloat, y:GLfloat) {
		untyped __global__.glVertexAttrib2f(index, x, y);
	}

	public function vertexAttrib2fv(index:GLuint, values:GLFloat32Array) {
		untyped __global__.glVertexAttrib2fv(index, values.toCPointer());
	}

	public function vertexAttrib3f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat) {
		untyped __global__.glVertexAttrib3f(index, x, y, z);
	}

	public function vertexAttrib3fv(index:GLuint, values:GLFloat32Array) {
		untyped __global__.glVertexAttrib3fv(index, values.toCPointer());
	}

	public function vertexAttrib4f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat) {
		untyped __global__.glVertexAttrib4f(index, x, y, z, w);
	}

	public function vertexAttrib4fv(index:GLuint, values:GLFloat32Array) {
		untyped __global__.glVertexAttrib4fv(index, values.toCPointer());
	}

	public function vertexAttribPointer(index:GLuint, size:GLint, type:DataType, normalized:Bool, stride:GLsizei, offset:GLintptr) {
		var offsetAsPointer: cpp.RawConstPointer<cpp.Void> = untyped __cpp__('reinterpret_cast<void*>({0})', offset);
		untyped __global__.glVertexAttribPointer(index, size, type, normalized, stride, offsetAsPointer);
	}

	public function viewport(x:GLint, y:GLint, width:GLsizei, height:GLsizei) {
		untyped __global__.glViewport(x, y, width, height);
	}

	// internal utility methods
	function getFloat32Array(pname: GLenum, n: Int) {
		var temp = new Float32Array(n);
		untyped __global__.glGetFloatv(pname, temp.toCPointer());
		return new Float32Array(temp);
	}

	function getInt32Array(pname: GLenum, n: Int) {
		var temp = new Int32Array(n);
		untyped __global__.glGetIntegerv(pname, temp.toCPointer());
		return new Int32Array(temp);
	}

	function getGLbooleanArray(pname: GLenum, n: Int) {
		var temp = new Uint8Array(n);
		untyped __global__.glGetBooleanv(pname, temp.toCPointer());
		return new Uint8Array(temp);
	}

	inline function getInt32<T>(pname: GLenum): T {
		return cast getInt32Array(pname, 1)[0];
	}

	inline function getBool(pname: GLenum): Bool {
		return getGLbooleanArray(pname, 1)[0] != 0;
	}

	inline function getFloat32(pname: GLenum): GLfloat {
		return cast getFloat32Array(pname, 1)[0];
	}

	inline function getString(pname: GLenum): String {
		var result: cpp.RawConstPointer<GLubyte> = untyped __global__.glGetString(pname);
		var cStr: cpp.ConstCharStar = untyped __cpp__('reinterpret_cast<const char*>({0})', result);
		return cStr.toString();
	}

	// constants

	static public inline final DEPTH_BUFFER_BIT = 0x00000100;
	static public inline final STENCIL_BUFFER_BIT = 0x00000400;
	static public inline final COLOR_BUFFER_BIT = 0x00004000;
	static public inline final FALSE = 0;
	static public inline final TRUE = 1;
	static public inline final POINTS = 0x0000;
	static public inline final LINES = 0x0001;
	static public inline final LINE_LOOP = 0x0002;
	static public inline final LINE_STRIP = 0x0003;
	static public inline final TRIANGLES = 0x0004;
	static public inline final TRIANGLE_STRIP = 0x0005;
	static public inline final TRIANGLE_FAN = 0x0006;
	static public inline final ZERO = 0;
	static public inline final ONE = 1;
	static public inline final SRC_COLOR = 0x0300;
	static public inline final ONE_MINUS_SRC_COLOR = 0x0301;
	static public inline final SRC_ALPHA = 0x0302;
	static public inline final ONE_MINUS_SRC_ALPHA = 0x0303;
	static public inline final DST_ALPHA = 0x0304;
	static public inline final ONE_MINUS_DST_ALPHA = 0x0305;
	static public inline final DST_COLOR = 0x0306;
	static public inline final ONE_MINUS_DST_COLOR = 0x0307;
	static public inline final SRC_ALPHA_SATURATE = 0x0308;
	static public inline final FUNC_ADD = 0x8006;
	static public inline final BLEND_EQUATION = 0x8009;
	static public inline final BLEND_EQUATION_RGB = 0x8009;
	static public inline final BLEND_EQUATION_ALPHA = 0x883D;
	static public inline final FUNC_SUBTRACT = 0x800A;
	static public inline final FUNC_REVERSE_SUBTRACT = 0x800B;
	static public inline final BLEND_DST_RGB = 0x80C8;
	static public inline final BLEND_SRC_RGB = 0x80C9;
	static public inline final BLEND_DST_ALPHA = 0x80CA;
	static public inline final BLEND_SRC_ALPHA = 0x80CB;
	static public inline final CONSTANT_COLOR = 0x8001;
	static public inline final ONE_MINUS_CONSTANT_COLOR = 0x8002;
	static public inline final CONSTANT_ALPHA = 0x8003;
	static public inline final ONE_MINUS_CONSTANT_ALPHA = 0x8004;
	static public inline final BLEND_COLOR = 0x8005;
	static public inline final ARRAY_BUFFER = 0x8892;
	static public inline final ELEMENT_ARRAY_BUFFER = 0x8893;
	static public inline final ARRAY_BUFFER_BINDING = 0x8894;
	static public inline final ELEMENT_ARRAY_BUFFER_BINDING = 0x8895;
	static public inline final STREAM_DRAW = 0x88E0;
	static public inline final STATIC_DRAW = 0x88E4;
	static public inline final DYNAMIC_DRAW = 0x88E8;
	static public inline final BUFFER_SIZE = 0x8764;
	static public inline final BUFFER_USAGE = 0x8765;
	static public inline final CURRENT_VERTEX_ATTRIB = 0x8626;
	static public inline final FRONT = 0x0404;
	static public inline final BACK = 0x0405;
	static public inline final FRONT_AND_BACK = 0x0408;
	static public inline final TEXTURE_2D = 0x0DE1;
	static public inline final CULL_FACE = 0x0B44;
	static public inline final BLEND = 0x0BE2;
	static public inline final DITHER = 0x0BD0;
	static public inline final STENCIL_TEST = 0x0B90;
	static public inline final DEPTH_TEST = 0x0B71;
	static public inline final SCISSOR_TEST = 0x0C11;
	static public inline final POLYGON_OFFSET_FILL = 0x8037;
	static public inline final SAMPLE_ALPHA_TO_COVERAGE = 0x809E;
	static public inline final SAMPLE_COVERAGE = 0x80A0;
	static public inline final NO_ERROR = 0;
	static public inline final INVALID_ENUM = 0x0500;
	static public inline final INVALID_VALUE = 0x0501;
	static public inline final INVALID_OPERATION = 0x0502;
	static public inline final OUT_OF_MEMORY = 0x0505;
	static public inline final CW = 0x0900;
	static public inline final CCW = 0x0901;
	static public inline final LINE_WIDTH = 0x0B21;
	static public inline final ALIASED_POINT_SIZE_RANGE = 0x846D;
	static public inline final ALIASED_LINE_WIDTH_RANGE = 0x846E;
	static public inline final CULL_FACE_MODE = 0x0B45;
	static public inline final FRONT_FACE = 0x0B46;
	static public inline final DEPTH_RANGE = 0x0B70;
	static public inline final DEPTH_WRITEMASK = 0x0B72;
	static public inline final DEPTH_CLEAR_VALUE = 0x0B73;
	static public inline final DEPTH_FUNC = 0x0B74;
	static public inline final STENCIL_CLEAR_VALUE = 0x0B91;
	static public inline final STENCIL_FUNC = 0x0B92;
	static public inline final STENCIL_FAIL = 0x0B94;
	static public inline final STENCIL_PASS_DEPTH_FAIL = 0x0B95;
	static public inline final STENCIL_PASS_DEPTH_PASS = 0x0B96;
	static public inline final STENCIL_REF = 0x0B97;
	static public inline final STENCIL_VALUE_MASK = 0x0B93;
	static public inline final STENCIL_WRITEMASK = 0x0B98;
	static public inline final STENCIL_BACK_FUNC = 0x8800;
	static public inline final STENCIL_BACK_FAIL = 0x8801;
	static public inline final STENCIL_BACK_PASS_DEPTH_FAIL = 0x8802;
	static public inline final STENCIL_BACK_PASS_DEPTH_PASS = 0x8803;
	static public inline final STENCIL_BACK_REF = 0x8CA3;
	static public inline final STENCIL_BACK_VALUE_MASK = 0x8CA4;
	static public inline final STENCIL_BACK_WRITEMASK = 0x8CA5;
	static public inline final VIEWPORT = 0x0BA2;
	static public inline final SCISSOR_BOX = 0x0C10;
	static public inline final COLOR_CLEAR_VALUE = 0x0C22;
	static public inline final COLOR_WRITEMASK = 0x0C23;
	static public inline final UNPACK_ALIGNMENT = 0x0CF5;
	static public inline final PACK_ALIGNMENT = 0x0D05;
	static public inline final MAX_TEXTURE_SIZE = 0x0D33;
	static public inline final MAX_VIEWPORT_DIMS = 0x0D3A;
	static public inline final SUBPIXEL_BITS = 0x0D50;
	static public inline final RED_BITS = 0x0D52;
	static public inline final GREEN_BITS = 0x0D53;
	static public inline final BLUE_BITS = 0x0D54;
	static public inline final ALPHA_BITS = 0x0D55;
	static public inline final DEPTH_BITS = 0x0D56;
	static public inline final STENCIL_BITS = 0x0D57;
	static public inline final POLYGON_OFFSET_UNITS = 0x2A00;
	static public inline final POLYGON_OFFSET_FACTOR = 0x8038;
	static public inline final TEXTURE_BINDING_2D = 0x8069;
	static public inline final SAMPLE_BUFFERS = 0x80A8;
	static public inline final SAMPLES = 0x80A9;
	static public inline final SAMPLE_COVERAGE_VALUE = 0x80AA;
	static public inline final SAMPLE_COVERAGE_INVERT = 0x80AB;
	static public inline final NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2;
	static public inline final COMPRESSED_TEXTURE_FORMATS = 0x86A3;
	static public inline final DONT_CARE = 0x1100;
	static public inline final FASTEST = 0x1101;
	static public inline final NICEST = 0x1102;
	static public inline final GENERATE_MIPMAP_HINT = 0x8192;
	static public inline final BYTE = 0x1400;
	static public inline final UNSIGNED_BYTE = 0x1401;
	static public inline final SHORT = 0x1402;
	static public inline final UNSIGNED_SHORT = 0x1403;
	static public inline final INT = 0x1404;
	static public inline final UNSIGNED_INT = 0x1405;
	static public inline final FLOAT = 0x1406;
	static public inline final FIXED = 0x140C;
	static public inline final DEPTH_COMPONENT = 0x1902;
	static public inline final ALPHA = 0x1906;
	static public inline final RGB = 0x1907;
	static public inline final RGBA = 0x1908;
	static public inline final LUMINANCE = 0x1909;
	static public inline final LUMINANCE_ALPHA = 0x190A;
	static public inline final UNSIGNED_SHORT_4_4_4_4 = 0x8033;
	static public inline final UNSIGNED_SHORT_5_5_5_1 = 0x8034;
	static public inline final UNSIGNED_SHORT_5_6_5 = 0x8363;
	static public inline final FRAGMENT_SHADER = 0x8B30;
	static public inline final VERTEX_SHADER = 0x8B31;
	static public inline final MAX_VERTEX_ATTRIBS = 0x8869;
	static public inline final MAX_VERTEX_UNIFORM_VECTORS = 0x8DFB;
	static public inline final MAX_VARYING_VECTORS = 0x8DFC;
	static public inline final MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D;
	static public inline final MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C;
	static public inline final MAX_TEXTURE_IMAGE_UNITS = 0x8872;
	static public inline final MAX_FRAGMENT_UNIFORM_VECTORS = 0x8DFD;
	static public inline final SHADER_TYPE = 0x8B4F;
	static public inline final DELETE_STATUS = 0x8B80;
	static public inline final LINK_STATUS = 0x8B82;
	static public inline final VALIDATE_STATUS = 0x8B83;
	static public inline final ATTACHED_SHADERS = 0x8B85;
	static public inline final ACTIVE_UNIFORMS = 0x8B86;
	static public inline final ACTIVE_UNIFORM_MAX_LENGTH = 0x8B87;
	static public inline final ACTIVE_ATTRIBUTES = 0x8B89;
	static public inline final ACTIVE_ATTRIBUTE_MAX_LENGTH = 0x8B8A;
	static public inline final SHADING_LANGUAGE_VERSION = 0x8B8C;
	static public inline final CURRENT_PROGRAM = 0x8B8D;
	static public inline final NEVER = 0x0200;
	static public inline final LESS = 0x0201;
	static public inline final EQUAL = 0x0202;
	static public inline final LEQUAL = 0x0203;
	static public inline final GREATER = 0x0204;
	static public inline final NOTEQUAL = 0x0205;
	static public inline final GEQUAL = 0x0206;
	static public inline final ALWAYS = 0x0207;
	static public inline final KEEP = 0x1E00;
	static public inline final REPLACE = 0x1E01;
	static public inline final INCR = 0x1E02;
	static public inline final DECR = 0x1E03;
	static public inline final INVERT = 0x150A;
	static public inline final INCR_WRAP = 0x8507;
	static public inline final DECR_WRAP = 0x8508;
	static public inline final VENDOR = 0x1F00;
	static public inline final RENDERER = 0x1F01;
	static public inline final VERSION = 0x1F02;
	static public inline final EXTENSIONS = 0x1F03;
	static public inline final NEAREST = 0x2600;
	static public inline final LINEAR = 0x2601;
	static public inline final NEAREST_MIPMAP_NEAREST = 0x2700;
	static public inline final LINEAR_MIPMAP_NEAREST = 0x2701;
	static public inline final NEAREST_MIPMAP_LINEAR = 0x2702;
	static public inline final LINEAR_MIPMAP_LINEAR = 0x2703;
	static public inline final TEXTURE_MAG_FILTER = 0x2800;
	static public inline final TEXTURE_MIN_FILTER = 0x2801;
	static public inline final TEXTURE_WRAP_S = 0x2802;
	static public inline final TEXTURE_WRAP_T = 0x2803;
	static public inline final TEXTURE = 0x1702;
	static public inline final TEXTURE_CUBE_MAP = 0x8513;
	static public inline final TEXTURE_BINDING_CUBE_MAP = 0x8514;
	static public inline final TEXTURE_CUBE_MAP_POSITIVE_X = 0x8515;
	static public inline final TEXTURE_CUBE_MAP_NEGATIVE_X = 0x8516;
	static public inline final TEXTURE_CUBE_MAP_POSITIVE_Y = 0x8517;
	static public inline final TEXTURE_CUBE_MAP_NEGATIVE_Y = 0x8518;
	static public inline final TEXTURE_CUBE_MAP_POSITIVE_Z = 0x8519;
	static public inline final TEXTURE_CUBE_MAP_NEGATIVE_Z = 0x851A;
	static public inline final MAX_CUBE_MAP_TEXTURE_SIZE = 0x851C;
	static public inline final TEXTURE0 = 0x84C0;
	static public inline final TEXTURE1 = 0x84C1;
	static public inline final TEXTURE2 = 0x84C2;
	static public inline final TEXTURE3 = 0x84C3;
	static public inline final TEXTURE4 = 0x84C4;
	static public inline final TEXTURE5 = 0x84C5;
	static public inline final TEXTURE6 = 0x84C6;
	static public inline final TEXTURE7 = 0x84C7;
	static public inline final TEXTURE8 = 0x84C8;
	static public inline final TEXTURE9 = 0x84C9;
	static public inline final TEXTURE10 = 0x84CA;
	static public inline final TEXTURE11 = 0x84CB;
	static public inline final TEXTURE12 = 0x84CC;
	static public inline final TEXTURE13 = 0x84CD;
	static public inline final TEXTURE14 = 0x84CE;
	static public inline final TEXTURE15 = 0x84CF;
	static public inline final TEXTURE16 = 0x84D0;
	static public inline final TEXTURE17 = 0x84D1;
	static public inline final TEXTURE18 = 0x84D2;
	static public inline final TEXTURE19 = 0x84D3;
	static public inline final TEXTURE20 = 0x84D4;
	static public inline final TEXTURE21 = 0x84D5;
	static public inline final TEXTURE22 = 0x84D6;
	static public inline final TEXTURE23 = 0x84D7;
	static public inline final TEXTURE24 = 0x84D8;
	static public inline final TEXTURE25 = 0x84D9;
	static public inline final TEXTURE26 = 0x84DA;
	static public inline final TEXTURE27 = 0x84DB;
	static public inline final TEXTURE28 = 0x84DC;
	static public inline final TEXTURE29 = 0x84DD;
	static public inline final TEXTURE30 = 0x84DE;
	static public inline final TEXTURE31 = 0x84DF;
	static public inline final ACTIVE_TEXTURE = 0x84E0;
	static public inline final REPEAT = 0x2901;
	static public inline final CLAMP_TO_EDGE = 0x812F;
	static public inline final MIRRORED_REPEAT = 0x8370;
	static public inline final FLOAT_VEC2 = 0x8B50;
	static public inline final FLOAT_VEC3 = 0x8B51;
	static public inline final FLOAT_VEC4 = 0x8B52;
	static public inline final INT_VEC2 = 0x8B53;
	static public inline final INT_VEC3 = 0x8B54;
	static public inline final INT_VEC4 = 0x8B55;
	static public inline final BOOL = 0x8B56;
	static public inline final BOOL_VEC2 = 0x8B57;
	static public inline final BOOL_VEC3 = 0x8B58;
	static public inline final BOOL_VEC4 = 0x8B59;
	static public inline final FLOAT_MAT2 = 0x8B5A;
	static public inline final FLOAT_MAT3 = 0x8B5B;
	static public inline final FLOAT_MAT4 = 0x8B5C;
	static public inline final SAMPLER_2D = 0x8B5E;
	static public inline final SAMPLER_CUBE = 0x8B60;
	static public inline final VERTEX_ATTRIB_ARRAY_ENABLED = 0x8622;
	static public inline final VERTEX_ATTRIB_ARRAY_SIZE = 0x8623;
	static public inline final VERTEX_ATTRIB_ARRAY_STRIDE = 0x8624;
	static public inline final VERTEX_ATTRIB_ARRAY_TYPE = 0x8625;
	static public inline final VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A;
	static public inline final VERTEX_ATTRIB_ARRAY_POINTER = 0x8645;
	static public inline final VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F;
	static public inline final IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A;
	static public inline final IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B;
	static public inline final COMPILE_STATUS = 0x8B81;
	static public inline final INFO_LOG_LENGTH = 0x8B84;
	static public inline final SHADER_SOURCE_LENGTH = 0x8B88;
	static public inline final SHADER_COMPILER = 0x8DFA;
	static public inline final SHADER_BINARY_FORMATS = 0x8DF8;
	static public inline final NUM_SHADER_BINARY_FORMATS = 0x8DF9;
	static public inline final LOW_FLOAT = 0x8DF0;
	static public inline final MEDIUM_FLOAT = 0x8DF1;
	static public inline final HIGH_FLOAT = 0x8DF2;
	static public inline final LOW_INT = 0x8DF3;
	static public inline final MEDIUM_INT = 0x8DF4;
	static public inline final HIGH_INT = 0x8DF5;
	static public inline final FRAMEBUFFER = 0x8D40;
	static public inline final RENDERBUFFER = 0x8D41;
	static public inline final RGBA4 = 0x8056;
	static public inline final RGB5_A1 = 0x8057;
	static public inline final RGB565 = 0x8D62;
	static public inline final DEPTH_COMPONENT16 = 0x81A5;
	static public inline final STENCIL_INDEX8 = 0x8D48;
	static public inline final RENDERBUFFER_WIDTH = 0x8D42;
	static public inline final RENDERBUFFER_HEIGHT = 0x8D43;
	static public inline final RENDERBUFFER_INTERNAL_FORMAT = 0x8D44;
	static public inline final RENDERBUFFER_RED_SIZE = 0x8D50;
	static public inline final RENDERBUFFER_GREEN_SIZE = 0x8D51;
	static public inline final RENDERBUFFER_BLUE_SIZE = 0x8D52;
	static public inline final RENDERBUFFER_ALPHA_SIZE = 0x8D53;
	static public inline final RENDERBUFFER_DEPTH_SIZE = 0x8D54;
	static public inline final RENDERBUFFER_STENCIL_SIZE = 0x8D55;
	static public inline final FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0;
	static public inline final FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1;
	static public inline final FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2;
	static public inline final FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3;
	static public inline final COLOR_ATTACHMENT0 = 0x8CE0;
	static public inline final DEPTH_ATTACHMENT = 0x8D00;
	static public inline final STENCIL_ATTACHMENT = 0x8D20;
	static public inline final NONE = 0;
	static public inline final FRAMEBUFFER_COMPLETE = 0x8CD5;
	static public inline final FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6;
	static public inline final FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7;
	static public inline final FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9;
	static public inline final FRAMEBUFFER_UNSUPPORTED = 0x8CDD;
	static public inline final FRAMEBUFFER_BINDING = 0x8CA6;
	static public inline final RENDERBUFFER_BINDING = 0x8CA7;
	static public inline final MAX_RENDERBUFFER_SIZE = 0x84E8;
	static public inline final INVALID_FRAMEBUFFER_OPERATION = 0x0506;

	// additional constants not included in gl2.h
	static public inline final DEPTH_STENCIL = 0x84F9;
	static public inline final DEPTH_STENCIL_ATTACHMENT = 0x821A;

}

#else
// #macro

import haxe.macro.Context;
import haxe.io.Path;

class Macro {

	static function addBuildConfig() {
		var classPosInfo = Context.getPosInfos(Context.currentPos());
		var classFilePath = Path.isAbsolute(classPosInfo.file) ? classPosInfo.file : Path.join([Sys.getCwd(), classPosInfo.file]);
		var classDir = Path.directory(classFilePath);

		var buildXml = '
		<target id="haxe">
			<section if="macos">
				<vflag name="-framework" value="OpenGL" />
			</section>
			<section if="windows">
				<lib name="opengl32.lib" />
			</section>
			<section if="linux">
				<lib name="-lGL" />
			</section>
			<section if="android">
				<lib name="-lGLESv2" unless="static_link" />
			</section>
		</target>

		<files id="haxe">
			<compilerflag value="-I$classDir/include" />

			<compilerflag value="-DGLEW_STATIC" />
			<file name="$classDir/glew.c" if="windows">
				<depend name="$classDir/include/GL/glew.h"/>
			</file>
		</files>
		';
		
		// add @:buildXml
		Context.getLocalClass().get().meta.add(':buildXml', [macro $v{buildXml}], Context.currentPos());

		return Context.getBuildFields();
	}

}

#end