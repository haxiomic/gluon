package gluon.webgl.native;

#if !macro

import cpp.*;
import gluon.webgl.GLContext;

@:native('')
@:include('./ES2Context.h')
@:unreflective
#if !display
@:build(gluon.webgl.native.ES2Context.ES2ContextMacro.addBuildConfig())
#end
extern class ES2Context {

    @:native('glActiveTexture')static function glActiveTexture(texture: GLenum): Void;
    @:native('glAttachShader')static function glAttachShader(program: GLuint, shader: GLuint): Void;
    @:native('glBindAttribLocation')static function glBindAttribLocation(program: GLuint, index: GLuint, name: ConstCharStar): Void;
    @:native('glBindBuffer')static function glBindBuffer(target: GLenum, buffer: GLuint): Void;
    @:native('glBindFramebuffer')static function glBindFramebuffer(target: GLenum, framebuffer: GLuint): Void;
    @:native('glBindRenderbuffer')static function glBindRenderbuffer(target: GLenum, renderbuffer: GLuint): Void;
    @:native('glBindTexture')static function glBindTexture(target: GLenum, texture: GLuint): Void;
    @:native('glBlendColor')static function glBlendColor(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat): Void;
    @:native('glBlendEquation')static function glBlendEquation(mode: GLenum): Void;
    @:native('glBlendEquationSeparate')static function glBlendEquationSeparate(modeRGB: GLenum, modeAlpha: GLenum): Void;
    @:native('glBlendFunc')static function glBlendFunc(sfactor: GLenum, dfactor: GLenum): Void;
    @:native('glBlendFuncSeparate')static function glBlendFuncSeparate(sfactorRGB: GLenum, dfactorRGB: GLenum, sfactorAlpha: GLenum, dfactorAlpha: GLenum): Void;
    @:native('glBufferData')static function glBufferData(target: GLenum, size: GLsizeiptr, data: ConstStar<cpp.Void>, usage: GLenum): Void;
    @:native('glBufferSubData')static function glBufferSubData(target: GLenum, offset: GLintptr, size: GLsizeiptr, data: ConstStar<cpp.Void>): Void;
    @:native('glCheckFramebufferStatus')static function glCheckFramebufferStatus(target: GLenum): GLenum;
    @:native('glClear')static function glClear(mask: GLbitfield): Void;
    @:native('glClearColor')static function glClearColor(red: GLfloat, green: GLfloat, blue: GLfloat, alpha: GLfloat): Void;
    @:native('glClearDepthf')static function glClearDepthf(d: GLfloat): Void;
    @:native('glClearStencil')static function glClearStencil(s: GLint): Void;
    @:native('glColorMask')static function glColorMask(red: Bool, green: Bool, blue: Bool, alpha: Bool): Void;
    @:native('glCompileShader')static function glCompileShader(shader: GLuint): Void;
    @:native('glCompressedTexImage2D')static function glCompressedTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, width: GLsizei, height: GLsizei, border: GLint, imageSize: GLsizei, data: ConstStar<cpp.Void>): Void;
    @:native('glCompressedTexSubImage2D')static function glCompressedTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, imageSize: GLsizei, data: ConstStar<cpp.Void>): Void;
    @:native('glCopyTexImage2D')static function glCopyTexImage2D(target: GLenum, level: GLint, internalformat: GLenum, x: GLint, y: GLint, width: GLsizei, height: GLsizei, border: GLint): Void;
    @:native('glCopyTexSubImage2D')static function glCopyTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, x: GLint, y: GLint, width: GLsizei, height: GLsizei): Void;
    @:native('glCreateProgram')static function glCreateProgram(): GLuint;
    @:native('glCreateShader')static function glCreateShader(type: GLenum): GLuint;
    @:native('glCullFace')static function glCullFace(mode: GLenum): Void;
    @:native('glDeleteBuffers')static function glDeleteBuffers(n: GLsizei, buffers: ConstStar<GLuint>): Void;
    @:native('glDeleteFramebuffers')static function glDeleteFramebuffers(n: GLsizei, framebuffers: ConstStar<GLuint>): Void;
    @:native('glDeleteProgram')static function glDeleteProgram(program: GLuint): Void;
    @:native('glDeleteRenderbuffers')static function glDeleteRenderbuffers(n: GLsizei, renderbuffers: ConstStar<GLuint>): Void;
    @:native('glDeleteShader')static function glDeleteShader(shader: GLuint): Void;
    @:native('glDeleteTextures')static function glDeleteTextures(n: GLsizei, textures: ConstStar<GLuint>): Void;
    @:native('glDepthFunc')static function glDepthFunc(func: GLenum): Void;
    @:native('glDepthMask')static function glDepthMask(flag: Bool): Void;
    @:native('glDepthRangef')static function glDepthRangef(n: GLfloat, f: GLfloat): Void;
    @:native('glDetachShader')static function glDetachShader(program: GLuint, shader: GLuint): Void;
    @:native('glDisable')static function glDisable(cap: GLenum): Void;
    @:native('glDisableVertexAttribArray')static function glDisableVertexAttribArray(index: GLuint): Void;
    @:native('glDrawArrays')static function glDrawArrays(mode: GLenum, first: GLint, count: GLsizei): Void;
    @:native('glDrawElements')static function glDrawElements(mode: GLenum, count: GLsizei, type: GLenum, indices: ConstStar<cpp.Void>): Void;
    @:native('glEnable')static function glEnable(cap: GLenum): Void;
    @:native('glEnableVertexAttribArray')static function glEnableVertexAttribArray(index: GLuint): Void;
    @:native('glFinish')static function glFinish(): Void;
    @:native('glFlush')static function glFlush(): Void;
    @:native('glFramebufferRenderbuffer')static function glFramebufferRenderbuffer(target: GLenum, attachment: GLenum, renderbuffertarget: GLenum, renderbuffer: GLuint): Void;
    @:native('glFramebufferTexture2D')static function glFramebufferTexture2D(target: GLenum, attachment: GLenum, textarget: GLenum, texture: GLuint, level: GLint): Void;
    @:native('glFrontFace')static function glFrontFace(mode: GLenum): Void;
    @:native('glGenBuffers')static function glGenBuffers(n: GLsizei, buffers: Star<GLuint>): Void;
    @:native('glGenerateMipmap')static function glGenerateMipmap(target: GLenum): Void;
    @:native('glGenFramebuffers')static function glGenFramebuffers(n: GLsizei, framebuffers: Star<GLuint>): Void;
    @:native('glGenRenderbuffers')static function glGenRenderbuffers(n: GLsizei, renderbuffers: Star<GLuint>): Void;
    @:native('glGenTextures')static function glGenTextures(n: GLsizei, textures: Star<GLuint>): Void;
    @:native('glGetActiveAttrib')static function glGetActiveAttrib(program: GLuint, index: GLuint, bufSize: GLsizei, length: Star<GLsizei>, size: Star<GLint>, type: Star<GLenum>, name: CastCharStar): Void;
    @:native('glGetActiveUniform')static function glGetActiveUniform(program: GLuint, index: GLuint, bufSize: GLsizei, length: Star<GLsizei>, size: Star<GLint>, type: Star<GLenum>, name: CastCharStar): Void;
    @:native('glGetAttachedShaders')static function glGetAttachedShaders(program: GLuint, maxCount: GLsizei, count: Star<GLsizei>, shaders: Star<GLuint>): Void;
    @:native('glGetAttribLocation')static function glGetAttribLocation(program: GLuint, name: ConstCharStar): GLint;
    @:native('glGetBooleanv')static function glGetBooleanv(pname: GLenum, data: Star<UInt8>): Void;
    @:native('glGetBufferParameteriv')static function glGetBufferParameteriv(target: GLenum, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetError')static function glGetError(): GLenum;
    @:native('glGetFloatv')static function glGetFloatv(pname: GLenum, data: Star<GLfloat>): Void;
    @:native('glGetFramebufferAttachmentParameteriv')static function glGetFramebufferAttachmentParameteriv(target: GLenum, attachment: GLenum, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetIntegerv')static function glGetIntegerv(pname: GLenum, data: Star<GLint>): Void;
    @:native('glGetProgramiv')static function glGetProgramiv(program: GLuint, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetProgramInfoLog')static function glGetProgramInfoLog(program: GLuint, bufSize: GLsizei, length: Star<GLsizei>, infoLog: CastCharStar): Void;
    @:native('glGetRenderbufferParameteriv')static function glGetRenderbufferParameteriv(target: GLenum, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetShaderiv')static function glGetShaderiv(shader: GLuint, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetShaderInfoLog')static function glGetShaderInfoLog(shader: GLuint, bufSize: GLsizei, length: Star<GLsizei>, infoLog: CastCharStar): Void;
    @:native('glGetShaderPrecisionFormat')static function glGetShaderPrecisionFormat(shadertype: GLenum, precisiontype: GLenum, range: Star<GLint>, precision: Star<GLint>): Void;
    @:native('glGetShaderSource')static function glGetShaderSource(shader: GLuint, bufSize: GLsizei, length: Star<GLsizei>, source: CastCharStar): Void;
    @:native('glGetString')static function glGetString(name: GLenum): RawConstPointer<GLubyte>;
    @:native('glGetTexParameterfv')static function glGetTexParameterfv(target: GLenum, pname: GLenum, params: Star<GLfloat>): Void;
    @:native('glGetTexParameteriv')static function glGetTexParameteriv(target: GLenum, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetUniformfv')static function glGetUniformfv(program: GLuint, location: GLint, params: Star<GLfloat>): Void;
    @:native('glGetUniformiv')static function glGetUniformiv(program: GLuint, location: GLint, params: Star<GLint>): Void;
    @:native('glGetUniformLocation')static function glGetUniformLocation(program: GLuint, name: ConstCharStar): GLint;
    @:native('glGetVertexAttribfv')static function glGetVertexAttribfv(index: GLuint, pname: GLenum, params: Star<GLfloat>): Void;
    @:native('glGetVertexAttribiv')static function glGetVertexAttribiv(index: GLuint, pname: GLenum, params: Star<GLint>): Void;
    @:native('glGetVertexAttribPointerv')static function glGetVertexAttribPointerv(index: GLuint, pname: GLenum, pointer: Star<Star<cpp.Void>>): Void;
    @:native('glHint')static function glHint(target: GLenum, mode: GLenum): Void;
    @:native('glIsBuffer')static function glIsBuffer(buffer: GLuint): Bool;
    @:native('glIsEnabled')static function glIsEnabled(cap: GLenum): Bool;
    @:native('glIsFramebuffer')static function glIsFramebuffer(framebuffer: GLuint): Bool;
    @:native('glIsProgram')static function glIsProgram(program: GLuint): Bool;
    @:native('glIsRenderbuffer')static function glIsRenderbuffer(renderbuffer: GLuint): Bool;
    @:native('glIsShader')static function glIsShader(shader: GLuint): Bool;
    @:native('glIsTexture')static function glIsTexture(texture: GLuint): Bool;
    @:native('glLineWidth')static function glLineWidth(width: GLfloat): Void;
    @:native('glLinkProgram')static function glLinkProgram(program: GLuint): Void;
    @:native('glPixelStorei')static function glPixelStorei(pname: GLenum, param: GLint): Void;
    @:native('glPolygonOffset')static function glPolygonOffset(factor: GLfloat, units: GLfloat): Void;
    @:native('glReadPixels')static function glReadPixels(x: GLint, y: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pixels: Star<cpp.Void>): Void;
    @:native('glReleaseShaderCompiler')static function glReleaseShaderCompiler(): Void;
    @:native('glRenderbufferStorage')static function glRenderbufferStorage(target: GLenum, internalformat: GLenum, width: GLsizei, height: GLsizei): Void;
    @:native('glSampleCoverage')static function glSampleCoverage(value: GLfloat, invert: Bool): Void;
    @:native('glScissor')static function glScissor(x: GLint, y: GLint, width: GLsizei, height: GLsizei): Void;
    @:native('glShaderBinary')static function glShaderBinary(count: GLsizei, shaders: ConstStar<GLuint>, binaryformat: GLenum, binary: ConstStar<cpp.Void>, length: GLsizei): Void;
    @:native('glShaderSource')static function glShaderSource(shader: GLuint, count: GLsizei, string: ConstStar<ConstCharStar>, length: ConstStar<GLint>): Void;
    @:native('glStencilFunc')static function glStencilFunc(func: GLenum, ref: GLint, mask: GLuint): Void;
    @:native('glStencilFuncSeparate')static function glStencilFuncSeparate(face: GLenum, func: GLenum, ref: GLint, mask: GLuint): Void;
    @:native('glStencilMask')static function glStencilMask(mask: GLuint): Void;
    @:native('glStencilMaskSeparate')static function glStencilMaskSeparate(face: GLenum, mask: GLuint): Void;
    @:native('glStencilOp')static function glStencilOp(fail: GLenum, zfail: GLenum, zpass: GLenum): Void;
    @:native('glStencilOpSeparate')static function glStencilOpSeparate(face: GLenum, sfail: GLenum, dpfail: GLenum, dppass: GLenum): Void;
    @:native('glTexImage2D')static function glTexImage2D(target: GLenum, level: GLint, internalformat: GLint, width: GLsizei, height: GLsizei, border: GLint, format: GLenum, type: GLenum, pixels: ConstStar<cpp.Void>): Void;
    @:native('glTexParameterf')static function glTexParameterf(target: GLenum, pname: GLenum, param: GLfloat): Void;
    @:native('glTexParameterfv')static function glTexParameterfv(target: GLenum, pname: GLenum, params: ConstStar<GLfloat>): Void;
    @:native('glTexParameteri')static function glTexParameteri(target: GLenum, pname: GLenum, param: GLint): Void;
    @:native('glTexParameteriv')static function glTexParameteriv(target: GLenum, pname: GLenum, params: ConstStar<GLint>): Void;
    @:native('glTexSubImage2D')static function glTexSubImage2D(target: GLenum, level: GLint, xoffset: GLint, yoffset: GLint, width: GLsizei, height: GLsizei, format: GLenum, type: GLenum, pixels: ConstStar<cpp.Void>): Void;
    @:native('glUniform1f')static function glUniform1f(location: GLint, v0: GLfloat): Void;
    @:native('glUniform1fv')static function glUniform1fv(location: GLint, count: GLsizei, value: ConstStar<GLfloat>): Void;
    @:native('glUniform1i')static function glUniform1i(location: GLint, v0: GLint): Void;
    @:native('glUniform1iv')static function glUniform1iv(location: GLint, count: GLsizei, value: ConstStar<GLint>): Void;
    @:native('glUniform2f')static function glUniform2f(location: GLint, v0: GLfloat, v1: GLfloat): Void;
    @:native('glUniform2fv')static function glUniform2fv(location: GLint, count: GLsizei, value: ConstStar<GLfloat>): Void;
    @:native('glUniform2i')static function glUniform2i(location: GLint, v0: GLint, v1: GLint): Void;
    @:native('glUniform2iv')static function glUniform2iv(location: GLint, count: GLsizei, value: ConstStar<GLint>): Void;
    @:native('glUniform3f')static function glUniform3f(location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat): Void;
    @:native('glUniform3fv')static function glUniform3fv(location: GLint, count: GLsizei, value: ConstStar<GLfloat>): Void;
    @:native('glUniform3i')static function glUniform3i(location: GLint, v0: GLint, v1: GLint, v2: GLint): Void;
    @:native('glUniform3iv')static function glUniform3iv(location: GLint, count: GLsizei, value: ConstStar<GLint>): Void;
    @:native('glUniform4f')static function glUniform4f(location: GLint, v0: GLfloat, v1: GLfloat, v2: GLfloat, v3: GLfloat): Void;
    @:native('glUniform4fv')static function glUniform4fv(location: GLint, count: GLsizei, value: ConstStar<GLfloat>): Void;
    @:native('glUniform4i')static function glUniform4i(location: GLint, v0: GLint, v1: GLint, v2: GLint, v3: GLint): Void;
    @:native('glUniform4iv')static function glUniform4iv(location: GLint, count: GLsizei, value: ConstStar<GLint>): Void;
    @:native('glUniformMatrix2fv')static function glUniformMatrix2fv(location: GLint, count: GLsizei, transpose: Bool, value: ConstStar<GLfloat>): Void;
    @:native('glUniformMatrix3fv')static function glUniformMatrix3fv(location: GLint, count: GLsizei, transpose: Bool, value: ConstStar<GLfloat>): Void;
    @:native('glUniformMatrix4fv')static function glUniformMatrix4fv(location: GLint, count: GLsizei, transpose: Bool, value: ConstStar<GLfloat>): Void;
    @:native('glUseProgram')static function glUseProgram(program: GLuint): Void;
    @:native('glValidateProgram')static function glValidateProgram(program: GLuint): Void;
    @:native('glVertexAttrib1f')static function glVertexAttrib1f(index: GLuint, x: GLfloat): Void;
    @:native('glVertexAttrib1fv')static function glVertexAttrib1fv(index: GLuint, v: ConstStar<GLfloat>): Void;
    @:native('glVertexAttrib2f')static function glVertexAttrib2f(index: GLuint, x: GLfloat, y: GLfloat): Void;
    @:native('glVertexAttrib2fv')static function glVertexAttrib2fv(index: GLuint, v: ConstStar<GLfloat>): Void;
    @:native('glVertexAttrib3f')static function glVertexAttrib3f(index: GLuint, x: GLfloat, y: GLfloat, z: GLfloat): Void;
    @:native('glVertexAttrib3fv')static function glVertexAttrib3fv(index: GLuint, v: ConstStar<GLfloat>): Void;
    @:native('glVertexAttrib4f')static function glVertexAttrib4f(index: GLuint, x: GLfloat, y: GLfloat, z: GLfloat, w: GLfloat): Void;
    @:native('glVertexAttrib4fv')static function glVertexAttrib4fv(index: GLuint, v: ConstStar<GLfloat>): Void;
    @:native('glVertexAttribPointer')static function glVertexAttribPointer(index: GLuint, size: GLint, type: GLenum, normalized: Bool, stride: GLsizei, pointer: ConstStar<cpp.Void>): Void;
    @:native('glViewport')static function glViewport(x: GLint, y: GLint, width: GLsizei, height: GLsizei): Void;

}

#else
// #macro

import haxe.macro.Context;
import haxe.io.Path;

class ES2ContextMacro {

	static function addBuildConfig() {
		var classPosInfo = Context.getPosInfos(Context.currentPos());
		var classFilePath = sys.FileSystem.absolutePath(Context.resolvePath(classPosInfo.file));
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