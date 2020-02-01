package gluon.webgl;

import typedarray.BufferSource;

#if cpp
typedef GLenum     = cpp.UInt32;
typedef GLbitfield = cpp.UInt32;
typedef GLbyte     = cpp.Int8;
typedef GLshort    = cpp.Int16;
typedef GLint      = cpp.Int32;
typedef GLsizei    = cpp.Int32;
typedef GLintptr   = cpp.Int64;
typedef GLsizeiptr = cpp.Int64;
typedef GLubyte    = cpp.UInt8;
typedef GLushort   = cpp.UInt16;
typedef GLuint     = cpp.UInt32;
typedef GLfloat    = cpp.Float32;
typedef GLclampf   = cpp.Float32;
#else
typedef GLenum     = UInt;
typedef GLbitfield = UInt;
typedef GLbyte     = Int;
typedef GLshort    = Int;
typedef GLint      = Int;
typedef GLsizei    = Int;
typedef GLintptr   = Int;
typedef GLsizeiptr = Int;
typedef GLubyte    = UInt;
typedef GLushort   = UInt;
typedef GLuint     = UInt;
typedef GLfloat    = Float;
typedef GLclampf   = Float;
#end


typedef GLArrayBuffer       = typedarray.ArrayBuffer;
typedef GLArrayBufferView   = typedarray.ArrayBufferView;
typedef GLInt8Array         = typedarray.Int8Array;
typedef GLUint8Array        = typedarray.Uint8Array;
typedef GLUint8ClampedArray = typedarray.Uint8ClampedArray;
typedef GLInt16Array        = typedarray.Int16Array;
typedef GLUint16Array       = typedarray.Uint16Array;
typedef GLInt32Array        = typedarray.Int32Array;
typedef GLUint32Array       = typedarray.Uint32Array;
typedef GLFloat32Array      = typedarray.Float32Array;
typedef GLFloat64Array      = typedarray.Float64Array;

#if js
abstract TexImageSource(Dynamic)
	from js.html.ImageBitmap   to js.html.ImageBitmap
	from js.html.ImageData     to js.html.ImageData
	from js.html.ImageElement  to js.html.ImageElement
	from js.html.CanvasElement to js.html.CanvasElement
	from js.html.VideoElement  to js.html.VideoElement {
		public var width (get, set): Int;
		public var height (get, set): Int;

		inline function get_width() return this.width;
		inline function set_width(v: Int) return this.width = v;
		inline function get_height() return this.height;
		inline function set_height(v: Int) return this.height = v;
	}
#end

private typedef InternalGLContext = 
	#if js
		js.html.webgl.RenderingContext;
	#elseif cpp
		gluon.webgl.native.GLContext;
	#else
		Dynamic;
	#end

private typedef InternalConstGLContext =
	#if js
		js.html.webgl.RenderingContext;
	#elseif cpp
		gluon.webgl.native.GLContext;
	#else
		Dynamic;
	#end

#if debug
#if !display
@:build(gluon.webgl.GLContextDebug.addErrorChecking())
#end
#end
// @:nullSafety (cannot enable null safety because webgl externs are missing nullablity in certain cases)
abstract GLContext(InternalGLContext) from InternalGLContext to InternalGLContext {

	public inline function getContextAttributes():Null<GLContextAttributes>
		return this.getContextAttributes();

	public inline function getSupportedExtensions():Array<String>
		return this.getSupportedExtensions();

	public inline function getExtension<T>(name: Extension<T>):Null<T>
		return this.getExtension((name: String));

	public inline function isContextLost():Bool
		return this.isContextLost();

	public inline function activeTexture(unit:TextureUnit)
		this.activeTexture(unit);

	public inline function attachShader(program:GLProgram, shader:GLShader)
		this.attachShader(program, shader);

	public inline function bindAttribLocation(program:GLProgram, index:GLuint, name:String)
		this.bindAttribLocation(program, index, name);

	public inline function bindBuffer(target:BufferTarget, ?buffer:GLBuffer)
		this.bindBuffer(target, buffer);

	public inline function bindFramebuffer(target:FramebufferTarget, ?framebuffer:GLFramebuffer)
		this.bindFramebuffer(target, framebuffer);

	public inline function bindRenderbuffer(target:RenderbufferTarget, ?renderbuffer:GLRenderbuffer)
		this.bindRenderbuffer(target, renderbuffer);

	public inline function bindTexture(target:TextureTarget, ?texture:GLTexture)
		this.bindTexture(target, texture);

	public inline function blendColor(red:GLclampf, green:GLclampf, blue:GLclampf, alpha:GLclampf)
		this.blendColor(red, green, blue, alpha);

	public inline function blendEquation(mode:BlendEquation)
		this.blendEquation(mode);

	public inline function blendEquationSeparate(modeRGB:BlendEquation, modeAlpha:BlendEquation):Void
		this.blendEquationSeparate(modeRGB, modeAlpha);

	public inline function blendFunc(sfactor:BlendFactor, dfactor:BlendFactor):Void
		this.blendFunc(sfactor, dfactor);

	public inline function blendFuncSeparate(srcRGB:BlendFactor, dstRGB:BlendFactor, srcAlpha:BlendFactor, dstAlpha:BlendFactor):Void
		this.blendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha);

	public inline function bufferData(target:BufferTarget, data:BufferSource, usage:BufferUsage)
		this.bufferData(target, data, usage);
	
	public inline function bufferDataOfSize(target:BufferTarget, size:Int, usage:BufferUsage) {
		#if js
		this.bufferData(target, size, usage);
		#else
		this.bufferDataOfSize(target, size, usage);
		#end
	}

	public inline function bufferSubData(target:BufferTarget, offset:GLintptr, data:BufferSource)
		this.bufferSubData(target, offset, data);

	public inline function checkFramebufferStatus(target:FramebufferTarget):FramebufferStatus
		return this.checkFramebufferStatus(target);

	public inline function clear(mask:ClearBufferMask)
		this.clear(mask);

	public inline function clearColor(red:GLclampf, green:GLclampf, blue:GLclampf, alpha:GLclampf)
		this.clearColor(red, green, blue, alpha);

	public inline function clearDepth(depth:GLclampf)
		this.clearDepth(depth);

	public inline function clearStencil(s:GLint)
		this.clearStencil(s);

	public inline function colorMask(red:Bool, green:Bool, blue:Bool, alpha:Bool)
		this.colorMask(red, green, blue, alpha);

	public inline function compileShader(shader:GLShader)
		this.compileShader(shader);

	public inline function compressedTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, width:GLsizei, height:GLsizei, border:GLint, data:GLArrayBufferView)
		this.compressedTexImage2D(target, level, internalformat, width, height, border, data);

	public inline function compressedTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, data:GLArrayBufferView)
		this.compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, data);

	public inline function copyTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, x:GLint, y:GLint, width:GLsizei, height:GLsizei, border:GLint)
		this.copyTexImage2D(target, level, internalformat, x, y, width, height, border);

	public inline function copyTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, x:GLint, y:GLint, width:GLsizei, height:GLsizei)
		this.copyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);

	public inline function createBuffer():Null<GLBuffer>
		return this.createBuffer();

	public inline function createFramebuffer():Null<GLFramebuffer>
		return this.createFramebuffer();

	public inline function createProgram():Null<GLProgram>
		return this.createProgram();

	public inline function createRenderbuffer():Null<GLRenderbuffer>
		return this.createRenderbuffer();

	public inline function createShader(type:ShaderType):Null<GLShader>
		return this.createShader(type);

	public inline function createTexture():Null<GLTexture>
		return this.createTexture();

	public inline function cullFace(mode:CullFaceMode)
		this.cullFace(mode);

	public inline function deleteBuffer(?buffer:GLBuffer)
		this.deleteBuffer(buffer);

	public inline function deleteFramebuffer(?framebuffer:GLFramebuffer)
		this.deleteFramebuffer(framebuffer);

	public inline function deleteProgram(?program:GLProgram)
		this.deleteProgram(program);

	public inline function deleteRenderbuffer(?renderbuffer:GLRenderbuffer)
		this.deleteRenderbuffer(renderbuffer);

	public inline function deleteShader(?shader:GLShader)
		this.deleteShader(shader);

	public inline function deleteTexture(?texture:GLTexture)
		this.deleteTexture(texture);

	public inline function depthFunc(func:ComparisonFunction):Void
		this.depthFunc(func);

	public inline function depthMask(flag:Bool):Void
		this.depthMask(flag);

	public inline function depthRange(zNear:GLclampf, zFar:GLclampf):Void
		this.depthRange(zNear, zFar);

	public inline function detachShader(program:GLProgram, shader:GLShader)
		this.detachShader(program, shader);

	public inline function disable(cap:Capability)
		this.disable(cap);

	public inline function disableVertexAttribArray(index:GLuint)
		this.disableVertexAttribArray(index);

	public inline function drawArrays(mode:DrawMode, first:GLint, count:GLsizei)
		this.drawArrays(mode, first, count);

	public inline function drawElements(mode:DrawMode, count:GLsizei, type:DataType, offset:GLintptr)
		this.drawElements(mode, count, type, offset);

	public inline function enable(cap:Capability)
		this.enable(cap);

	public inline function enableVertexAttribArray(index:GLuint)
		this.enableVertexAttribArray(index);

	public inline function finish()
		this.finish();

	public inline function flush()
		this.flush();

	public inline function framebufferRenderbuffer(target:FramebufferTarget, attachment:FramebufferAttachement, renderbuffertarget:RenderbufferTarget, ?renderbuffer:GLRenderbuffer)
		this.framebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);

	public inline function framebufferTexture2D(target:FramebufferTarget, attachment:FramebufferAttachement, textarget:TextureTarget, ?texture:GLTexture, level:GLint)
		this.framebufferTexture2D(target, attachment, textarget, texture, level);

	public inline function frontFace(mode:FrontFaceDirection)
		this.frontFace(mode);

	public inline function generateMipmap(target:TextureTarget)
		this.generateMipmap(target);

	public inline function getActiveAttrib(program:GLProgram, index:GLuint):GLActiveInfo
		return this.getActiveAttrib(program, index);

	public inline function getActiveUniform(program:GLProgram, index:GLuint):GLActiveInfo
		return this.getActiveUniform(program, index);

	public inline function getAttachedShaders(program:GLProgram):Array<GLShader>
		return cast this.getAttachedShaders(program);

	public inline function getAttribLocation(program:GLProgram, name:String):GLint
		return this.getAttribLocation(program, name);

	public inline function getBufferParameter<T>(target:BufferTarget, pname:BufferParameter<T>):T
		return this.getBufferParameter(target, pname);

	public inline function getParameter<T>(pname:Parameter<T>):Null<T>
	    return this.getParameter(pname);

	public inline function getError():ErrorCode
	    return this.getError();

	public inline function getFramebufferAttachmentParameter<T>(target:FramebufferTarget, attachment:FramebufferAttachement, pname:FramebufferAttachmentParameter<T>):Null<T>
		return this.getFramebufferAttachmentParameter(target, attachment, pname);

	public inline function getProgramParameter<T>(program:GLProgram, pname:ProgramParameter<T>):T
		return this.getProgramParameter(program, pname);

	public inline function getProgramInfoLog(program:GLProgram):String
		return this.getProgramInfoLog(program);

	public inline function getRenderbufferParameter<T>(target:RenderbufferTarget, pname:RenderbufferParameter<T>):T
		return this.getRenderbufferParameter(target, pname);

	public inline function getShaderParameter<T>(shader:GLShader, pname:ShaderParameter<T>):T
		return this.getShaderParameter(shader, pname);

	public inline function getShaderPrecisionFormat(shadertype:ShaderType, precisiontype:PrecisionType):GLShaderPrecisionFormat
		return this.getShaderPrecisionFormat(shadertype, precisiontype);

	public inline function getShaderInfoLog(shader:GLShader):String
		return this.getShaderInfoLog(shader);

	public inline function getShaderSource(shader:GLShader):String
		return this.getShaderSource(shader);

	public inline function getTexParameter<T>(target:TextureTarget, pname:TextureParameter<T>):T
		return this.getTexParameter(target, pname);

	public inline function getUniform(program:GLProgram, location:GLUniformLocation):Dynamic
		return this.getUniform(program, location);

	public inline function getUniformLocation(program:GLProgram, name:String):GLUniformLocation
		return this.getUniformLocation(program, name);

	public inline function getVertexAttrib<T>(index:GLuint, pname:VertexAttributeParameter<T>):Null<T>
		return this.getVertexAttrib(index, pname);

	public inline function getVertexAttribOffset(index:GLuint, pname:VertexAttributeOffsetParameter):GLsizeiptr
		return this.getVertexAttribOffset(index, pname);

	public inline function hint(target:HintTarget, mode:HintMode)
		this.hint(target, mode);

	public inline function isEnabled(cap:Capability):Bool
		return this.isEnabled(cap);

	public inline function isBuffer(?buffer:GLBuffer):Bool
		return this.isBuffer(buffer);

	public inline function isFramebuffer(?framebuffer:GLFramebuffer):Bool
		return this.isFramebuffer(framebuffer);

	public inline function isProgram(?program:GLProgram):Bool
		return this.isProgram(program);

	public inline function isRenderbuffer(?renderbuffer:GLRenderbuffer):Bool
		return this.isRenderbuffer(renderbuffer);

	public inline function isShader(?shader:GLShader):Bool
		return this.isShader(shader);

	public inline function isTexture(?texture:GLTexture):Bool
		return this.isTexture(texture);

	public inline function lineWidth(width:GLfloat)
		this.lineWidth(width);

	public inline function linkProgram(program:GLProgram)
		this.linkProgram(program);

	public inline function pixelStorei<T>(pname:PixelStoreParameter<T>, param:T)
		this.pixelStorei(pname, cast param);

	public inline function polygonOffset(factor:GLfloat, units:GLfloat)
		this.polygonOffset(factor, units);

	public inline function readPixels(x:GLint, y:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView)
		this.readPixels(x, y, width, height, format, type, pixels);

	public inline function renderbufferStorage(target:RenderbufferTarget, internalformat:RenderbufferFormat, width:GLsizei, height:GLsizei)
		this.renderbufferStorage(target, internalformat, width, height);

	public inline function sampleCoverage(value:GLclampf, invert:Bool)
		this.sampleCoverage(value, invert);

	public inline function scissor(x:GLint, y:GLint, width:GLsizei, height:GLsizei)
		this.scissor(x, y, width, height);

	public inline function shaderSource(shader:GLShader, source:String)
		this.shaderSource(shader, source);

	public inline function stencilFunc(func:ComparisonFunction, ref:GLint, mask:GLuint)
		this.stencilFunc(func, ref, mask);

	public inline function stencilFuncSeparate(face:CullFaceMode, func:ComparisonFunction, ref:GLint, mask:GLuint)
		this.stencilFuncSeparate(face, func, ref, mask);

	public inline function stencilMask(mask:GLuint)
		this.stencilMask(mask);

	public inline function stencilMaskSeparate(face:CullFaceMode, mask:GLuint)
		this.stencilMaskSeparate(face, mask);

	public inline function stencilOp(fail:Operation, zfail:Operation, zpass:Operation)
		this.stencilOp(fail, zfail, zpass);

	public inline function stencilOpSeparate(face:CullFaceMode, fail:Operation, zfail:Operation, zpass:Operation)
		this.stencilOpSeparate(face, fail, zfail, zpass);

	public inline function texImage2D(target:TextureTarget, level:GLint, internalformat:GLint, width:GLsizei, height:GLsizei, border:GLint, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView)
		this.texImage2D(target, level, internalformat, width, height, border, format, type, pixels);

	#if cpp
	public inline function texImage2DPtr(target:TextureTarget, level:GLint, internalformat:GLint, width:GLsizei, height:GLsizei, border:GLint, format:PixelFormat, type:PixelDataType, pixels:cpp.RawConstPointer<cpp.Void>)
		this.texImage2DPtr(target, level, internalformat, width, height, border, format, type, pixels);
	#end

	#if js
	public inline function texImage2DDOM(target:TextureTarget, level:GLint, internalformat:GLint, format:PixelFormat, type:PixelDataType, source:TexImageSource)
		this.texImage2D(target, level, internalformat, format, type, source);
	#end

	public inline function texParameterf<T:GLfloat>(target:TextureTarget, pname:TextureParameter<T>, param:T)
		this.texParameterf(target, pname, param);

	public inline function texParameteri<T:GLint>(target:TextureTarget, pname:TextureParameter<T>, param:T)
		this.texParameteri(target, pname, param);

	public inline function texSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelDataType, pixels:GLArrayBufferView)
		this.texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels);

	#if js
	public inline function texSubImage2DDOM(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, format:PixelFormat, type:PixelDataType, source:TexImageSource)
		this.texSubImage2D(target, level, xoffset, yoffset, format, type, source);
	#end

	public inline function uniform1f(location:GLUniformLocation, x:GLfloat)
		this.uniform1f(location, x);

	public inline function uniform1fv(location:GLUniformLocation, v:GLFloat32Array)
		this.uniform1fv(location, v);

	public inline function uniform1i(location:GLUniformLocation, x:GLint)
		this.uniform1i(location, x);

	public inline function uniform1iv(location:GLUniformLocation, v:GLInt32Array)
		this.uniform1iv(location, v);

	public inline function uniform2f(location:GLUniformLocation, x:GLfloat, y:GLfloat)
		this.uniform2f(location, x, y);

	public inline function uniform2fv(location:GLUniformLocation, v:GLFloat32Array)
		this.uniform2fv(location, v);

	public inline function uniform2i(location:GLUniformLocation, x:GLint, y:GLint)
		this.uniform2i(location, x, y);

	public inline function uniform2iv(location:GLUniformLocation, v:GLInt32Array)
		this.uniform2iv(location, v);

	public inline function uniform3f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat)
		this.uniform3f(location, x, y, z);

	public inline function uniform3fv(location:GLUniformLocation, v:GLFloat32Array)
		this.uniform3fv(location, v);

	public inline function uniform3i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint)
		this.uniform3i(location, x, y, z);

	public inline function uniform3iv(location:GLUniformLocation, v:GLInt32Array)
		this.uniform3iv(location, v);

	public inline function uniform4f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat)
		this.uniform4f(location, x, y, z, w);

	public inline function uniform4fv(location:GLUniformLocation, v:GLFloat32Array)
		this.uniform4fv(location, v);

	public inline function uniform4i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint, w:GLint)
		this.uniform4i(location, x, y, z, w);

	public inline function uniform4iv(location:GLUniformLocation, v:GLInt32Array)
		this.uniform4iv(location, v);

	public inline function uniformMatrix2fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array)
		this.uniformMatrix2fv(location, transpose, value);

	public inline function uniformMatrix3fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array)
		this.uniformMatrix3fv(location, transpose, value);

	public inline function uniformMatrix4fv(location:GLUniformLocation, transpose:Bool, value:GLFloat32Array)
		this.uniformMatrix4fv(location, transpose, value);

	public inline function useProgram(?program:GLProgram)
		this.useProgram(program);

	public inline function validateProgram(program:GLProgram)
		this.validateProgram(program);

	public inline function vertexAttrib1f(index:GLuint, x:GLfloat)
		this.vertexAttrib1f(index, x);

	public inline function vertexAttrib1fv(index:GLuint, values:GLFloat32Array)
		this.vertexAttrib1fv(index, values);

	public inline function vertexAttrib2f(index:GLuint, x:GLfloat, y:GLfloat)
		this.vertexAttrib2f(index, x, y);

	public inline function vertexAttrib2fv(index:GLuint, values:GLFloat32Array)
		this.vertexAttrib2fv(index, values);

	public inline function vertexAttrib3f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat)
		this.vertexAttrib3f(index, x, y, z);

	public inline function vertexAttrib3fv(index:GLuint, values:GLFloat32Array)
		this.vertexAttrib3fv(index, values);

	public inline function vertexAttrib4f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat)
		this.vertexAttrib4f(index, x, y, z, w);

	public inline function vertexAttrib4fv(index:GLuint, values:GLFloat32Array)
		this.vertexAttrib4fv(index, values);

	public inline function vertexAttribPointer(index:GLuint, size:GLint, type:DataType, normalized:Bool, stride:GLsizei, offset:GLintptr)
		this.vertexAttribPointer(index, size, type, normalized, stride, offset);

	public inline function viewport(x:GLint, y:GLint, width:GLsizei, height:GLsizei)
		this.viewport(x, y, width, height);

}

// Constants

@:enum
abstract BufferTarget(GLenum) to GLenum from GLenum{
	var ARRAY_BUFFER         = InternalConstGLContext.ARRAY_BUFFER;
	var ELEMENT_ARRAY_BUFFER = InternalConstGLContext.ELEMENT_ARRAY_BUFFER;
}

@:enum
abstract FramebufferTarget(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER = InternalConstGLContext.FRAMEBUFFER;
}

@:enum
abstract RenderbufferTarget(GLenum) to GLenum from GLenum{
	var RENDERBUFFER = InternalConstGLContext.RENDERBUFFER;
}

@:enum
abstract HintTarget(GLenum) to GLenum from GLenum{
	var GENERATE_MIPMAP_HINT = InternalConstGLContext.GENERATE_MIPMAP_HINT;
}

@:enum
abstract TextureTarget(GLenum) to GLenum from GLenum{
	var TEXTURE                     = InternalConstGLContext.TEXTURE;
	var TEXTURE_2D                  = InternalConstGLContext.TEXTURE_2D;
	var TEXTURE_CUBE_MAP            = InternalConstGLContext.TEXTURE_CUBE_MAP;
	var TEXTURE_CUBE_MAP_POSITIVE_X = InternalConstGLContext.TEXTURE_CUBE_MAP_POSITIVE_X;
	var TEXTURE_CUBE_MAP_NEGATIVE_X = InternalConstGLContext.TEXTURE_CUBE_MAP_NEGATIVE_X;
	var TEXTURE_CUBE_MAP_POSITIVE_Y = InternalConstGLContext.TEXTURE_CUBE_MAP_POSITIVE_Y;
	var TEXTURE_CUBE_MAP_NEGATIVE_Y = InternalConstGLContext.TEXTURE_CUBE_MAP_NEGATIVE_Y;
	var TEXTURE_CUBE_MAP_POSITIVE_Z = InternalConstGLContext.TEXTURE_CUBE_MAP_POSITIVE_Z;
	var TEXTURE_CUBE_MAP_NEGATIVE_Z = InternalConstGLContext.TEXTURE_CUBE_MAP_NEGATIVE_Z;
}

@:enum
abstract BufferUsage(GLenum) to GLenum from GLenum{
	var STREAM_DRAW  = InternalConstGLContext.STREAM_DRAW;
	var STATIC_DRAW  = InternalConstGLContext.STATIC_DRAW;
	var DYNAMIC_DRAW = InternalConstGLContext.DYNAMIC_DRAW;
}

@:enum
abstract CullFaceMode(GLenum) to GLenum from GLenum{
	var FRONT          = InternalConstGLContext.FRONT;
	var BACK           = InternalConstGLContext.BACK;
	var FRONT_AND_BACK = InternalConstGLContext.FRONT_AND_BACK;
}

@:enum
abstract FramebufferStatus(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER_COMPLETE                      = InternalConstGLContext.FRAMEBUFFER_COMPLETE;
	var FRAMEBUFFER_INCOMPLETE_ATTACHMENT         = InternalConstGLContext.FRAMEBUFFER_INCOMPLETE_ATTACHMENT;
	var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = InternalConstGLContext.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT;
	var FRAMEBUFFER_INCOMPLETE_DIMENSIONS         = InternalConstGLContext.FRAMEBUFFER_INCOMPLETE_DIMENSIONS;
	var FRAMEBUFFER_UNSUPPORTED                   = InternalConstGLContext.FRAMEBUFFER_UNSUPPORTED;
}

@:enum
abstract BlendEquation(GLenum) to GLenum from GLenum{
	var FUNC_ADD              = InternalConstGLContext.FUNC_ADD;
	var FUNC_SUBTRACT         = InternalConstGLContext.FUNC_SUBTRACT;
	var FUNC_REVERSE_SUBTRACT = InternalConstGLContext.FUNC_REVERSE_SUBTRACT;
}

@:enum
abstract BlendFactor(GLenum) to GLenum from GLenum{
	var ZERO                     = InternalConstGLContext.ZERO;
	var ONE                      = InternalConstGLContext.ONE;
	var SRC_COLOR                = InternalConstGLContext.SRC_COLOR;
	var ONE_MINUS_SRC_COLOR      = InternalConstGLContext.ONE_MINUS_SRC_COLOR;
	var DST_COLOR                = InternalConstGLContext.DST_COLOR;
	var ONE_MINUS_DST_COLOR      = InternalConstGLContext.ONE_MINUS_DST_COLOR;
	var SRC_ALPHA                = InternalConstGLContext.SRC_ALPHA;
	var ONE_MINUS_SRC_ALPHA      = InternalConstGLContext.ONE_MINUS_SRC_ALPHA;
	var DST_ALPHA                = InternalConstGLContext.DST_ALPHA;
	var ONE_MINUS_DST_ALPHA      = InternalConstGLContext.ONE_MINUS_DST_ALPHA;
	var CONSTANT_COLOR           = InternalConstGLContext.CONSTANT_COLOR;
	var ONE_MINUS_CONSTANT_COLOR = InternalConstGLContext.ONE_MINUS_CONSTANT_COLOR;
	var CONSTANT_ALPHA           = InternalConstGLContext.CONSTANT_ALPHA;
	var ONE_MINUS_CONSTANT_ALPHA = InternalConstGLContext.ONE_MINUS_CONSTANT_ALPHA;
	var SRC_ALPHA_SATURATE       = InternalConstGLContext.SRC_ALPHA_SATURATE;
}

@:enum
abstract ClearBufferMask(GLenum) to GLenum from GLenum{
	var DEPTH_BUFFER_BIT   = InternalConstGLContext.DEPTH_BUFFER_BIT;
	var STENCIL_BUFFER_BIT = InternalConstGLContext.STENCIL_BUFFER_BIT;
	var COLOR_BUFFER_BIT   = InternalConstGLContext.COLOR_BUFFER_BIT;
}

@:enum
abstract DrawMode(GLenum) to GLenum from GLenum{
	var POINTS         = InternalConstGLContext.POINTS;
	var LINES          = InternalConstGLContext.LINES;
	var LINE_LOOP      = InternalConstGLContext.LINE_LOOP;
	var LINE_STRIP     = InternalConstGLContext.LINE_STRIP;
	var TRIANGLES      = InternalConstGLContext.TRIANGLES;
	var TRIANGLE_STRIP = InternalConstGLContext.TRIANGLE_STRIP;
	var TRIANGLE_FAN   = InternalConstGLContext.TRIANGLE_FAN;
}

@:enum
abstract TextureMagFilter(GLenum) to GLenum from GLenum to TextureMinFilter {
	var NEAREST = InternalConstGLContext.NEAREST;
	var LINEAR  = InternalConstGLContext.LINEAR;
}

@:enum
abstract TextureMinFilter(GLenum) to GLenum from GLenum{
	var NEAREST                = InternalConstGLContext.NEAREST;
	var LINEAR                 = InternalConstGLContext.LINEAR;
	var NEAREST_MIPMAP_NEAREST = InternalConstGLContext.NEAREST_MIPMAP_NEAREST;
	var LINEAR_MIPMAP_NEAREST  = InternalConstGLContext.LINEAR_MIPMAP_NEAREST;
	var NEAREST_MIPMAP_LINEAR  = InternalConstGLContext.NEAREST_MIPMAP_LINEAR;
	var LINEAR_MIPMAP_LINEAR   = InternalConstGLContext.LINEAR_MIPMAP_LINEAR;
}

@:enum
abstract TextureWrapMode(GLenum) to GLenum from GLenum{
	var REPEAT          = InternalConstGLContext.REPEAT;
	var CLAMP_TO_EDGE   = InternalConstGLContext.CLAMP_TO_EDGE;
	var MIRRORED_REPEAT = InternalConstGLContext.MIRRORED_REPEAT;
}

@:enum
abstract TextureUnit(GLenum) to GLenum from GLenum{
	var TEXTURE0  = InternalConstGLContext.TEXTURE0;
	var TEXTURE1  = InternalConstGLContext.TEXTURE1;
	var TEXTURE2  = InternalConstGLContext.TEXTURE2;
	var TEXTURE3  = InternalConstGLContext.TEXTURE3;
	var TEXTURE4  = InternalConstGLContext.TEXTURE4;
	var TEXTURE5  = InternalConstGLContext.TEXTURE5;
	var TEXTURE6  = InternalConstGLContext.TEXTURE6;
	var TEXTURE7  = InternalConstGLContext.TEXTURE7;
	var TEXTURE8  = InternalConstGLContext.TEXTURE8;
	var TEXTURE9  = InternalConstGLContext.TEXTURE9;
	var TEXTURE10 = InternalConstGLContext.TEXTURE10;
	var TEXTURE11 = InternalConstGLContext.TEXTURE11;
	var TEXTURE12 = InternalConstGLContext.TEXTURE12;
	var TEXTURE13 = InternalConstGLContext.TEXTURE13;
	var TEXTURE14 = InternalConstGLContext.TEXTURE14;
	var TEXTURE15 = InternalConstGLContext.TEXTURE15;
	var TEXTURE16 = InternalConstGLContext.TEXTURE16;
	var TEXTURE17 = InternalConstGLContext.TEXTURE17;
	var TEXTURE18 = InternalConstGLContext.TEXTURE18;
	var TEXTURE19 = InternalConstGLContext.TEXTURE19;
	var TEXTURE20 = InternalConstGLContext.TEXTURE20;
	var TEXTURE21 = InternalConstGLContext.TEXTURE21;
	var TEXTURE22 = InternalConstGLContext.TEXTURE22;
	var TEXTURE23 = InternalConstGLContext.TEXTURE23;
	var TEXTURE24 = InternalConstGLContext.TEXTURE24;
	var TEXTURE25 = InternalConstGLContext.TEXTURE25;
	var TEXTURE26 = InternalConstGLContext.TEXTURE26;
	var TEXTURE27 = InternalConstGLContext.TEXTURE27;
	var TEXTURE28 = InternalConstGLContext.TEXTURE28;
	var TEXTURE29 = InternalConstGLContext.TEXTURE29;
	var TEXTURE30 = InternalConstGLContext.TEXTURE30;
	var TEXTURE31 = InternalConstGLContext.TEXTURE31;
}

@:enum
abstract ShaderType(GLenum) to GLenum from GLenum{
	var FRAGMENT_SHADER = InternalConstGLContext.FRAGMENT_SHADER;
	var VERTEX_SHADER   = InternalConstGLContext.VERTEX_SHADER;
}

@:enum
abstract DataType(GLenum) to GLenum from GLenum{
	var BYTE           = InternalConstGLContext.BYTE;
	var UNSIGNED_BYTE  = InternalConstGLContext.UNSIGNED_BYTE;
	var SHORT          = InternalConstGLContext.SHORT;
	var UNSIGNED_SHORT = InternalConstGLContext.UNSIGNED_SHORT;
	var INT            = InternalConstGLContext.INT;
	var UNSIGNED_INT   = InternalConstGLContext.UNSIGNED_INT;
	var FLOAT          = InternalConstGLContext.FLOAT;
}

@:enum
abstract PixelDataType(GLenum) to GLenum from GLenum {
	var UNSIGNED_BYTE          = InternalConstGLContext.UNSIGNED_BYTE;
	var UNSIGNED_SHORT_4_4_4_4 = InternalConstGLContext.UNSIGNED_SHORT_4_4_4_4;
	var UNSIGNED_SHORT_5_5_5_1 = InternalConstGLContext.UNSIGNED_SHORT_5_5_5_1;
	var UNSIGNED_SHORT_5_6_5   = InternalConstGLContext.UNSIGNED_SHORT_5_6_5;
	/** requires enabling floating point texture extension, OES_texture_float **/
	var FLOAT                  = InternalConstGLContext.FLOAT;
	/** requires enabling half-floating point texture extension, OES_texture_half_float **/
	var HALF_FLOAT_OES         = 0x8D61;
}

@:enum
abstract PixelFormat(GLenum) to GLenum from GLenum{
	var DEPTH_COMPONENT = InternalConstGLContext.DEPTH_COMPONENT;
	var ALPHA           = InternalConstGLContext.ALPHA;
	var RGB             = InternalConstGLContext.RGB;
	var RGBA            = InternalConstGLContext.RGBA;
	var LUMINANCE       = InternalConstGLContext.LUMINANCE;
	var LUMINANCE_ALPHA = InternalConstGLContext.LUMINANCE_ALPHA;
}

@:enum
abstract RenderbufferFormat(GLenum) to GLenum from GLenum{
	var RGBA4             = InternalConstGLContext.RGBA4;
	var RGB5_A1           = InternalConstGLContext.RGB5_A1;
	var RGB565            = InternalConstGLContext.RGB565;
	var DEPTH_COMPONENT16 = InternalConstGLContext.DEPTH_COMPONENT16;
	var STENCIL_INDEX8    = InternalConstGLContext.STENCIL_INDEX8;
	var DEPTH_STENCIL     = InternalConstGLContext.DEPTH_STENCIL;
}

@:enum
abstract UniformType(GLenum) to GLenum from GLenum{
	var FLOAT        = InternalConstGLContext.FLOAT;
	var FLOAT_VEC2   = InternalConstGLContext.FLOAT_VEC2;
	var FLOAT_VEC3   = InternalConstGLContext.FLOAT_VEC3;
	var FLOAT_VEC4   = InternalConstGLContext.FLOAT_VEC4;
	var INT          = InternalConstGLContext.INT;
	var INT_VEC2     = InternalConstGLContext.INT_VEC2;
	var INT_VEC3     = InternalConstGLContext.INT_VEC3;
	var INT_VEC4     = InternalConstGLContext.INT_VEC4;
	var BOOL         = InternalConstGLContext.BOOL;
	var BOOL_VEC2    = InternalConstGLContext.BOOL_VEC2;
	var BOOL_VEC3    = InternalConstGLContext.BOOL_VEC3;
	var BOOL_VEC4    = InternalConstGLContext.BOOL_VEC4;
	var FLOAT_MAT2   = InternalConstGLContext.FLOAT_MAT2;
	var FLOAT_MAT3   = InternalConstGLContext.FLOAT_MAT3;
	var FLOAT_MAT4   = InternalConstGLContext.FLOAT_MAT4;
	var SAMPLER_2D   = InternalConstGLContext.SAMPLER_2D;
	var SAMPLER_CUBE = InternalConstGLContext.SAMPLER_CUBE;
}

@:enum
abstract AttributeType(GLenum) to GLenum from GLenum to UniformType {
	var FLOAT      = InternalConstGLContext.FLOAT;
	var FLOAT_VEC2 = InternalConstGLContext.FLOAT_VEC2;
	var FLOAT_VEC3 = InternalConstGLContext.FLOAT_VEC3;
	var FLOAT_VEC4 = InternalConstGLContext.FLOAT_VEC4;
	var FLOAT_MAT2 = InternalConstGLContext.FLOAT_MAT2;
	var FLOAT_MAT3 = InternalConstGLContext.FLOAT_MAT3;
	var FLOAT_MAT4 = InternalConstGLContext.FLOAT_MAT4;
}

@:enum
abstract ComparisonFunction(GLenum) to GLenum from GLenum{
	var NEVER    = InternalConstGLContext.NEVER;
	var LESS     = InternalConstGLContext.LESS;
	var EQUAL    = InternalConstGLContext.EQUAL;
	var LEQUAL   = InternalConstGLContext.LEQUAL;
	var GREATER  = InternalConstGLContext.GREATER;
	var NOTEQUAL = InternalConstGLContext.NOTEQUAL;
	var GEQUAL   = InternalConstGLContext.GEQUAL;
	var ALWAYS   = InternalConstGLContext.ALWAYS;
}

@:enum
abstract Operation(GLenum) to GLenum from GLenum{
	var ZERO                          = InternalConstGLContext.ZERO;
	var KEEP                          = InternalConstGLContext.KEEP;
	var REPLACE                       = InternalConstGLContext.REPLACE;
	var INCR                          = InternalConstGLContext.INCR;
	var DECR                          = InternalConstGLContext.DECR;
	var INVERT                        = InternalConstGLContext.INVERT;
	var INCR_WRAP                     = InternalConstGLContext.INCR_WRAP;
	var DECR_WRAP                     = InternalConstGLContext.DECR_WRAP;
}

@:enum
abstract ErrorCode(GLenum) to GLenum from GLenum{
	var NO_ERROR                      = InternalConstGLContext.NO_ERROR;
	var INVALID_ENUM                  = InternalConstGLContext.INVALID_ENUM;
	var INVALID_VALUE                 = InternalConstGLContext.INVALID_VALUE;
	var INVALID_OPERATION             = InternalConstGLContext.INVALID_OPERATION;
	var INVALID_FRAMEBUFFER_OPERATION = InternalConstGLContext.INVALID_FRAMEBUFFER_OPERATION;
	var OUT_OF_MEMORY                 = InternalConstGLContext.OUT_OF_MEMORY;
}

@:enum
abstract FrontFaceDirection(GLenum) to GLenum from GLenum{
	var CW  = InternalConstGLContext.CW;
	var CCW = InternalConstGLContext.CCW;
}

@:enum
abstract Capability(GLenum) to GLenum from GLenum{
	var CULL_FACE                = InternalConstGLContext.CULL_FACE;
	var BLEND                    = InternalConstGLContext.BLEND;
	var DITHER                   = InternalConstGLContext.DITHER;
	var STENCIL_TEST             = InternalConstGLContext.STENCIL_TEST;
	var DEPTH_TEST               = InternalConstGLContext.DEPTH_TEST;
	var SCISSOR_TEST             = InternalConstGLContext.SCISSOR_TEST;
	var POLYGON_OFFSET_FILL      = InternalConstGLContext.POLYGON_OFFSET_FILL;
	var SAMPLE_ALPHA_TO_COVERAGE = InternalConstGLContext.SAMPLE_ALPHA_TO_COVERAGE;
	var SAMPLE_COVERAGE          = InternalConstGLContext.SAMPLE_COVERAGE;
}

@:enum
abstract FramebufferAttachement(GLenum) to GLenum from GLenum{
	var COLOR_ATTACHMENT0        = InternalConstGLContext.COLOR_ATTACHMENT0;
	var DEPTH_ATTACHMENT         = InternalConstGLContext.DEPTH_ATTACHMENT;
	var STENCIL_ATTACHMENT       = InternalConstGLContext.STENCIL_ATTACHMENT;

	//@! review webgl specific
	//https://www.khronos.org/registry/webgl/specs/latest/1.0/#6.6
	var DEPTH_STENCIL_ATTACHMENT = InternalConstGLContext.DEPTH_STENCIL_ATTACHMENT;
}

@:enum
abstract HintMode(GLenum) to GLenum from GLenum{
	var DONT_CARE = InternalConstGLContext.DONT_CARE;
	var FASTEST   = InternalConstGLContext.FASTEST;
	var NICEST    = InternalConstGLContext.NICEST;
}

@:enum
abstract PrecisionType(GLenum) to GLenum from GLenum{
	var LOW_FLOAT    = InternalConstGLContext.LOW_FLOAT;
	var MEDIUM_FLOAT = InternalConstGLContext.MEDIUM_FLOAT;
	var HIGH_FLOAT   = InternalConstGLContext.HIGH_FLOAT;
	var LOW_INT      = InternalConstGLContext.LOW_INT;
	var MEDIUM_INT   = InternalConstGLContext.MEDIUM_INT;
	var HIGH_INT     = InternalConstGLContext.HIGH_INT;
}

@:enum
abstract FramebufferAttachmentObjectType(GLenum) to GLenum from GLenum{
	var NONE         = InternalConstGLContext.NONE;
	var TEXTURE      = InternalConstGLContext.TEXTURE;
	var RENDERBUFFER = InternalConstGLContext.RENDERBUFFER;
}

@:enum
abstract BufferParameter<T>(GLenum) to GLenum from GLenum{
	var BUFFER_SIZE:BufferParameter<GLint>        = InternalConstGLContext.BUFFER_SIZE;
	var BUFFER_USAGE:BufferParameter<BufferUsage> = InternalConstGLContext.BUFFER_USAGE;
}

private abstract FramebufferAttachmentObjectName(Dynamic)
	to GLRenderbuffer from GLRenderbuffer
	to GLTexture from GLTexture {}

@:enum
abstract FramebufferAttachmentParameter<T>(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:FramebufferAttachmentParameter<FramebufferAttachmentObjectType> = InternalConstGLContext.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE;
	var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:FramebufferAttachmentParameter<FramebufferAttachmentObjectName> = InternalConstGLContext.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME;
	var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:FramebufferAttachmentParameter<GLint>                         = InternalConstGLContext.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL;
	var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:FramebufferAttachmentParameter<GLint>                 = InternalConstGLContext.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE;
}

@:enum
abstract ProgramParameter<T>(GLenum) to GLenum from GLenum{
	var DELETE_STATUS:ProgramParameter<Bool>      = InternalConstGLContext.DELETE_STATUS;
	var LINK_STATUS:ProgramParameter<Bool>        = InternalConstGLContext.LINK_STATUS;
	var VALIDATE_STATUS:ProgramParameter<Bool>    = InternalConstGLContext.VALIDATE_STATUS;
	var ATTACHED_SHADERS:ProgramParameter<GLint>  = InternalConstGLContext.ATTACHED_SHADERS;
	var ACTIVE_ATTRIBUTES:ProgramParameter<GLint> = InternalConstGLContext.ACTIVE_ATTRIBUTES;
	var ACTIVE_UNIFORMS:ProgramParameter<GLint>   = InternalConstGLContext.ACTIVE_UNIFORMS;
}

@:enum
abstract ShaderParameter<T>(GLenum) to GLenum from GLenum{
	var SHADER_TYPE:ShaderParameter<ShaderType>  = InternalConstGLContext.SHADER_TYPE;
	var DELETE_STATUS:ShaderParameter<Bool>  = InternalConstGLContext.DELETE_STATUS;
	var COMPILE_STATUS:ShaderParameter<Bool> = InternalConstGLContext.COMPILE_STATUS;
}

@:enum
abstract RenderbufferParameter<T>(GLenum) to GLenum from GLenum{
	var RENDERBUFFER_WIDTH:RenderbufferParameter<GLint>                        = InternalConstGLContext.RENDERBUFFER_WIDTH;
	var RENDERBUFFER_HEIGHT:RenderbufferParameter<GLint>                       = InternalConstGLContext.RENDERBUFFER_HEIGHT;
	var RENDERBUFFER_INTERNAL_FORMAT:RenderbufferParameter<RenderbufferFormat> = InternalConstGLContext.RENDERBUFFER_INTERNAL_FORMAT;
	var RENDERBUFFER_RED_SIZE:RenderbufferParameter<GLint>                     = InternalConstGLContext.RENDERBUFFER_RED_SIZE;
	var RENDERBUFFER_GREEN_SIZE:RenderbufferParameter<GLint>                   = InternalConstGLContext.RENDERBUFFER_GREEN_SIZE;
	var RENDERBUFFER_BLUE_SIZE:RenderbufferParameter<GLint>                    = InternalConstGLContext.RENDERBUFFER_BLUE_SIZE;
	var RENDERBUFFER_ALPHA_SIZE:RenderbufferParameter<GLint>                   = InternalConstGLContext.RENDERBUFFER_ALPHA_SIZE;
	var RENDERBUFFER_DEPTH_SIZE:RenderbufferParameter<GLint>                   = InternalConstGLContext.RENDERBUFFER_DEPTH_SIZE;
	var RENDERBUFFER_STENCIL_SIZE:RenderbufferParameter<GLint>                 = InternalConstGLContext.RENDERBUFFER_STENCIL_SIZE;
}

@:enum
abstract TextureParameter<T>(GLenum) to GLenum from GLenum{
	var TEXTURE_MAG_FILTER:TextureParameter<TextureMagFilter> = InternalConstGLContext.TEXTURE_MAG_FILTER;
	var TEXTURE_MIN_FILTER:TextureParameter<TextureMinFilter> = InternalConstGLContext.TEXTURE_MIN_FILTER;
	var TEXTURE_WRAP_S:TextureParameter<TextureWrapMode>      = InternalConstGLContext.TEXTURE_WRAP_S;
	var TEXTURE_WRAP_T:TextureParameter<TextureWrapMode>      = InternalConstGLContext.TEXTURE_WRAP_T;

	// extensions
	var TEXTURE_MAX_ANISOTROPY_EXT:TextureParameter<GLfloat>  = 0x84FE;
}

@:enum
abstract VertexAttributeParameter<T>(GLenum) to GLenum from GLenum{
	var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:VertexAttributeParameter<GLBuffer> = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING;
	var VERTEX_ATTRIB_ARRAY_ENABLED:VertexAttributeParameter<Bool>            = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_ENABLED;
	var VERTEX_ATTRIB_ARRAY_SIZE:VertexAttributeParameter<GLint>              = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_SIZE;
	var VERTEX_ATTRIB_ARRAY_STRIDE:VertexAttributeParameter<GLint>            = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_STRIDE;
	var VERTEX_ATTRIB_ARRAY_TYPE:VertexAttributeParameter<DataType>           = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_TYPE;
	var VERTEX_ATTRIB_ARRAY_NORMALIZED:VertexAttributeParameter<Bool>         = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_NORMALIZED;
	var CURRENT_VERTEX_ATTRIB:VertexAttributeParameter<GLFloat32Array>        = InternalConstGLContext.CURRENT_VERTEX_ATTRIB; //(with 4 elements)
}

@:enum
abstract VertexAttributeOffsetParameter(GLenum) to GLenum from GLenum{
	var VERTEX_ATTRIB_ARRAY_POINTER = InternalConstGLContext.VERTEX_ATTRIB_ARRAY_POINTER;
}

@:enum
abstract PixelStoreParameter<T>(GLenum) to GLenum from GLenum{
	var PACK_ALIGNMENT:PixelStoreParameter<GLint>                                         = InternalConstGLContext.PACK_ALIGNMENT;
	var UNPACK_ALIGNMENT:PixelStoreParameter<GLint>                                       = InternalConstGLContext.UNPACK_ALIGNMENT;

	//WebGL specific
	#if js
	var UNPACK_FLIP_Y_WEBGL:PixelStoreParameter<Bool>                                     = InternalConstGLContext.UNPACK_FLIP_Y_WEBGL;
	var UNPACK_PREMULTIPLY_ALPHA_WEBGL:PixelStoreParameter<Bool>                          = InternalConstGLContext.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
	var UNPACK_COLORSPACE_CONVERSION_WEBGL:PixelStoreParameter<WebGLColorSpaceConversion> = InternalConstGLContext.UNPACK_COLORSPACE_CONVERSION_WEBGL;
	#end
}

@:enum
abstract Parameter<T>(GLenum) to GLenum from GLenum{
	var ACTIVE_TEXTURE:Parameter<TextureUnit>                                   = InternalConstGLContext.ACTIVE_TEXTURE;
	var ALIASED_LINE_WIDTH_RANGE:Parameter<GLFloat32Array>                      = InternalConstGLContext.ALIASED_LINE_WIDTH_RANGE; //(with 2 elements)
	var ALIASED_POINT_SIZE_RANGE:Parameter<GLFloat32Array>                      = InternalConstGLContext.ALIASED_POINT_SIZE_RANGE; //(with 2 elements)
	var ALPHA_BITS:Parameter<GLint>                                             = InternalConstGLContext.ALPHA_BITS;
	var ARRAY_BUFFER_BINDING:Parameter<GLBuffer>                                = InternalConstGLContext.ARRAY_BUFFER_BINDING;
	var BLEND:Parameter<Bool>                                                   = InternalConstGLContext.BLEND;
	var BLEND_COLOR:Parameter<GLFloat32Array>                                   = InternalConstGLContext.BLEND_COLOR; //(with 4 values)
	var BLEND_DST_ALPHA:Parameter<BlendFactor>                                  = InternalConstGLContext.BLEND_DST_ALPHA;
	var BLEND_DST_RGB:Parameter<BlendFactor>                                    = InternalConstGLContext.BLEND_DST_RGB;
	var BLEND_EQUATION_ALPHA:Parameter<BlendEquation>                           = InternalConstGLContext.BLEND_EQUATION_ALPHA;
	var BLEND_EQUATION_RGB:Parameter<BlendEquation>                             = InternalConstGLContext.BLEND_EQUATION_RGB;
	var BLEND_SRC_ALPHA:Parameter<BlendFactor>                                  = InternalConstGLContext.BLEND_SRC_ALPHA;
	var BLEND_SRC_RGB:Parameter<BlendFactor>                                    = InternalConstGLContext.BLEND_SRC_RGB;
	var BLUE_BITS:Parameter<GLint>                                              = InternalConstGLContext.BLUE_BITS;
	var COLOR_CLEAR_VALUE:Parameter<GLFloat32Array>                             = InternalConstGLContext.COLOR_CLEAR_VALUE; //(with 4 values)
	var COLOR_WRITEMASK:Parameter<Array<Bool>>                                  = InternalConstGLContext.COLOR_WRITEMASK; //(with 4 values)
	var COMPRESSED_TEXTURE_FORMATS:Parameter<GLUint32Array>                     = InternalConstGLContext.COMPRESSED_TEXTURE_FORMATS;
	var CULL_FACE:Parameter<Bool>                                               = InternalConstGLContext.CULL_FACE;
	var CULL_FACE_MODE:Parameter<CullFaceMode>                                  = InternalConstGLContext.CULL_FACE_MODE;
	var CURRENT_PROGRAM:Parameter<GLProgram>                                    = InternalConstGLContext.CURRENT_PROGRAM;
	var DEPTH_BITS:Parameter<GLint>                                             = InternalConstGLContext.DEPTH_BITS;
	var DEPTH_CLEAR_VALUE:Parameter<GLfloat>                                    = InternalConstGLContext.DEPTH_CLEAR_VALUE;
	var DEPTH_FUNC:Parameter<ComparisonFunction>                                = InternalConstGLContext.DEPTH_FUNC;
	var DEPTH_RANGE:Parameter<GLFloat32Array>                                   = InternalConstGLContext.DEPTH_RANGE; //(with 2 elements)
	var DEPTH_TEST:Parameter<Bool>                                              = InternalConstGLContext.DEPTH_TEST;
	var DEPTH_WRITEMASK:Parameter<Bool>                                         = InternalConstGLContext.DEPTH_WRITEMASK;
	var DITHER:Parameter<Bool>                                                  = InternalConstGLContext.DITHER;
	var ELEMENT_ARRAY_BUFFER_BINDING:Parameter<GLBuffer>                        = InternalConstGLContext.ELEMENT_ARRAY_BUFFER_BINDING;
	var FRAMEBUFFER_BINDING:Parameter<GLFramebuffer>                            = InternalConstGLContext.FRAMEBUFFER_BINDING;
	var FRONT_FACE:Parameter<FrontFaceDirection>                                = InternalConstGLContext.FRONT_FACE;
	var GENERATE_MIPMAP_HINT:Parameter<HintMode>                                = InternalConstGLContext.GENERATE_MIPMAP_HINT;
	var GREEN_BITS:Parameter<GLint>                                             = InternalConstGLContext.GREEN_BITS;
	var IMPLEMENTATION_COLOR_READ_FORMAT:Parameter<PixelFormat>                 = InternalConstGLContext.IMPLEMENTATION_COLOR_READ_FORMAT;
	var IMPLEMENTATION_COLOR_READ_TYPE:Parameter<PixelDataType>                 = InternalConstGLContext.IMPLEMENTATION_COLOR_READ_TYPE;
	var LINE_WIDTH:Parameter<GLfloat>                                           = InternalConstGLContext.LINE_WIDTH;
	var MAX_COMBINED_TEXTURE_IMAGE_UNITS:Parameter<GLint>                       = InternalConstGLContext.MAX_COMBINED_TEXTURE_IMAGE_UNITS;
	var MAX_CUBE_MAP_TEXTURE_SIZE:Parameter<GLint>                              = InternalConstGLContext.MAX_CUBE_MAP_TEXTURE_SIZE;
	var MAX_FRAGMENT_UNIFORM_VECTORS:Parameter<GLint>                           = InternalConstGLContext.MAX_FRAGMENT_UNIFORM_VECTORS;
	var MAX_RENDERBUFFER_SIZE:Parameter<GLint>                                  = InternalConstGLContext.MAX_RENDERBUFFER_SIZE;
	var MAX_TEXTURE_IMAGE_UNITS:Parameter<GLint>                                = InternalConstGLContext.MAX_TEXTURE_IMAGE_UNITS;
	var MAX_TEXTURE_SIZE:Parameter<GLint>                                       = InternalConstGLContext.MAX_TEXTURE_SIZE;
	var MAX_VARYING_VECTORS:Parameter<GLint>                                    = InternalConstGLContext.MAX_VARYING_VECTORS;
	var MAX_VERTEX_ATTRIBS:Parameter<GLint>                                     = InternalConstGLContext.MAX_VERTEX_ATTRIBS;
	var MAX_VERTEX_TEXTURE_IMAGE_UNITS:Parameter<GLint>                         = InternalConstGLContext.MAX_VERTEX_TEXTURE_IMAGE_UNITS;
	var MAX_VERTEX_UNIFORM_VECTORS:Parameter<GLint>                             = InternalConstGLContext.MAX_VERTEX_UNIFORM_VECTORS;
	var MAX_VIEWPORT_DIMS:Parameter<GLInt32Array>                               = InternalConstGLContext.MAX_VIEWPORT_DIMS; //(with 2 elements)
	var PACK_ALIGNMENT:Parameter<GLint>                                         = InternalConstGLContext.PACK_ALIGNMENT;
	var POLYGON_OFFSET_FACTOR:Parameter<GLfloat>                                = InternalConstGLContext.POLYGON_OFFSET_FACTOR;
	var POLYGON_OFFSET_FILL:Parameter<Bool>                                     = InternalConstGLContext.POLYGON_OFFSET_FILL;
	var POLYGON_OFFSET_UNITS:Parameter<GLfloat>                                 = InternalConstGLContext.POLYGON_OFFSET_UNITS;
	var RED_BITS:Parameter<GLint>                                               = InternalConstGLContext.RED_BITS;
	var RENDERBUFFER_BINDING:Parameter<GLRenderbuffer>                          = InternalConstGLContext.RENDERBUFFER_BINDING;
	var RENDERER:Parameter<String>                                              = InternalConstGLContext.RENDERER;
	var SAMPLE_BUFFERS:Parameter<GLint>                                         = InternalConstGLContext.SAMPLE_BUFFERS;
	var SAMPLE_COVERAGE_INVERT:Parameter<Bool>                                  = InternalConstGLContext.SAMPLE_COVERAGE_INVERT;
	var SAMPLE_COVERAGE_VALUE:Parameter<GLfloat>                                = InternalConstGLContext.SAMPLE_COVERAGE_VALUE;
	var SAMPLES:Parameter<GLint>                                                = InternalConstGLContext.SAMPLES;
	var SCISSOR_BOX:Parameter<GLInt32Array>                                     = InternalConstGLContext.SCISSOR_BOX; //(with 4 elements)
	var SCISSOR_TEST:Parameter<Bool>                                            = InternalConstGLContext.SCISSOR_TEST;
	var SHADING_LANGUAGE_VERSION:Parameter<String>                              = InternalConstGLContext.SHADING_LANGUAGE_VERSION;
	var STENCIL_BACK_FAIL:Parameter<Operation>                                  = InternalConstGLContext.STENCIL_BACK_FAIL;
	var STENCIL_BACK_FUNC:Parameter<ComparisonFunction>                         = InternalConstGLContext.STENCIL_BACK_FUNC;
	var STENCIL_BACK_PASS_DEPTH_FAIL:Parameter<Operation>                       = InternalConstGLContext.STENCIL_BACK_PASS_DEPTH_FAIL;
	var STENCIL_BACK_PASS_DEPTH_PASS:Parameter<Operation>                       = InternalConstGLContext.STENCIL_BACK_PASS_DEPTH_PASS;
	var STENCIL_BACK_REF:Parameter<GLint>                                       = InternalConstGLContext.STENCIL_BACK_REF;
	var STENCIL_BACK_VALUE_MASK:Parameter<GLuint>                               = InternalConstGLContext.STENCIL_BACK_VALUE_MASK;
	var STENCIL_BACK_WRITEMASK:Parameter<GLuint>                                = InternalConstGLContext.STENCIL_BACK_WRITEMASK;
	var STENCIL_BITS:Parameter<GLint>                                           = InternalConstGLContext.STENCIL_BITS;
	var STENCIL_CLEAR_VALUE:Parameter<GLint>                                    = InternalConstGLContext.STENCIL_CLEAR_VALUE;
	var STENCIL_FAIL:Parameter<Operation>                                       = InternalConstGLContext.STENCIL_FAIL;
	var STENCIL_FUNC:Parameter<ComparisonFunction>                              = InternalConstGLContext.STENCIL_FUNC;
	var STENCIL_PASS_DEPTH_FAIL:Parameter<Operation>                            = InternalConstGLContext.STENCIL_PASS_DEPTH_FAIL;
	var STENCIL_PASS_DEPTH_PASS:Parameter<Operation>                            = InternalConstGLContext.STENCIL_PASS_DEPTH_PASS;
	var STENCIL_REF:Parameter<GLint>                                            = InternalConstGLContext.STENCIL_REF;
	var STENCIL_TEST:Parameter<Bool>                                            = InternalConstGLContext.STENCIL_TEST;
	var STENCIL_VALUE_MASK:Parameter<GLuint>                                    = InternalConstGLContext.STENCIL_VALUE_MASK;
	var STENCIL_WRITEMASK:Parameter<GLuint>                                     = InternalConstGLContext.STENCIL_WRITEMASK;
	var SUBPIXEL_BITS:Parameter<GLint>                                          = InternalConstGLContext.SUBPIXEL_BITS;
	var TEXTURE_BINDING_2D:Parameter<GLTexture>                                 = InternalConstGLContext.TEXTURE_BINDING_2D;
	var TEXTURE_BINDING_CUBE_MAP:Parameter<GLTexture>                           = InternalConstGLContext.TEXTURE_BINDING_CUBE_MAP;
	var UNPACK_ALIGNMENT:Parameter<GLint>                                       = InternalConstGLContext.UNPACK_ALIGNMENT;

	//WebGL specific
	#if js
	var UNPACK_COLORSPACE_CONVERSION_WEBGL:Parameter<WebGLColorSpaceConversion> = InternalConstGLContext.UNPACK_COLORSPACE_CONVERSION_WEBGL;
	var UNPACK_FLIP_Y_WEBGL:Parameter<Bool>                                     = InternalConstGLContext.UNPACK_FLIP_Y_WEBGL;
	var UNPACK_PREMULTIPLY_ALPHA_WEBGL:Parameter<Bool>                          = InternalConstGLContext.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
	#end

	var VENDOR:Parameter<String>                                                = InternalConstGLContext.VENDOR;
	var VERSION:Parameter<String>                                               = InternalConstGLContext.VERSION;
	var VIEWPORT:Parameter<GLInt32Array>                                        = InternalConstGLContext.VIEWPORT; //(with 4 elements)
}

//WebGL specific
#if js
@:enum
abstract WebGLColorSpaceConversion(GLenum) to GLenum from GLenum{
	var BROWSER_DEFAULT_WEBGL = InternalConstGLContext.BROWSER_DEFAULT_WEBGL;
}
#end