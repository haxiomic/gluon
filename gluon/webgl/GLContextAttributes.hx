package gluon.webgl;

typedef GLContextAttributes = {
    var alpha:Bool;
    var depth:Bool;
    var stencil:Bool;
    var antialias:Bool;
    var premultipliedAlpha:Bool;
    var preserveDrawingBuffer:Bool;

    // webgl-specific
    var ?failIfMajorPerformanceCaveat: Bool;
    var ?powerPreference: PowerPreference;
};

#if js
typedef PowerPreference = js.html.webgl.PowerPreference;
#else
@:enum abstract PowerPreference(String) from String to String {
    var DEFAULT = 'default';
    var LOW_POWER = 'low-power';
    var HIGH_PERFORMANCE = 'high-performance';
}
#end