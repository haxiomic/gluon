import typedarray.ArrayBuffer;
import typedarray.ArrayBufferView;
import typedarray.Float32Array;
import typedarray.Uint8Array;

class Main {
    
    #if !macro
    static function main() {
        #if js
        trace('-- JS --');
        #elseif cpp
        trace('-- C++ --');
        #end

        // tests
        // testArrayBuffer();
        // testFloat32Array();
        testUint8Array();
    }

    static function testFloat32Array() {
        var numbersString = '1|2|3|42|99';

        var x = Float32Array.from(numbersString.split('|').map(n -> Std.parseFloat(n)));

        // test iterator
        test([for (v in x) v].join('|') == numbersString);

        // test copy via constructor
        var copy = new Float32Array(x);
        test([for (v in copy) v].join('|') == numbersString);

        // check it unifies with ArrayBufferView (compile-time)
        var view: ArrayBufferView = x;

        // check it's considered a view at runtime
        test(ArrayBuffer.isView(new Float32Array(0)) == true);
        
        // validate byte-length
        test((new Float32Array(3)).byteLength == 12);

        // test subarray
        var y = new Float32Array([-1,6,88,12,4]);
        var sub = y.subarray(2);
        test(sub.join('*') == '88*12*4');
        y[2] = 99;
        test(sub.join('*') == '99*12*4');
        
        // test fill
        y.fill(103, -2);
        test(sub.join('*') == '99*103*103');

        // test indexOf
        var z = new Float32Array([7,8,3,2,-1,8,5]);
        test(z.indexOf(8, 2) == 5);

        // test set
        z.set(new Float32Array([3,3,3]), 3);
        z.set([9]);
        test(z.join(',') == '9,8,3,3,3,3,5');
    }

    static function testUint8Array() {
        var numbersString = '1|2|3|42|99';

        var x = Uint8Array.from(numbersString.split('|').map(n -> Std.parseInt(n)));

        // test iterator
        test([for (v in x) v].join('|') == numbersString);

        // test copy via constructor
        var copy = new Uint8Array(x);
        test([for (v in copy) v].join('|') == numbersString);

        // check it unifies with ArrayBufferView (compile-time)
        var view: ArrayBufferView = x;

        // check it's considered a view at runtime
        test(ArrayBuffer.isView(new Uint8Array(0)) == true);
        
        // validate byte-length
        test((new Uint8Array(3)).byteLength == 12);

        // test subarray
        var y = new Uint8Array([-1,6,88,12,4]);
        var sub = y.subarray(2);
        test(sub.join('*') == '88*12*4');
        y[2] = 99;
        test(sub.join('*') == '99*12*4');
        
        // test fill
        y.fill(103, -2);
        test(sub.join('*') == '99*103*103');

        // test indexOf
        var z = new Uint8Array([7,8,3,2,-1,8,5]);
        test(z.indexOf(8, 2) == 5);

        // test set
        z.set(new Uint8Array([3,3,3]), 3);
        z.set([9]);
        test(z.join(',') == '9,8,3,3,3,3,5');
    }

    static function testArrayBuffer() {
        var x = new ArrayBuffer(5);
        test(ArrayBuffer.isView(x) == false);
        // 0 1 2 3 4
        // 0 0 0 0 0
        test(x.slice(1, 4).byteLength == 3);
        test(x.slice(1, 1).byteLength == 0);
        test(x.slice(1, 0).byteLength == 0);
        test(x.slice(0, -1).byteLength == 4);
        test(x.slice(0).byteLength == 5);
        test(x.slice(-2).byteLength == 2);
    }

    #end

    macro static function test(expr: haxe.macro.Expr) {
        var printer = new haxe.macro.Printer();
        var exprString = printer.printExpr(expr);
        return macro {
            var exprValue = ${expr};
            trace(
                $v{exprString},
                exprValue
            );
        };
    }

}