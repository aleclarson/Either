# TODO: Support multiple `Shape` validators.

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
    {constructor} = value if value?

    for type in types

      if type is constructor
        return yes

      if type instanceof Validator
        return yes if type.test value

    return no

  assert: (value, key) ->
    {types} = this
    {constructor} = value if value?

    for type in types
      return if type is constructor

      if type instanceof Validator
        error = type.assert value, key
        return unless error

        # Invalid type can be ignored.
        if error instanceof TypeError
          continue if ~error.message.indexOf "`#{key}`"

        # Otherwise, the error is returned.
        return error

    return wrongType types, key

module.exports = Either
