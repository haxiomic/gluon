package gluon.es2;

typedef GLContextAttributes = {
    var alpha:Bool;
    var depth:Bool;
    var stencil:Bool;
    var antialias:Bool;
    var premultipliedAlpha:Bool;
    var preserveDrawingBuffer:Bool;

    // webgl-specific
    #if js
    var ?powerPreference: js.html.webgl.PowerPreference;
    var ?failIfMajorPerformanceCaveat: Bool;
    #end
};