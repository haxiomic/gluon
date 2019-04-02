#include <stdio.h>
#include <sstream>

// EGL Window
#define GL_GLEXT_PROTOTYPES
#include <EGL/egl.h>
#include <GLES2/gl2.h>
#import <AppKit/NSApplication.h>
#import <AppKit/NSWindow.h>
#import <AppKit/NSScreen.h>
#import <AppKit/NSView.h>
#import <AppKit/NSMenuItem.h>
#import <AppKit/NSMenu.h>

// Embdded haxe main
#include <Example.h>
#define TRUE 1
#define FALSE 0

// Index to bind the attributes to vertex shaders
unsigned int kFPS (120.0);
EGLint kAASamples (4);

unsigned int width  (800);
unsigned int height (600);

/*!*********************************************************************************************************************
 Class AppController
 ***********************************************************************************************************************/
@class AppController;

@interface AppController : NSObject <NSApplicationDelegate>{
@public
	NSWindow*        m_window;   	// Our window
	NSView*          m_view;        // Our view
@private
	NSTimer*         m_timer;		// timer for rendering our OpenGL content
    // EGL variables
    EGLDisplay       m_Display;
    EGLSurface       m_Surface;
    EGLContext       m_Context;
}
@end

@implementation AppController

- (BOOL) createEGLDisplay:(EGLDisplay &)eglDisplay{
	eglDisplay = eglGetDisplay((EGLNativeDisplayType)0);
	if (eglDisplay == EGL_NO_DISPLAY){
		printf("Failed to get an EGLDisplay");
		return FALSE;
	}
	// Initialize EGL.
	EGLint eglMajorVersion, eglMinorVersion;
	if (!eglInitialize(eglDisplay, &eglMajorVersion, &eglMinorVersion)){
		printf("Failed to initialise the EGLDisplay");
		return FALSE;
	}
	return TRUE;
}

- (BOOL) chooseEGLConfig:(EGLConfig &)eglConfig fromDisplay:(EGLDisplay)eglDisplay{
	const EGLint configurationAttributes[] = {
		EGL_SURFACE_TYPE,		EGL_WINDOW_BIT,
		EGL_RENDERABLE_TYPE,	EGL_OPENGL_ES2_BIT,
		EGL_SAMPLES, kAASamples, //hardware antialiasing
		EGL_NONE
	};
	EGLint configsReturned;
	if (!eglChooseConfig(eglDisplay, configurationAttributes, &eglConfig, 1, &configsReturned) || (configsReturned != 1)){
		printf("Failed to choose a suitable config.");
		return FALSE;
	}
	return TRUE;
}

- (BOOL) createEGLSurface:(EGLSurface &)eglSurface fromDisplay:(EGLDisplay)eglDisplay withConfig:(EGLConfig)eglConfig withView:(NSView *)view{
	eglSurface = eglCreateWindowSurface(eglDisplay, eglConfig, (EGLNativeWindowType)view, NULL);
	return TRUE;
}

- (BOOL) setupEGLContext:(EGLContext &)eglContext fromDisplay:(EGLDisplay)eglDisplay withConfig:(EGLConfig)eglConfig withSurface:(EGLSurface)eglSurface{
	eglBindAPI(EGL_OPENGL_ES_API);
	EGLint contextAttributes[] = {
		EGL_CONTEXT_CLIENT_VERSION, 2,
		EGL_NONE
	};
	// Create the context with the context attributes supplied
	eglContext = eglCreateContext(eglDisplay, eglConfig, NULL, contextAttributes);
	// Bind the context to the current thread.
	eglMakeCurrent(eglDisplay, eglSurface, eglSurface, eglContext);
	return TRUE;
}

- (void) applicationDidFinishLaunching:(NSNotification *)notification{
    // Create our window
    NSRect frame = NSMakeRect(0,0,width, height);
    m_window = [[NSWindow alloc] initWithContentRect:frame styleMask:NSMiniaturizableWindowMask | NSTitledWindowMask | NSClosableWindowMask backing:NSBackingStoreBuffered defer:NO];

    if(!m_window){
        NSLog(@"Failed to allocated the window.");
        [self terminateApp];
    }

    [m_window setTitle:@"OpenGL ES 2.0 Window"];
    [m_window center];

    // Create our view
    m_view = [[NSView alloc] initWithFrame:frame];

    // Now we have a view, add it to our window
    [m_window setContentView:m_view];
    [m_window makeKeyAndOrderFront:nil];

    // Add an observer so when our window is closed we terminate the app
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(terminateApp) name:NSWindowWillCloseNotification object:m_window];

    EGLConfig config;

    // Create and Initialise an EGLDisplay
    if(![self createEGLDisplay:m_Display]){	[self terminateApp]; }
	// Choose an EGLConfig for the application, used when setting up the rendering surface and EGLContext
	if(![self chooseEGLConfig:config fromDisplay:m_Display]){	[self terminateApp];  }
	// Create an EGLSurface for rendering
	if(![self createEGLSurface:m_Surface fromDisplay:m_Display withConfig:config withView:m_view]){	[self terminateApp]; }
	// Setup the EGL Context from the other EGL constructs created so far, so that the application is ready to submit OpenGL ES commands
	if(![self setupEGLContext:m_Context fromDisplay:m_Display withConfig:config withSurface:m_Surface]){ [self terminateApp]; }

	//initialize drawing buffers
	glClearColor(0, 0, 0, 1);
	glClear(GL_COLOR_BUFFER_BIT);
	eglSwapBuffers(m_Display, m_Surface);
	glClear(GL_COLOR_BUFFER_BIT);

	// [self initializeJavaScript];
	Example_obj::init();

    // Setup a timer to redraw the view at a regular interval
    m_timer = [NSTimer scheduledTimerWithTimeInterval:(1.0 / kFPS) target:self selector:@selector(renderScene) userInfo:nil repeats:YES];
}

/*
- (void) initializeJavaScript{
	//Initialize JavaScript App
	const char* execPath = [NSProcessInfo.processInfo.arguments[0] UTF8String];

	std::string execDir(execPath);
	int p = execDir.find_last_of('/');
	execDir = execDir.substr(0, p != std::string::npos ? p : 0);

	// NativeCanvas::Initialize((execDir + "/../../").c_str());
	NativeCanvas::Initialize("");

	//sets canvas width and height from view frame
	//(a stopgap solution)
	int w = 0, h = 0; 
	AppController* delegate = (AppController*)[NSApp delegate];
	w = delegate->m_view.frame.size.width;
	h = delegate->m_view.frame.size.height;
	std::stringstream src;
	src << "window.canvas.width = " << w << ";";
	src << "window.canvas.height = " << h << ";";
	NativeCanvas::EvaluateString(src.str().c_str());

	if([NSProcessInfo.processInfo.arguments count] >= 2){
		NativeCanvas::EvaluateFile([NSProcessInfo.processInfo.arguments[1] UTF8String]);
	}else{
		NativeCanvas::Print::Info("Pass js file path as argument");
	}
}
*/

- (BOOL) renderScene{
	/*
	NativeCanvas::DispatchAnimationFrame();
	NativeCanvas::Tick();
	*/
	Example_obj::onFrame();

	eglSwapBuffers(m_Display, m_Surface);
	return TRUE;
}

- (void) releaseEGLState:(EGLDisplay)eglDisplay{
	eglMakeCurrent(eglDisplay, EGL_NO_SURFACE, EGL_NO_SURFACE, EGL_NO_CONTEXT);
	eglTerminate(eglDisplay);
}

- (void) applicationWillTerminate:(NSNotification *)notification{
    // Release our timer
    [m_timer invalidate];
	[self releaseEGLState:m_Display];
    // Release our view and window
    [m_view release]; m_view = nil;
    [m_window release]; m_window = nil;

    // NativeCanvas::Dispose();
}

- (void) terminateApp{
    [NSApp terminate:nil];
}

@end

extern "C" int initHaxe();

int main(int argc, char **argv){
	[NSAutoreleasePool new];

	AppController *delegate = [AppController new];

	[NSApplication sharedApplication];
	[NSApp setDelegate: delegate];

	[NSApp setActivationPolicy: NSApplicationActivationPolicyRegular];
	[NSApp activateIgnoringOtherApps:YES];

	initHaxe();

	[NSApp run];
	return 0;
}

extern "C" const char *hxRunLibrary();
extern "C" void hxcpp_set_top_of_stack();

// Declare additional library entry points...
//extern "C" int nme_register_prims();

extern "C" int initHaxe(){
	// Do this first
	hxcpp_set_top_of_stack();

   // Register additional ndll libaries ...
   // nme_register_prims();

	printf("Begin!\n");
 	const char *err = hxRunLibrary();
	if (err) {
		// Unhandled exceptions ...
		fprintf(stderr, "Error %s\n", err);
		return -1;
	}
	printf("Done!\n");
	return 0;
}