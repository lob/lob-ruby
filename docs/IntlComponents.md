# Lob::IntlComponents

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **primary_number** | **String** | The numeric or alphanumeric part of an address preceding the street name. Often the house, building, or PO Box number. | [optional] |
| **street_name** | **String** | The name of the street. | [optional] |
| **city** | **String** |  | [optional] |
| **state** | **String** | The [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) two letter code for the state.  | [optional] |
| **postal_code** | **String** | The postal code. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::IntlComponents.new(
  primary_number: null,
  street_name: null,
  city: null,
  state: null,
  postal_code: null
)
```

