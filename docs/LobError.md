# Lob::LobError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | A human-readable message with more details about the error | [optional] |
| **status_code** | **Integer** | A conventional HTTP status code. | [optional] |
| **code** | **String** | A pre-defined string identifying an error. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::LobError.new(
  message: null,
  status_code: null,
  code: null
)
```

