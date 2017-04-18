
formatType = require "formatType"
Validator = require "Validator"
wrongType = require "wrongType"

Either = Validator.Type "Either",

  init: ->

    types = []
    for type in arguments
      types.push type if type

    @types = types
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
