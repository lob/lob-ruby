# Lob::IntlVerificationWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **recipient** | **String** | The intended recipient, typically a person&#39;s or firm&#39;s name. | [optional] |
| **primary_line** | **String** | The primary delivery line (usually the street address) of the address.  | [optional] |
| **secondary_line** | **String** | The secondary delivery line of the address. This field is typically empty but may contain information if &#x60;primary_line&#x60; is too long.  | [optional] |
| **city** | **String** |  | [optional] |
| **state** | **String** | The name of the state. | [optional] |
| **postal_code** | **String** | The postal code. | [optional] |
| **country** | [**CountryExtended**](CountryExtended.md) |  | [optional] |
| **address** | **String** | The entire address in one string (e.g., \&quot;370 Water St C1N 1C4\&quot;).  | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::IntlVerificationWritable.new(
  recipient: null,
  primary_line: null,
  secondary_line: null,
  city: null,
  state: null,
  postal_code: null,
  country: null,
  address: null
)
```

