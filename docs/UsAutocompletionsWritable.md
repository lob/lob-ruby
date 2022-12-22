# OpenapiClient::UsAutocompletionsWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_prefix** | **String** | Only accepts numbers and street names in an alphanumeric format.  |  |
| **city** | **String** | An optional city input used to filter suggestions. Case insensitive and does not match partial abbreviations.  | [optional] |
| **state** | **String** | An optional state input used to filter suggestions. Case insensitive and does not match partial abbreviations.  | [optional] |
| **zip_code** | **String** | An optional ZIP Code input used to filter suggestions. Matches partial entries.  | [optional] |
| **geo_ip_sort** | **Boolean** | If &#x60;true&#x60;, sort suggestions by proximity to the IP set in the &#x60;X-Forwarded-For&#x60; header.  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UsAutocompletionsWritable.new(
  address_prefix: null,
  city: null,
  state: null,
  zip_code: null,
  geo_ip_sort: null
)
```

