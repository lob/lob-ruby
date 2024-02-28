# Lob::BulkErrorProperties

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **message** | **String** | A human-readable message with more details about the error | [optional] |
| **status_code** | **Integer** | A conventional HTTP status code. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::BulkErrorProperties.new(
  message: null,
  status_code: null
)
```

