import sys.io.File;

class Process {

    static function main() {
        var p = '../../gluon/es2/impl/CppGLContext.hx';
        var pNew = '../../gluon/es2/impl/CppGLContext.new.hx';
        var content = sys.io.File.getContent(p);

        var newContent = ~/public function ([^(]+)\(([^\)]*)\)([^\{]+){[^}]+}/igm.map(content, r -> {
            var fnNameAndTypeParam = r.matched(1);
            var args = r.matched(2);
            var retType = r.matched(3);

            var returns = retType.indexOf(':') != -1;

            var np = ~/(^\w+)/;
            np.match(fnNameAndTypeParam);
            var fnName = np.matched(1);
            
            var argNames = args.split(',').map(s -> {
                return StringTools.trim(s.split(':')[0]);
            });
            
            return 'public function $fnNameAndTypeParam()$retType{
        ${returns ? 'return ' : ''}untyped __global__.gl${capitialize(fnName)}(${argNames.join(', ')});
    }';
        });

        File.saveContent(pNew, newContent);
    }

    static function capitialize(s: String) {
        return s.charAt(0).toUpperCase() + s.substr(1);
    }

}