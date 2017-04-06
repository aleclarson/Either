
Either = require ".."

describe "Either", ->

  it "passes if the value matches any of the expected types", ->
    v = Either String, Number
    expect v.test 0
      .toBe yes
    expect v.test ""
      .toBe yes
    expect v.test null
      .toBe no
