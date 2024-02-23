# Lob::RequiredAddressColumnMapping

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **name** | **String** | The column header from the csv file that should be mapped to the required field &#x60;name&#x60; | [default to &#39;null&#39;] |
| **address_line1** | **String** | The column header from the csv file that should be mapped to the required field &#x60;address_line1&#x60; | [default to &#39;null&#39;] |
| **address_city** | **String** | The column header from the csv file that should be mapped to the required field &#x60;address_city&#x60; | [default to &#39;null&#39;] |
| **address_state** | **String** | The column header from the csv file that should be mapped to the required field &#x60;address_state&#x60; | [default to &#39;null&#39;] |
| **address_zip** | **String** | The column header from the csv file that should be mapped to the required field &#x60;address_zip&#x60; | [default to &#39;null&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::RequiredAddressColumnMapping.new(
  name: null,
  address_line1: null,
  address_city: null,
  address_state: null,
  address_zip: null
)
```

