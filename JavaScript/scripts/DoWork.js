import { Polygon, Square, Rectangle} from 'scripts/MyModule.js';


//eg1
let p = new Polygon(300, 400);
p.sayName();
alert('The width of this polygon is ' + p.width);

//eg2
const MyPoly = class Poly {
    getPolyName() {
        return 'Hi. I was created with a Class expression. My name is ' +
            Poly.name;
    }
};

let inst = new MyPoly();
inst.getPolyName();

//eg3
let s = new Square(5);
s.sayName();
alert('The area of this square is ' + s.area);


//eg4
let r = new Rectangle(50, 60);
r.sayName();


