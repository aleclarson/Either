// Generated by CoffeeScript 1.12.4
var Either, Validator, formatType, isType, sliceArray, wrongType;

formatType = require("formatType");

sliceArray = require("sliceArray");

Validator = require("Validator");

wrongType = require("wrongType");

isType = require("isType");

Either = Validator.Type("Either", {
  init: function() {
    this.types = sliceArray(arguments);
  },
  name: function() {
    return formatType(this.types);
  },
  test: function(value) {
    var index, numTypes, type, types;
    types = this.types;
    index = -1;
    numTypes = types.length;
    if (value == null) {
      while (++index < numTypes) {
        type = types[index];
        if (type instanceof Validator) {
          if (type.test(value)) {
            return true;
          }
        }
      }
      return false;
    }
    while (++index < numTypes) {
      type = types[index];
      if (type instanceof Validator) {
        if (type.test(value)) {
          return true;
        }
      } else if (type === value.constructor) {
        return true;
      }
    }
    return false;
  },
  assert: function(value, key) {
    if (this.test(value)) {
      return;
    }
    return wrongType(this.types, key);
  }
});

module.exports = Either;