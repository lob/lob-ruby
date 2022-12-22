# OpenapiClient::ReverseGeocode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;us_reverse_geocode_&#x60;. | [optional] |
| **addresses** | [**Array&lt;GeocodeAddresses&gt;**](GeocodeAddresses.md) | list of addresses  | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;us_reverse_geocode_lookup&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::ReverseGeocode.new(
  id: null,
  addresses: null,
  object: null
)
```

