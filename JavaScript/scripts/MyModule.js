
'use strict';


class Polygon {
    constructor(height, width) {
        this.name = 'Polygon';
        this.height = height;
        this.width = width;
    }

    sayName() {
        alert('Hi, I am a ' + this.name + '.');
    }

    sayHistory() {
        alert('"Polygon" is derived from the Greek polus (many) ' +
            'and gonia (angle).');
    }
}


class Square extends Polygon {
    constructor(length) {
        super(length, length);
        this.name = 'Square';
    }


    get area() {
        return this.height * this.width;
    }

    set area(value) {
        this.area = value;
    }
}



class Rectangle extends Polygon {
    constructor(height, width) {
        super(height, width);
        this.name = 'Rectangle';
    }
    // Here, sayName() is a subclassed method which
    // overrides their superclass method of the same name.
    sayName() {
        alert('Super! My name is ' + this.name + '.');
        super.sayHistory();
    }
}


export  { Polygon, Square, Rectangle };

