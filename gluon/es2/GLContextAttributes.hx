package gluon.es2;

@:enum
abstract PowerPreference(String) from String to String {
    var DEFAULT = 'default';
    var HIGH_PERFORMANCE = 'high-performance';
    var LOW_POWER = 'low-power';
}

typedef GLContextAttributes = {
    var alpha:Bool;
    var depth:Bool;
    var stencil:Bool;
    var antialias:Bool;
    var premultipliedAlpha:Bool;
    var preserveDrawingBuffer:Bool;

    // webgl-specific
    var ?powerPreference: PowerPreference;
    var ?failIfMajorPerformanceCaveat: Bool;
};