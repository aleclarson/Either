
# Either v1.0.2 ![stable](https://img.shields.io/badge/stability-stable-4EBA0F.svg?style=flat)

The `Either` type creates `Validator` instances that test positive for any types you pass as arguments.

[Learn more](https://github.com/aleclarson/Validator) about the `Validator` type.

```coffee
Either = require "Either"

NumberOrArray = Either Number, Array

NumberOrArray.test 0  # => true

NumberOrArray.test [] # => true

NumberOrArray.test {} # => false

NumberOrArray.assert 0 # => undefined

NumberOrArray.assert {} # => TypeError()
```

