# Lob::IntlAutocompletionsWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_prefix** | **String** | Only accepts numbers and street names in an alphanumeric format.  |  |
| **city** | **String** | An optional city input used to filter suggestions. Case insensitive and does not match partial abbreviations.  | [optional] |
| **state** | **String** | An optional state input used to filter suggestions. Case insensitive and does not match partial abbreviations.  | [optional] |
| **zip_code** | **String** | An optional Zip Code input used to filter suggestions. Matches partial entries.  | [optional] |
| **country** | [**CountryExtended**](CountryExtended.md) |  |  |

## Example

```ruby
require 'lob'

instance = Lob::IntlAutocompletionsWritable.new(
  address_prefix: null,
  city: null,
  state: null,
  zip_code: null,
  country: null
)
```

