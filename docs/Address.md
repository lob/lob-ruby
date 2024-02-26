# Lob::Address

## Class instance methods

### `openapi_one_of`

Returns the list of classes defined in oneOf.

#### Example

```ruby
require 'lob'

Lob::Address.openapi_one_of
# =>
# [
#   :'IntlAddress',
#   :'UsAddress'
# ]
```

### build

Find the appropriate object from the `openapi_one_of` list and casts the data into it.

#### Example

```ruby
require 'lob'

Lob::Address.build(data)
# => #<IntlAddress:0x00007fdd4aab02a0>

Lob::Address.build(data_that_doesnt_match)
# => nil
```

#### Parameters

| Name | Type | Description |
| ---- | ---- | ----------- |
| **data** | **Mixed** | data to be matched against the list of oneOf items |

#### Return type

- `IntlAddress`
- `UsAddress`
- `nil` (if no type matches)

