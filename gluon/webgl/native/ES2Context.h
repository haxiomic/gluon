#ifndef WEBGL_NATIVE_NATIVE_H
#define WEBGL_NATIVE_NATIVE_H

// include GLES2 headers
#ifdef HX_MACOS
    #include <OpenGL/gl3.h>
    #include <OpenGL/gl3ext.h>
#elif defined(HX_WINDOWS)
    #include <GL/glew.h>
#else
    #define GL_GLEXT_PROTOTYPES
    #include <GLES2/gl2.h>
#endif

#endif