package gluon.es2;

#if js
typedef GLenum = UInt;
typedef GLbitfield = UInt;
typedef GLbyte = Int;
typedef GLshort = Int;
typedef GLint = Int;
typedef GLsizei = Int;
typedef GLintptr = Int;
typedef GLsizeiptr = Int;
typedef GLubyte = UInt;
typedef GLushort = UInt;
typedef GLuint = UInt;
typedef GLfloat = Float;
typedef GLclampf = Float;
#else
#end

abstract BufferDataSource(Dynamic)
	from haxe.io.ArrayBufferView to haxe.io.ArrayBufferView
	from haxe.io.ArrayBufferView.ArrayBufferViewData to haxe.io.ArrayBufferView.ArrayBufferViewData {}

#if js
abstract TexImageSource(Dynamic)
	from js.html.ImageBitmap to js.html.ImageBitmap
	from js.html.ImageData to js.html.ImageData
	from js.html.ImageElement to js.html.ImageElement
	from js.html.CanvasElement to js.html.CanvasElement
	from js.html.VideoElement to js.html.VideoElement {}
#end

private typedef InternalGLContext = 
	#if js
		js.html.webgl.RenderingContext;
	#else
	#end

abstract GLContext(InternalGLContext) from InternalGLContext{

	public inline function getContextAttributes():GLContextAttributes{
		#if js
			return this.getContextAttributes();
		#else
		#end
	}

	public inline function getSupportedExtensions():Array<String>{
		#if js
			return this.getSupportedExtensions();
		#else
		#end
	}

	public inline function getExtension(name:String):Dynamic{
		#if js
			return this.getExtension(name);
		#else
		#end
	}

	public inline function activeTexture(unit:TextureUnit)
		this.activeTexture(unit);

	public inline function attachShader(program:GLProgram, shader:GLShader)
		this.attachShader(program, shader);

	public inline function bindAttribLocation(program:GLProgram, index:GLuint, name:String)
		this.bindAttribLocation(program, index, name);

	public inline function bindBuffer(target:BufferTarget, buffer:GLBuffer)
		this.bindBuffer(target, buffer);

	public inline function bindFramebuffer(target:FramebufferTarget, framebuffer:GLFramebuffer)
		this.bindFramebuffer(target, framebuffer);

	public inline function bindRenderbuffer(target:RenderbufferTarget, renderbuffer:GLRenderbuffer)
		this.bindRenderbuffer(target, renderbuffer);

	public inline function bindTexture(target:TextureTarget, texture:GLTexture)
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

	public inline function bufferData(target:BufferTarget, data:BufferDataSource, usage:BufferUsage)
		this.bufferData(target, data, usage);

	public inline function bufferSubData(target:BufferTarget, offset:GLintptr, data:BufferDataSource)
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

	public inline function compressedTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, width:GLsizei, height:GLsizei, border:GLint, imageSize:GLsizei, data:haxe.io.ArrayBufferView)
		this.compressedTexImage2D(target, level, internalformat, width, height, border, data.getData());

	public inline function compressedTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, data:haxe.io.ArrayBufferView)
		this.compressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, data.getData());

	public inline function copyTexImage2D(target:TextureTarget, level:GLint, internalformat:PixelFormat, x:GLint, y:GLint, width:GLsizei, height:GLsizei, border:GLint)
		this.copyTexImage2D(target, level, internalformat, x, y, width, height, border);

	public inline function copyTexSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, x:GLint, y:GLint, width:GLsizei, height:GLsizei)
		this.copyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height);

	public inline function createBuffer():GLBuffer
		return this.createBuffer();

	public inline function createFramebuffer():GLFramebuffer
		return this.createFramebuffer();

	public inline function createProgram():GLProgram
		return this.createProgram();

	public inline function createRenderbuffer():GLRenderbuffer
		return this.createRenderbuffer();

	public inline function createShader(type:ShaderType):GLShader
		return this.createShader(type);

	public inline function createTexture():GLTexture
		return this.createTexture();

	public inline function cullFace(mode:CullFaceMode)
		this.cullFace(mode);

	public inline function deleteBuffer(buffer:GLBuffer)
		this.deleteBuffer(buffer);

	public inline function deleteFramebuffer(framebuffer:GLFramebuffer)
		this.deleteFramebuffer(framebuffer);

	public inline function deleteProgram(program:GLProgram)
		this.deleteProgram(program);

	public inline function deleteRenderbuffer(renderbuffer:GLRenderbuffer)
		this.deleteRenderbuffer(renderbuffer);

	public inline function deleteShader(shader:GLShader)
		this.deleteShader(shader);

	public inline function deleteTexture(texture:GLTexture)
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

	public inline function framebufferRenderbuffer(target:FramebufferTarget, attachment:FramebufferAttachement, renderbuffertarget:RenderbufferTarget, renderbuffer:GLRenderbuffer)
		this.framebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer);

	public inline function framebufferTexture2D(target:FramebufferTarget, attachment:FramebufferAttachement, textarget:TextureTarget, texture:GLTexture, level:GLint)
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

	public inline function getParameter<T>(pname:Parameter<T>):T
	    return this.getParameter(pname);

	public inline function getError():ErrorCode
	    return this.getError();

	public inline function getFramebufferAttachmentParameter<T>(target:FramebufferTarget, attachment:FramebufferAttachement, pname:FramebufferAttachmentParameter<T>):T
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

	public inline function getVertexAttrib<T>(index:GLuint, pname:VertexAttributeParameter<T>):T
		return this.getVertexAttrib(index, pname);

	public inline function getVertexAttribOffset(index:GLuint, pname:VertexAttributeOffsetParameter):GLsizeiptr
		return this.getVertexAttribOffset(index, pname);

	public inline function hint(target:HintTarget, mode:HintMode)
		this.hint(target, mode);

	public inline function isBuffer(buffer:GLBuffer):Bool
		return this.isBuffer(buffer);

	public inline function isEnabled(cap:Capability):Bool
		return this.isEnabled(cap);

	public inline function isFramebuffer(framebuffer:GLFramebuffer):Bool
		return this.isFramebuffer(framebuffer);

	public inline function isProgram(program:GLProgram):Bool
		return this.isProgram(program);

	public inline function isRenderbuffer(renderbuffer:GLRenderbuffer):Bool
		return this.isRenderbuffer(renderbuffer);

	public inline function isShader(shader:GLShader):Bool
		return this.isShader(shader);

	public inline function isTexture(texture:GLTexture):Bool
		return this.isTexture(texture);

	public inline function lineWidth(width:GLfloat)
		this.lineWidth(width);

	public inline function linkProgram(program:GLProgram)
		this.linkProgram(program);

	public inline function pixelStorei<T>(pname:PixelStoreParameter<T>, param:T)
		this.pixelStorei(pname, cast param);

	public inline function polygonOffset(factor:GLfloat, units:GLfloat)
		this.polygonOffset(factor, units);

	public inline function readPixels(x:GLint, y:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelType, pixels:haxe.io.ArrayBufferView)
		this.readPixels(x, y, width, height, format, type, pixels.getData());

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

	public inline function texImage2D(target:TextureTarget, level:GLint, internalformat:GLint, width:GLsizei, height:GLsizei, border:GLint, format:PixelFormat, type:PixelType, pixels:haxe.io.ArrayBufferView)
		this.texImage2D(target, level, internalformat, width, height, border, format, type, pixels.getData());

	#if js
	public inline function texImage2DSource(target:TextureTarget, level:GLint, internalformat:GLint, format:PixelFormat, type:PixelType, source:TexImageSource)
		this.texImage2D(target, level, internalformat, format, type, source);
	#end

	public inline function texParameterf<T:GLfloat>(target:TextureTarget, pname:TextureParameter<T>, param:T)
		this.texParameterf(target, pname, param);

	public inline function texParameteri<T:GLint>(target:TextureTarget, pname:TextureParameter<T>, param:T)
		this.texParameteri(target, pname, param);

	public inline function texSubImage2D(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, width:GLsizei, height:GLsizei, format:PixelFormat, type:PixelType, pixels:haxe.io.ArrayBufferView)
		this.texSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels.getData());

	#if js
	public inline function texSubImage2DSource(target:TextureTarget, level:GLint, xoffset:GLint, yoffset:GLint, format:PixelFormat, type:PixelType, source:TexImageSource)
		this.texSubImage2D(target, level, xoffset, yoffset, format, type, source);
	#end

	public inline function uniform1f(location:GLUniformLocation, x:GLfloat)
		this.uniform1f(location, x);

	public inline function uniform1fv(location:GLUniformLocation, v:haxe.io.Float32Array)
		this.uniform1fv(location, v.getData());

	public inline function uniform1i(location:GLUniformLocation, x:GLint)
		this.uniform1i(location, x);

	public inline function uniform1iv(location:GLUniformLocation, v:haxe.io.Int32Array)
		this.uniform1iv(location, v.getData());

	public inline function uniform2f(location:GLUniformLocation, x:GLfloat, y:GLfloat)
		this.uniform2f(location, x, y);

	public inline function uniform2fv(location:GLUniformLocation, v:haxe.io.Float32Array)
		this.uniform2fv(location, v.getData());

	public inline function uniform2i(location:GLUniformLocation, x:GLint, y:GLint)
		this.uniform2i(location, x, y);

	public inline function uniform2iv(location:GLUniformLocation, v:haxe.io.Int32Array)
		this.uniform2iv(location, v.getData());

	public inline function uniform3f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat)
		this.uniform3f(location, x, y, z);

	public inline function uniform3fv(location:GLUniformLocation, v:haxe.io.Float32Array)
		this.uniform3fv(location, v.getData());

	public inline function uniform3i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint)
		this.uniform3i(location, x, y, z);

	public inline function uniform3iv(location:GLUniformLocation, v:haxe.io.Int32Array)
		this.uniform3iv(location, v.getData());

	public inline function uniform4f(location:GLUniformLocation, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat)
		this.uniform4f(location, x, y, z, w);

	public inline function uniform4fv(location:GLUniformLocation, v:haxe.io.Float32Array)
		this.uniform4fv(location, v.getData());

	public inline function uniform4i(location:GLUniformLocation, x:GLint, y:GLint, z:GLint, w:GLint)
		this.uniform4i(location, x, y, z, w);

	public inline function uniform4iv(location:GLUniformLocation, v:haxe.io.Int32Array)
		this.uniform4iv(location, v.getData());

	public inline function uniformMatrix2fv(location:GLUniformLocation, transpose:Bool, value:haxe.io.Float32Array)
		this.uniformMatrix2fv(location, transpose, value.getData());

	public inline function uniformMatrix3fv(location:GLUniformLocation, transpose:Bool, value:haxe.io.Float32Array)
		this.uniformMatrix3fv(location, transpose, value.getData());

	public inline function uniformMatrix4fv(location:GLUniformLocation, transpose:Bool, value:haxe.io.Float32Array)
		this.uniformMatrix4fv(location, transpose, value.getData());

	public inline function useProgram(program:GLProgram)
		this.useProgram(program);

	public inline function validateProgram(program:GLProgram)
		this.validateProgram(program);

	public inline function vertexAttrib1f(index:GLuint, x:GLfloat)
		this.vertexAttrib1f(index, x);

	public inline function vertexAttrib1fv(index:GLuint, values:haxe.io.Float32Array)
		this.vertexAttrib1fv(index, values.getData());

	public inline function vertexAttrib2f(index:GLuint, x:GLfloat, y:GLfloat)
		this.vertexAttrib2f(index, x, y);

	public inline function vertexAttrib2fv(index:GLuint, values:haxe.io.Float32Array)
		this.vertexAttrib2fv(index, values.getData());

	public inline function vertexAttrib3f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat)
		this.vertexAttrib3f(index, x, y, z);

	public inline function vertexAttrib3fv(index:GLuint, values:haxe.io.Float32Array)
		this.vertexAttrib3fv(index, values.getData());

	public inline function vertexAttrib4f(index:GLuint, x:GLfloat, y:GLfloat, z:GLfloat, w:GLfloat)
		this.vertexAttrib4f(index, x, y, z, w);

	public inline function vertexAttrib4fv(index:GLuint, values:haxe.io.Float32Array)
		this.vertexAttrib4fv(index, values.getData());

	public inline function vertexAttribPointer(index:GLuint, size:GLint, type:DataType, normalized:Bool, stride:GLsizei, offset:GLintptr)
		this.vertexAttribPointer(index, size, type, normalized, stride, offset);

	public inline function viewport(x:GLint, y:GLint, width:GLsizei, height:GLsizei)
		this.viewport(x, y, width, height);

}


// Constants

@:enum
abstract BufferTarget(GLenum) to GLenum from GLenum{
	var ARRAY_BUFFER         = InternalGLContext.ARRAY_BUFFER;
	var ELEMENT_ARRAY_BUFFER = InternalGLContext.ELEMENT_ARRAY_BUFFER;
}

@:enum
abstract FramebufferTarget(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER = InternalGLContext.FRAMEBUFFER;
}

@:enum
abstract RenderbufferTarget(GLenum) to GLenum from GLenum{
	var RENDERBUFFER = InternalGLContext.RENDERBUFFER;
}

@:enum
abstract HintTarget(GLenum) to GLenum from GLenum{
	var GENERATE_MIPMAP_HINT = InternalGLContext.GENERATE_MIPMAP_HINT;
}

@:enum
abstract TextureTarget(GLenum) to GLenum from GLenum{
	var TEXTURE                     = InternalGLContext.TEXTURE;
	var TEXTURE_2D                  = InternalGLContext.TEXTURE_2D;
	var TEXTURE_CUBE_MAP            = InternalGLContext.TEXTURE_CUBE_MAP;
	var TEXTURE_CUBE_MAP_POSITIVE_X = InternalGLContext.TEXTURE_CUBE_MAP_POSITIVE_X;
	var TEXTURE_CUBE_MAP_NEGATIVE_X = InternalGLContext.TEXTURE_CUBE_MAP_NEGATIVE_X;
	var TEXTURE_CUBE_MAP_POSITIVE_Y = InternalGLContext.TEXTURE_CUBE_MAP_POSITIVE_Y;
	var TEXTURE_CUBE_MAP_NEGATIVE_Y = InternalGLContext.TEXTURE_CUBE_MAP_NEGATIVE_Y;
	var TEXTURE_CUBE_MAP_POSITIVE_Z = InternalGLContext.TEXTURE_CUBE_MAP_POSITIVE_Z;
	var TEXTURE_CUBE_MAP_NEGATIVE_Z = InternalGLContext.TEXTURE_CUBE_MAP_NEGATIVE_Z;
}

@:enum
abstract BufferUsage(GLenum) to GLenum from GLenum{
	var STREAM_DRAW  = InternalGLContext.STREAM_DRAW;
	var STATIC_DRAW  = InternalGLContext.STATIC_DRAW;
	var DYNAMIC_DRAW = InternalGLContext.DYNAMIC_DRAW;
}

@:enum
abstract CullFaceMode(GLenum) to GLenum from GLenum{
	var FRONT          = InternalGLContext.FRONT;
	var BACK           = InternalGLContext.BACK;
	var FRONT_AND_BACK = InternalGLContext.FRONT_AND_BACK;
}

@:enum
abstract FramebufferStatus(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER_COMPLETE                      = InternalGLContext.FRAMEBUFFER_COMPLETE;
	var FRAMEBUFFER_INCOMPLETE_ATTACHMENT         = InternalGLContext.FRAMEBUFFER_INCOMPLETE_ATTACHMENT;
	var FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = InternalGLContext.FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT;
	var FRAMEBUFFER_INCOMPLETE_DIMENSIONS         = InternalGLContext.FRAMEBUFFER_INCOMPLETE_DIMENSIONS;
	var FRAMEBUFFER_UNSUPPORTED                   = InternalGLContext.FRAMEBUFFER_UNSUPPORTED;
}

@:enum
abstract BlendEquation(GLenum) to GLenum from GLenum{
	var FUNC_ADD              = InternalGLContext.FUNC_ADD;
	var FUNC_SUBTRACT         = InternalGLContext.FUNC_SUBTRACT;
	var FUNC_REVERSE_SUBTRACT = InternalGLContext.FUNC_REVERSE_SUBTRACT;
}

@:enum
abstract BlendFactor(GLenum) to GLenum from GLenum{
	var ZERO                     = InternalGLContext.ZERO;
	var ONE                      = InternalGLContext.ONE;
	var SRC_COLOR                = InternalGLContext.SRC_COLOR;
	var ONE_MINUS_SRC_COLOR      = InternalGLContext.ONE_MINUS_SRC_COLOR;
	var DST_COLOR                = InternalGLContext.DST_COLOR;
	var ONE_MINUS_DST_COLOR      = InternalGLContext.ONE_MINUS_DST_COLOR;
	var SRC_ALPHA                = InternalGLContext.SRC_ALPHA;
	var ONE_MINUS_SRC_ALPHA      = InternalGLContext.ONE_MINUS_SRC_ALPHA;
	var DST_ALPHA                = InternalGLContext.DST_ALPHA;
	var ONE_MINUS_DST_ALPHA      = InternalGLContext.ONE_MINUS_DST_ALPHA;
	var CONSTANT_COLOR           = InternalGLContext.CONSTANT_COLOR;
	var ONE_MINUS_CONSTANT_COLOR = InternalGLContext.ONE_MINUS_CONSTANT_COLOR;
	var CONSTANT_ALPHA           = InternalGLContext.CONSTANT_ALPHA;
	var ONE_MINUS_CONSTANT_ALPHA = InternalGLContext.ONE_MINUS_CONSTANT_ALPHA;
	var SRC_ALPHA_SATURATE       = InternalGLContext.SRC_ALPHA_SATURATE;
}

@:enum
abstract ClearBufferMask(GLenum) to GLenum from GLenum{
	var DEPTH_BUFFER_BIT   = InternalGLContext.DEPTH_BUFFER_BIT;
	var STENCIL_BUFFER_BIT = InternalGLContext.STENCIL_BUFFER_BIT;
	var COLOR_BUFFER_BIT   = InternalGLContext.COLOR_BUFFER_BIT;
}

@:enum
abstract DrawMode(GLenum) to GLenum from GLenum{
	var POINTS         = InternalGLContext.POINTS;
	var LINES          = InternalGLContext.LINES;
	var LINE_LOOP      = InternalGLContext.LINE_LOOP;
	var LINE_STRIP     = InternalGLContext.LINE_STRIP;
	var TRIANGLES      = InternalGLContext.TRIANGLES;
	var TRIANGLE_STRIP = InternalGLContext.TRIANGLE_STRIP;
	var TRIANGLE_FAN   = InternalGLContext.TRIANGLE_FAN;
}

@:enum
abstract TextureMagFilter(GLenum) to GLenum from GLenum{
	var NEAREST = InternalGLContext.NEAREST;
	var LINEAR  = InternalGLContext.LINEAR;
}

@:enum
abstract TextureMinFilter(GLenum) to GLenum from GLenum{
	var NEAREST                = InternalGLContext.NEAREST;
	var LINEAR                 = InternalGLContext.LINEAR;
	var NEAREST_MIPMAP_NEAREST = InternalGLContext.NEAREST_MIPMAP_NEAREST;
	var LINEAR_MIPMAP_NEAREST  = InternalGLContext.LINEAR_MIPMAP_NEAREST;
	var NEAREST_MIPMAP_LINEAR  = InternalGLContext.NEAREST_MIPMAP_LINEAR;
	var LINEAR_MIPMAP_LINEAR   = InternalGLContext.LINEAR_MIPMAP_LINEAR;
}

@:enum
abstract TextureWrapMode(GLenum) to GLenum from GLenum{
	var REPEAT          = InternalGLContext.REPEAT;
	var CLAMP_TO_EDGE   = InternalGLContext.CLAMP_TO_EDGE;
	var MIRRORED_REPEAT = InternalGLContext.MIRRORED_REPEAT;
}

@:enum
abstract TextureUnit(GLenum) to GLenum from GLenum{
	var TEXTURE0  = InternalGLContext.TEXTURE0;
	var TEXTURE1  = InternalGLContext.TEXTURE1;
	var TEXTURE2  = InternalGLContext.TEXTURE2;
	var TEXTURE3  = InternalGLContext.TEXTURE3;
	var TEXTURE4  = InternalGLContext.TEXTURE4;
	var TEXTURE5  = InternalGLContext.TEXTURE5;
	var TEXTURE6  = InternalGLContext.TEXTURE6;
	var TEXTURE7  = InternalGLContext.TEXTURE7;
	var TEXTURE8  = InternalGLContext.TEXTURE8;
	var TEXTURE9  = InternalGLContext.TEXTURE9;
	var TEXTURE10 = InternalGLContext.TEXTURE10;
	var TEXTURE11 = InternalGLContext.TEXTURE11;
	var TEXTURE12 = InternalGLContext.TEXTURE12;
	var TEXTURE13 = InternalGLContext.TEXTURE13;
	var TEXTURE14 = InternalGLContext.TEXTURE14;
	var TEXTURE15 = InternalGLContext.TEXTURE15;
	var TEXTURE16 = InternalGLContext.TEXTURE16;
	var TEXTURE17 = InternalGLContext.TEXTURE17;
	var TEXTURE18 = InternalGLContext.TEXTURE18;
	var TEXTURE19 = InternalGLContext.TEXTURE19;
	var TEXTURE20 = InternalGLContext.TEXTURE20;
	var TEXTURE21 = InternalGLContext.TEXTURE21;
	var TEXTURE22 = InternalGLContext.TEXTURE22;
	var TEXTURE23 = InternalGLContext.TEXTURE23;
	var TEXTURE24 = InternalGLContext.TEXTURE24;
	var TEXTURE25 = InternalGLContext.TEXTURE25;
	var TEXTURE26 = InternalGLContext.TEXTURE26;
	var TEXTURE27 = InternalGLContext.TEXTURE27;
	var TEXTURE28 = InternalGLContext.TEXTURE28;
	var TEXTURE29 = InternalGLContext.TEXTURE29;
	var TEXTURE30 = InternalGLContext.TEXTURE30;
	var TEXTURE31 = InternalGLContext.TEXTURE31;
}

@:enum
abstract ShaderType(GLenum) to GLenum from GLenum{
	var FRAGMENT_SHADER = InternalGLContext.FRAGMENT_SHADER;
	var VERTEX_SHADER   = InternalGLContext.VERTEX_SHADER;
}

@:enum
abstract DataType(GLenum) to GLenum from GLenum{
	var BYTE           = InternalGLContext.BYTE;
	var UNSIGNED_BYTE  = InternalGLContext.UNSIGNED_BYTE;
	var SHORT          = InternalGLContext.SHORT;
	var UNSIGNED_SHORT = InternalGLContext.UNSIGNED_SHORT;
	var INT            = InternalGLContext.INT;
	var UNSIGNED_INT   = InternalGLContext.UNSIGNED_INT;
	var FLOAT          = InternalGLContext.FLOAT;
}

@:enum
abstract PixelType(GLenum) to GLenum from GLenum{
	var UNSIGNED_BYTE          = InternalGLContext.UNSIGNED_BYTE;
	var UNSIGNED_SHORT_4_4_4_4 = InternalGLContext.UNSIGNED_SHORT_4_4_4_4;
	var UNSIGNED_SHORT_5_5_5_1 = InternalGLContext.UNSIGNED_SHORT_5_5_5_1;
	var UNSIGNED_SHORT_5_6_5   = InternalGLContext.UNSIGNED_SHORT_5_6_5;
}

@:enum
abstract PixelFormat(GLenum) to GLenum from GLenum{
	var DEPTH_COMPONENT = InternalGLContext.DEPTH_COMPONENT;
	var ALPHA           = InternalGLContext.ALPHA;
	var RGB             = InternalGLContext.RGB;
	var RGBA            = InternalGLContext.RGBA;
	var LUMINANCE       = InternalGLContext.LUMINANCE;
	var LUMINANCE_ALPHA = InternalGLContext.LUMINANCE_ALPHA;
}

@:enum
abstract RenderbufferFormat(GLenum) to GLenum from GLenum{
	var RGBA4             = InternalGLContext.RGBA4;
	var RGB5_A1           = InternalGLContext.RGB5_A1;
	var RGB565            = InternalGLContext.RGB565;
	var DEPTH_COMPONENT16 = InternalGLContext.DEPTH_COMPONENT16;
	var STENCIL_INDEX     = InternalGLContext.STENCIL_INDEX;
	var STENCIL_INDEX8    = InternalGLContext.STENCIL_INDEX8;
	var DEPTH_STENCIL     = InternalGLContext.DEPTH_STENCIL;
}

@:enum
abstract UniformType(GLenum) to GLenum from GLenum{
	var FLOAT_VEC2   = InternalGLContext.FLOAT_VEC2;
	var FLOAT_VEC3   = InternalGLContext.FLOAT_VEC3;
	var FLOAT_VEC4   = InternalGLContext.FLOAT_VEC4;
	var INT_VEC2     = InternalGLContext.INT_VEC2;
	var INT_VEC3     = InternalGLContext.INT_VEC3;
	var INT_VEC4     = InternalGLContext.INT_VEC4;
	var BOOL         = InternalGLContext.BOOL;
	var BOOL_VEC2    = InternalGLContext.BOOL_VEC2;
	var BOOL_VEC3    = InternalGLContext.BOOL_VEC3;
	var BOOL_VEC4    = InternalGLContext.BOOL_VEC4;
	var FLOAT_MAT2   = InternalGLContext.FLOAT_MAT2;
	var FLOAT_MAT3   = InternalGLContext.FLOAT_MAT3;
	var FLOAT_MAT4   = InternalGLContext.FLOAT_MAT4;
	var SAMPLER_2D   = InternalGLContext.SAMPLER_2D;
	var SAMPLER_CUBE = InternalGLContext.SAMPLER_CUBE;
}

@:enum
abstract ComparisonFunction(GLenum) to GLenum from GLenum{
	var NEVER    = InternalGLContext.NEVER;
	var LESS     = InternalGLContext.LESS;
	var EQUAL    = InternalGLContext.EQUAL;
	var LEQUAL   = InternalGLContext.LEQUAL;
	var GREATER  = InternalGLContext.GREATER;
	var NOTEQUAL = InternalGLContext.NOTEQUAL;
	var GEQUAL   = InternalGLContext.GEQUAL;
	var ALWAYS   = InternalGLContext.ALWAYS;
}

@:enum
abstract Operation(GLenum) to GLenum from GLenum{
	var ZERO                          = InternalGLContext.ZERO;
	var KEEP                          = InternalGLContext.KEEP;
	var REPLACE                       = InternalGLContext.REPLACE;
	var INCR                          = InternalGLContext.INCR;
	var DECR                          = InternalGLContext.DECR;
	var INVERT                        = InternalGLContext.INVERT;
	var INCR_WRAP                     = InternalGLContext.INCR_WRAP;
	var DECR_WRAP                     = InternalGLContext.DECR_WRAP;
}

@:enum
abstract ErrorCode(GLenum) to GLenum from GLenum{
	var NO_ERROR                      = InternalGLContext.NO_ERROR;
	var INVALID_ENUM                  = InternalGLContext.INVALID_ENUM;
	var INVALID_VALUE                 = InternalGLContext.INVALID_VALUE;
	var INVALID_OPERATION             = InternalGLContext.INVALID_OPERATION;
	var INVALID_FRAMEBUFFER_OPERATION = InternalGLContext.INVALID_FRAMEBUFFER_OPERATION;
	var OUT_OF_MEMORY                 = InternalGLContext.OUT_OF_MEMORY;
}

@:enum
abstract FrontFaceDirection(GLenum) to GLenum from GLenum{
	var CW  = InternalGLContext.CW;
	var CCW = InternalGLContext.CCW;
}

@:enum
abstract Capability(GLenum) to GLenum from GLenum{
	var CULL_FACE                = InternalGLContext.CULL_FACE;
	var BLEND                    = InternalGLContext.BLEND;
	var DITHER                   = InternalGLContext.DITHER;
	var STENCIL_TEST             = InternalGLContext.STENCIL_TEST;
	var DEPTH_TEST               = InternalGLContext.DEPTH_TEST;
	var SCISSOR_TEST             = InternalGLContext.SCISSOR_TEST;
	var POLYGON_OFFSET_FILL      = InternalGLContext.POLYGON_OFFSET_FILL;
	var SAMPLE_ALPHA_TO_COVERAGE = InternalGLContext.SAMPLE_ALPHA_TO_COVERAGE;
	var SAMPLE_COVERAGE          = InternalGLContext.SAMPLE_COVERAGE;
}

@:enum
abstract FramebufferAttachement(GLenum) to GLenum from GLenum{
	var COLOR_ATTACHMENT0        = InternalGLContext.COLOR_ATTACHMENT0;
	var DEPTH_ATTACHMENT         = InternalGLContext.DEPTH_ATTACHMENT;
	var STENCIL_ATTACHMENT       = InternalGLContext.STENCIL_ATTACHMENT;

	//@! review webgl specific
	//https://www.khronos.org/registry/webgl/specs/latest/1.0/#6.6
	var DEPTH_STENCIL_ATTACHMENT = InternalGLContext.DEPTH_STENCIL_ATTACHMENT;
}

@:enum
abstract HintMode(GLenum) to GLenum from GLenum{
	var DONT_CARE = InternalGLContext.DONT_CARE;
	var FASTEST   = InternalGLContext.FASTEST;
	var NICEST    = InternalGLContext.NICEST;
}

@:enum
abstract PrecisionType(GLenum) to GLenum from GLenum{
	var LOW_FLOAT    = InternalGLContext.LOW_FLOAT;
	var MEDIUM_FLOAT = InternalGLContext.MEDIUM_FLOAT;
	var HIGH_FLOAT   = InternalGLContext.HIGH_FLOAT;
	var LOW_INT      = InternalGLContext.LOW_INT;
	var MEDIUM_INT   = InternalGLContext.MEDIUM_INT;
	var HIGH_INT     = InternalGLContext.HIGH_INT;
}

@:enum
abstract FramebufferAttachmentObjectType(GLenum) to GLenum from GLenum{
	var NONE         = InternalGLContext.NONE;
	var TEXTURE      = InternalGLContext.TEXTURE;
	var RENDERBUFFER = InternalGLContext.RENDERBUFFER;
}

@:enum
abstract BufferParameter<T>(GLenum) to GLenum from GLenum{
	var BUFFER_SIZE:BufferParameter<GLint>        = InternalGLContext.BUFFER_SIZE;
	var BUFFER_USAGE:BufferParameter<BufferUsage> = InternalGLContext.BUFFER_USAGE;
}

private abstract FramebufferAttachmentObjectName(Dynamic)
	to GLRenderbuffer from GLRenderbuffer
	to GLTexture from GLTexture {}

@:enum
abstract FramebufferAttachmentParameter<T>(GLenum) to GLenum from GLenum{
	var FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE:FramebufferAttachmentParameter<FramebufferAttachmentObjectType> = InternalGLContext.FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE;
	var FRAMEBUFFER_ATTACHMENT_OBJECT_NAME:FramebufferAttachmentParameter<FramebufferAttachmentObjectName> = InternalGLContext.FRAMEBUFFER_ATTACHMENT_OBJECT_NAME;
	var FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL:FramebufferAttachmentParameter<GLint>                         = InternalGLContext.FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL;
	var FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE:FramebufferAttachmentParameter<GLint>                 = InternalGLContext.FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE;
}

@:enum
abstract ProgramParameter<T>(GLenum) to GLenum from GLenum{
	var DELETE_STATUS:ProgramParameter<Bool>      = InternalGLContext.DELETE_STATUS;
	var LINK_STATUS:ProgramParameter<Bool>        = InternalGLContext.LINK_STATUS;
	var VALIDATE_STATUS:ProgramParameter<Bool>    = InternalGLContext.VALIDATE_STATUS;
	var ATTACHED_SHADERS:ProgramParameter<GLint>  = InternalGLContext.ATTACHED_SHADERS;
	var ACTIVE_ATTRIBUTES:ProgramParameter<GLint> = InternalGLContext.ACTIVE_ATTRIBUTES;
	var ACTIVE_UNIFORMS:ProgramParameter<GLint>   = InternalGLContext.ACTIVE_UNIFORMS;
}

@:enum
abstract ShaderParameter<T>(GLenum) to GLenum from GLenum{
	var SHADER_TYPE:ShaderParameter<ShaderType>  = InternalGLContext.SHADER_TYPE;
	var DELETE_STATUS:ShaderParameter<Bool>  = InternalGLContext.DELETE_STATUS;
	var COMPILE_STATUS:ShaderParameter<Bool> = InternalGLContext.COMPILE_STATUS;
}

@:enum
abstract RenderbufferParameter<T>(GLenum) to GLenum from GLenum{
	var RENDERBUFFER_WIDTH:RenderbufferParameter<GLint>                        = InternalGLContext.RENDERBUFFER_WIDTH;
	var RENDERBUFFER_HEIGHT:RenderbufferParameter<GLint>                       = InternalGLContext.RENDERBUFFER_HEIGHT;
	var RENDERBUFFER_INTERNAL_FORMAT:RenderbufferParameter<RenderbufferFormat> = InternalGLContext.RENDERBUFFER_INTERNAL_FORMAT;
	var RENDERBUFFER_RED_SIZE:RenderbufferParameter<GLint>                     = InternalGLContext.RENDERBUFFER_RED_SIZE;
	var RENDERBUFFER_GREEN_SIZE:RenderbufferParameter<GLint>                   = InternalGLContext.RENDERBUFFER_GREEN_SIZE;
	var RENDERBUFFER_BLUE_SIZE:RenderbufferParameter<GLint>                    = InternalGLContext.RENDERBUFFER_BLUE_SIZE;
	var RENDERBUFFER_ALPHA_SIZE:RenderbufferParameter<GLint>                   = InternalGLContext.RENDERBUFFER_ALPHA_SIZE;
	var RENDERBUFFER_DEPTH_SIZE:RenderbufferParameter<GLint>                   = InternalGLContext.RENDERBUFFER_DEPTH_SIZE;
	var RENDERBUFFER_STENCIL_SIZE:RenderbufferParameter<GLint>                 = InternalGLContext.RENDERBUFFER_STENCIL_SIZE;
}

@:enum
abstract TextureParameter<T>(GLenum) to GLenum from GLenum{
	var TEXTURE_MAG_FILTER:TextureParameter<TextureMagFilter> = InternalGLContext.TEXTURE_MAG_FILTER;
	var TEXTURE_MIN_FILTER:TextureParameter<TextureMinFilter> = InternalGLContext.TEXTURE_MIN_FILTER;
	var TEXTURE_WRAP_S:TextureParameter<TextureWrapMode>      = InternalGLContext.TEXTURE_WRAP_S;
	var TEXTURE_WRAP_T:TextureParameter<TextureWrapMode>      = InternalGLContext.TEXTURE_WRAP_T;
}

@:enum
abstract VertexAttributeParameter<T>(GLenum) to GLenum from GLenum{
	var VERTEX_ATTRIB_ARRAY_BUFFER_BINDING:VertexAttributeParameter<GLBuffer> = InternalGLContext.VERTEX_ATTRIB_ARRAY_BUFFER_BINDING;
	var VERTEX_ATTRIB_ARRAY_ENABLED:VertexAttributeParameter<Bool>            = InternalGLContext.VERTEX_ATTRIB_ARRAY_ENABLED;
	var VERTEX_ATTRIB_ARRAY_SIZE:VertexAttributeParameter<GLint>              = InternalGLContext.VERTEX_ATTRIB_ARRAY_SIZE;
	var VERTEX_ATTRIB_ARRAY_STRIDE:VertexAttributeParameter<GLint>            = InternalGLContext.VERTEX_ATTRIB_ARRAY_STRIDE;
	var VERTEX_ATTRIB_ARRAY_TYPE:VertexAttributeParameter<DataType>           = InternalGLContext.VERTEX_ATTRIB_ARRAY_TYPE;
	var VERTEX_ATTRIB_ARRAY_NORMALIZED:VertexAttributeParameter<Bool>         = InternalGLContext.VERTEX_ATTRIB_ARRAY_NORMALIZED;
	var CURRENT_VERTEX_ATTRIB:VertexAttributeParameter<haxe.io.Float32Array>  = InternalGLContext.CURRENT_VERTEX_ATTRIB; //(with 4 elements)
}

@:enum
abstract VertexAttributeOffsetParameter(GLenum) to GLenum from GLenum{
	var VERTEX_ATTRIB_ARRAY_POINTER = InternalGLContext.VERTEX_ATTRIB_ARRAY_POINTER;
}

@:enum
abstract PixelStoreParameter<T>(GLenum) to GLenum from GLenum{
	var PACK_ALIGNMENT:PixelStoreParameter<GLint>                                         = InternalGLContext.PACK_ALIGNMENT;
	var UNPACK_ALIGNMENT:PixelStoreParameter<GLint>                                       = InternalGLContext.UNPACK_ALIGNMENT;

	//WebGL specific
	#if js
	var UNPACK_FLIP_Y_WEBGL:PixelStoreParameter<Bool>                                     = InternalGLContext.UNPACK_FLIP_Y_WEBGL;
	var UNPACK_PREMULTIPLY_ALPHA_WEBGL:PixelStoreParameter<Bool>                          = InternalGLContext.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
	var UNPACK_COLORSPACE_CONVERSION_WEBGL:PixelStoreParameter<WebGLColorSpaceConversion> = InternalGLContext.UNPACK_COLORSPACE_CONVERSION_WEBGL;
	#end
}

@:enum
abstract Parameter<T>(GLenum) to GLenum from GLenum{
	var ACTIVE_TEXTURE:Parameter<TextureUnit>                                   = InternalGLContext.ACTIVE_TEXTURE;
	var ALIASED_LINE_WIDTH_RANGE:Parameter<haxe.io.Float32Array>                = InternalGLContext.ALIASED_LINE_WIDTH_RANGE; //(with 2 elements)
	var ALIASED_POINT_SIZE_RANGE:Parameter<haxe.io.Float32Array>                = InternalGLContext.ALIASED_POINT_SIZE_RANGE; //(with 2 elements)
	var ALPHA_BITS:Parameter<GLint>                                             = InternalGLContext.ALPHA_BITS;
	var ARRAY_BUFFER_BINDING:Parameter<GLBuffer>                                = InternalGLContext.ARRAY_BUFFER_BINDING;
	var BLEND:Parameter<Bool>                                                   = InternalGLContext.BLEND;
	var BLEND_COLOR:Parameter<haxe.io.Float32Array>                             = InternalGLContext.BLEND_COLOR; //(with 4 values)
	var BLEND_DST_ALPHA:Parameter<BlendFactor>                                  = InternalGLContext.BLEND_DST_ALPHA;
	var BLEND_DST_RGB:Parameter<BlendFactor>                                    = InternalGLContext.BLEND_DST_RGB;
	var BLEND_EQUATION_ALPHA:Parameter<BlendEquation>                           = InternalGLContext.BLEND_EQUATION_ALPHA;
	var BLEND_EQUATION_RGB:Parameter<BlendEquation>                             = InternalGLContext.BLEND_EQUATION_RGB;
	var BLEND_SRC_ALPHA:Parameter<BlendFactor>                                  = InternalGLContext.BLEND_SRC_ALPHA;
	var BLEND_SRC_RGB:Parameter<BlendFactor>                                    = InternalGLContext.BLEND_SRC_RGB;
	var BLUE_BITS:Parameter<GLint>                                              = InternalGLContext.BLUE_BITS;
	var COLOR_CLEAR_VALUE:Parameter<haxe.io.Float32Array>                       = InternalGLContext.COLOR_CLEAR_VALUE; //(with 4 values)
	var COLOR_WRITEMASK:Parameter<Array<Bool>>                                  = InternalGLContext.COLOR_WRITEMASK; //(with 4 values)
	var COMPRESSED_TEXTURE_FORMATS:Parameter<haxe.io.UInt32Array>               = InternalGLContext.COMPRESSED_TEXTURE_FORMATS;
	var CULL_FACE:Parameter<Bool>                                               = InternalGLContext.CULL_FACE;
	var CULL_FACE_MODE:Parameter<CullFaceMode>                                  = InternalGLContext.CULL_FACE_MODE;
	var CURRENT_PROGRAM:Parameter<GLProgram>                                    = InternalGLContext.CURRENT_PROGRAM;
	var DEPTH_BITS:Parameter<GLint>                                             = InternalGLContext.DEPTH_BITS;
	var DEPTH_CLEAR_VALUE:Parameter<GLfloat>                                    = InternalGLContext.DEPTH_CLEAR_VALUE;
	var DEPTH_FUNC:Parameter<ComparisonFunction>                                = InternalGLContext.DEPTH_FUNC;
	var DEPTH_RANGE:Parameter<haxe.io.Float32Array>                             = InternalGLContext.DEPTH_RANGE; //(with 2 elements)
	var DEPTH_TEST:Parameter<Bool>                                              = InternalGLContext.DEPTH_TEST;
	var DEPTH_WRITEMASK:Parameter<Bool>                                         = InternalGLContext.DEPTH_WRITEMASK;
	var DITHER:Parameter<Bool>                                                  = InternalGLContext.DITHER;
	var ELEMENT_ARRAY_BUFFER_BINDING:Parameter<GLBuffer>                        = InternalGLContext.ELEMENT_ARRAY_BUFFER_BINDING;
	var FRAMEBUFFER_BINDING:Parameter<GLFramebuffer>                            = InternalGLContext.FRAMEBUFFER_BINDING;
	var FRONT_FACE:Parameter<FrontFaceDirection>                                = InternalGLContext.FRONT_FACE;
	var GENERATE_MIPMAP_HINT:Parameter<HintMode>                                = InternalGLContext.GENERATE_MIPMAP_HINT;
	var GREEN_BITS:Parameter<GLint>                                             = InternalGLContext.GREEN_BITS;
	var IMPLEMENTATION_COLOR_READ_FORMAT:Parameter<PixelFormat>                 = InternalGLContext.IMPLEMENTATION_COLOR_READ_FORMAT;
	var IMPLEMENTATION_COLOR_READ_TYPE:Parameter<PixelType>                     = InternalGLContext.IMPLEMENTATION_COLOR_READ_TYPE;
	var LINE_WIDTH:Parameter<GLfloat>                                           = InternalGLContext.LINE_WIDTH;
	var MAX_COMBINED_TEXTURE_IMAGE_UNITS:Parameter<GLint>                       = InternalGLContext.MAX_COMBINED_TEXTURE_IMAGE_UNITS;
	var MAX_CUBE_MAP_TEXTURE_SIZE:Parameter<GLint>                              = InternalGLContext.MAX_CUBE_MAP_TEXTURE_SIZE;
	var MAX_FRAGMENT_UNIFORM_VECTORS:Parameter<GLint>                           = InternalGLContext.MAX_FRAGMENT_UNIFORM_VECTORS;
	var MAX_RENDERBUFFER_SIZE:Parameter<GLint>                                  = InternalGLContext.MAX_RENDERBUFFER_SIZE;
	var MAX_TEXTURE_IMAGE_UNITS:Parameter<GLint>                                = InternalGLContext.MAX_TEXTURE_IMAGE_UNITS;
	var MAX_TEXTURE_SIZE:Parameter<GLint>                                       = InternalGLContext.MAX_TEXTURE_SIZE;
	var MAX_VARYING_VECTORS:Parameter<GLint>                                    = InternalGLContext.MAX_VARYING_VECTORS;
	var MAX_VERTEX_ATTRIBS:Parameter<GLint>                                     = InternalGLContext.MAX_VERTEX_ATTRIBS;
	var MAX_VERTEX_TEXTURE_IMAGE_UNITS:Parameter<GLint>                         = InternalGLContext.MAX_VERTEX_TEXTURE_IMAGE_UNITS;
	var MAX_VERTEX_UNIFORM_VECTORS:Parameter<GLint>                             = InternalGLContext.MAX_VERTEX_UNIFORM_VECTORS;
	var MAX_VIEWPORT_DIMS:Parameter<haxe.io.Int32Array>                         = InternalGLContext.MAX_VIEWPORT_DIMS; //(with 2 elements)
	var PACK_ALIGNMENT:Parameter<GLint>                                         = InternalGLContext.PACK_ALIGNMENT;
	var POLYGON_OFFSET_FACTOR:Parameter<GLfloat>                                = InternalGLContext.POLYGON_OFFSET_FACTOR;
	var POLYGON_OFFSET_FILL:Parameter<Bool>                                     = InternalGLContext.POLYGON_OFFSET_FILL;
	var POLYGON_OFFSET_UNITS:Parameter<GLfloat>                                 = InternalGLContext.POLYGON_OFFSET_UNITS;
	var RED_BITS:Parameter<GLint>                                               = InternalGLContext.RED_BITS;
	var RENDERBUFFER_BINDING:Parameter<GLRenderbuffer>                          = InternalGLContext.RENDERBUFFER_BINDING;
	var RENDERER:Parameter<String>                                              = InternalGLContext.RENDERER;
	var SAMPLE_BUFFERS:Parameter<GLint>                                         = InternalGLContext.SAMPLE_BUFFERS;
	var SAMPLE_COVERAGE_INVERT:Parameter<Bool>                                  = InternalGLContext.SAMPLE_COVERAGE_INVERT;
	var SAMPLE_COVERAGE_VALUE:Parameter<GLfloat>                                = InternalGLContext.SAMPLE_COVERAGE_VALUE;
	var SAMPLES:Parameter<GLint>                                                = InternalGLContext.SAMPLES;
	var SCISSOR_BOX:Parameter<haxe.io.Int32Array>                               = InternalGLContext.SCISSOR_BOX; //(with 4 elements)
	var SCISSOR_TEST:Parameter<Bool>                                            = InternalGLContext.SCISSOR_TEST;
	var SHADING_LANGUAGE_VERSION:Parameter<String>                              = InternalGLContext.SHADING_LANGUAGE_VERSION;
	var STENCIL_BACK_FAIL:Parameter<Operation>                                  = InternalGLContext.STENCIL_BACK_FAIL;
	var STENCIL_BACK_FUNC:Parameter<ComparisonFunction>                         = InternalGLContext.STENCIL_BACK_FUNC;
	var STENCIL_BACK_PASS_DEPTH_FAIL:Parameter<Operation>                       = InternalGLContext.STENCIL_BACK_PASS_DEPTH_FAIL;
	var STENCIL_BACK_PASS_DEPTH_PASS:Parameter<Operation>                       = InternalGLContext.STENCIL_BACK_PASS_DEPTH_PASS;
	var STENCIL_BACK_REF:Parameter<GLint>                                       = InternalGLContext.STENCIL_BACK_REF;
	var STENCIL_BACK_VALUE_MASK:Parameter<GLuint>                               = InternalGLContext.STENCIL_BACK_VALUE_MASK;
	var STENCIL_BACK_WRITEMASK:Parameter<GLuint>                                = InternalGLContext.STENCIL_BACK_WRITEMASK;
	var STENCIL_BITS:Parameter<GLint>                                           = InternalGLContext.STENCIL_BITS;
	var STENCIL_CLEAR_VALUE:Parameter<GLint>                                    = InternalGLContext.STENCIL_CLEAR_VALUE;
	var STENCIL_FAIL:Parameter<Operation>                                       = InternalGLContext.STENCIL_FAIL;
	var STENCIL_FUNC:Parameter<ComparisonFunction>                              = InternalGLContext.STENCIL_FUNC;
	var STENCIL_PASS_DEPTH_FAIL:Parameter<Operation>                            = InternalGLContext.STENCIL_PASS_DEPTH_FAIL;
	var STENCIL_PASS_DEPTH_PASS:Parameter<Operation>                            = InternalGLContext.STENCIL_PASS_DEPTH_PASS;
	var STENCIL_REF:Parameter<GLint>                                            = InternalGLContext.STENCIL_REF;
	var STENCIL_TEST:Parameter<Bool>                                            = InternalGLContext.STENCIL_TEST;
	var STENCIL_VALUE_MASK:Parameter<GLuint>                                    = InternalGLContext.STENCIL_VALUE_MASK;
	var STENCIL_WRITEMASK:Parameter<GLuint>                                     = InternalGLContext.STENCIL_WRITEMASK;
	var SUBPIXEL_BITS:Parameter<GLint>                                          = InternalGLContext.SUBPIXEL_BITS;
	var TEXTURE_BINDING_2D:Parameter<GLTexture>                                 = InternalGLContext.TEXTURE_BINDING_2D;
	var TEXTURE_BINDING_CUBE_MAP:Parameter<GLTexture>                           = InternalGLContext.TEXTURE_BINDING_CUBE_MAP;
	var UNPACK_ALIGNMENT:Parameter<GLint>                                       = InternalGLContext.UNPACK_ALIGNMENT;

	//WebGL specific
	#if js
	var UNPACK_COLORSPACE_CONVERSION_WEBGL:Parameter<WebGLColorSpaceConversion> = InternalGLContext.UNPACK_COLORSPACE_CONVERSION_WEBGL;
	var UNPACK_FLIP_Y_WEBGL:Parameter<Bool>                                     = InternalGLContext.UNPACK_FLIP_Y_WEBGL;
	var UNPACK_PREMULTIPLY_ALPHA_WEBGL:Parameter<Bool>                          = InternalGLContext.UNPACK_PREMULTIPLY_ALPHA_WEBGL;
	#end

	var VENDOR:Parameter<String>                                                = InternalGLContext.VENDOR;
	var VERSION:Parameter<String>                                               = InternalGLContext.VERSION;
	var VIEWPORT:Parameter<haxe.io.Int32Array>                                  = InternalGLContext.VIEWPORT; //(with 4 elements)
}

//WebGL specific
#if js
@:enum
abstract WebGLColorSpaceConversion(GLenum) to GLenum from GLenum{
	var BROWSER_DEFAULT_WEBGL = InternalGLContext.BROWSER_DEFAULT_WEBGL;
}
#end