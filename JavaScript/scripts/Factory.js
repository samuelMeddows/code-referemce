(function () {
    "use strict";

    var copyOwnProperties = function (from, to) {
        for (var propertyName in from) {
            if (from.hasOwnProperty(propertyName)) {
                to[propertyName] = from[propertyName];
            }
        }
    };

    var inherit = function (additionalProperties) {
        var factory = Object.create(this);

        factory.create = function () {
            var instance = Object.create(factory);

            // The instance may have an `initialize` method.
            if (typeof instance.initialize === "function") {
                instance.initialize.apply(instance, arguments);
            }
            return instance;
        };

        // TODO: Copy properties of `additionalProperties` onto `factory' (using copyOwnProperties).
        copyOwnProperties(additionalProperties, factory);

        // TODO: Return the `factory` object.
        return factory;
    };

    // TODO: Add the inherit function to the built-in `Object` object.
    Object.inherit = inherit;

}());
