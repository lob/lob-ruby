# Lob::IntlVerificationOrError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;intl_ver_&#x60;. | [optional] |
| **recipient** | **String** | The intended recipient, typically a person&#39;s or firm&#39;s name. | [optional] |
| **primary_line** | **String** |  | [optional] |
| **secondary_line** | **String** | The secondary delivery line of the address. This field is typically empty but may contain information if &#x60;primary_line&#x60; is too long.  | [optional] |
| **last_line** | **String** |  | [optional] |
| **country** | **String** |  | [optional] |
| **coverage** | **String** |  | [optional] |
| **deliverability** | **String** |  | [optional] |
| **status** | **String** |  | [optional] |
| **components** | [**IntlComponents**](IntlComponents.md) |  | [optional] |
| **object** | **String** |  | [optional][default to &#39;intl_verification&#39;] |
| **error** | [**BulkError**](BulkError.md) |  | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::IntlVerificationOrError.new(
  id: null,
  recipient: null,
  primary_line: null,
  secondary_line: null,
  last_line: null,
  country: null,
  coverage: null,
  deliverability: null,
  status: null,
  components: null,
  object: null,
  error: null
)
```

