"use strict"
var ACME = window.ACME || {};
ACME.Customer=function () {
    var customerName,
        setname = function (n) { customerName = n; },
        gettname = function (n) { return customerName },
        talk = function () { alert('My Name is ' + customerName); };

    return {
        set_name: setname,
        get_name: gettname,
        speak: talk
    }
}();