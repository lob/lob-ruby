# Lob::Location

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **latitude** | **Float** | A positive or negative decimal indicating the geographic latitude of the address, specifying the north-to-south position of a location. This should be input with &#x60;longitude&#x60; to pinpoint locations on a map.  |  |
| **longitude** | **Float** | A positive or negative decimal indicating the geographic longitude of the address, specifying the north-to-south position of a location. This should be input with &#x60;latitude&#x60; to pinpoint locations on a map.  |  |

## Example

```ruby
require 'openapi_client'

instance = Lob::Location.new(
  latitude: null,
  longitude: null
)
```

