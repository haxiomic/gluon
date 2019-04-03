package gluon.es2.macro;

import haxe.macro.Expr.FieldType;
import haxe.macro.Context;

class GLContextDebug {

    #if macro
    static function addErrorChecking() {
        var fields = Context.getBuildFields();

        fields = fields.map(field -> {

            switch field.kind {
                case FFun(func) if (field.name != 'getError'):
                    var hasReturn = if (func.ret != null) {
                        switch func.ret {
                            case macro :Void: false;
                            default: true;
                        }
                    } else {
                        false;
                    }

                    var newExpr = if (hasReturn) {
                        macro {
                            var v = (() -> { $e{func.expr} })();
                            reportErrors($v{field.name});
                            return v;
                        };
                    } else {
                        macro {
                            $e{func.expr};
                            reportErrors($v{field.name});
                        };
                    }

                    return {
                        name: field.name,
                        doc: field.doc,
                        access: field.access,
                        kind: FieldType.FFun({
                            args: func.args,
                            ret: func.ret,
                            expr: newExpr,
                            params: func.params,
                        }),
                        pos: field.pos,
                        meta: field.meta,
                    };

                default: return field;
            }

        });

        // add report errors method
        fields.push((macro class ReportErrors {
            public function reportErrors(fnName: String) {
                var result: ErrorCode = NO_ERROR;
                while ((result = getError()) != NO_ERROR) {
                    var errorName = switch result {
                        case INVALID_ENUM: 'INVALID_ENUM';
                        case INVALID_VALUE: 'INVALID_VALUE';
                        case INVALID_OPERATION: 'INVALID_OPERATION';
                        case INVALID_FRAMEBUFFER_OPERATION: 'INVALID_FRAMEBUFFER_OPERATION';
                        case OUT_OF_MEMORY: 'OUT_OF_MEMORY';
                        case NO_ERROR: 'NO_ERROR';
                    }

                    var callStackString ='\n\t' + haxe.CallStack.callStack().slice(1).join('\n\t');
                    trace('OpenGL Error in "$$fnName": $$errorName', callStackString);
                }
            }
        }).fields[0]);

        return fields;
    }
    #end

}