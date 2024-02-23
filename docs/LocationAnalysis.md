# Lob::LocationAnalysis

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **latitude** | **Float** | A positive or negative decimal indicating the geographic latitude of the address. |  |
| **longitude** | **Float** | A positive or negative decimal indicating the geographic longitude of the address. |  |
| **distance** | **Float** | The distance from the input location to this exact zip code in miles. |  |

## Example

```ruby
require 'lob'

instance = Lob::LocationAnalysis.new(
  latitude: null,
  longitude: null,
  distance: null
)
```

