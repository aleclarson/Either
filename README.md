
# Typle v1.0.1 ![stable](https://img.shields.io/badge/stability-stable-4EBA0F.svg?style=flat)

> A tuple of types (used for validation).

```coffee
Typle = require "Typle"

types = Typle [ Number, Array ]

types.test 0  # => true

types.test [] # => true

types.test {} # => false

types.assert 0 # => undefined

types.assert {} # => Error()
```

- Built with [aleclarson/Validator](https://github.com/aleclarson/Validator)
