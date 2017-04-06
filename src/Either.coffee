
formatType = require "formatType"
sliceArray = require "sliceArray"
Validator = require "Validator"
wrongType = require "wrongType"
isType = require "isType"

Either = Validator.Type "Either",

  init: ->
    @types = sliceArray arguments
    return

  name: -> formatType @types

  test: (value) ->
    {types} = this

    index = -1
    numTypes = types.length

    unless value?
      while ++index < numTypes
        type = types[index]
        if type instanceof Validator
          return yes if type.test value
      return no

    while ++index < numTypes
      type = types[index]
      if type instanceof Validator
        return yes if type.test value
      else if type is value.constructor
        return yes
    return no

  assert: (value, key) ->
    return if @test value
    return wrongType @types, key

module.exports = Either
