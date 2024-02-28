# Lob::OptionalAddressColumnMapping

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_line2** | **String** | The column header from the csv file that should be mapped to the optional field \&quot;address_line2\&quot; | [default to &#39;null&#39;] |
| **company** | **String** | The column header from the csv file that should be mapped to the optional field \&quot;company\&quot; | [default to &#39;null&#39;] |
| **address_country** | **String** | The column header from the csv file that should be mapped to the optional field \&quot;address_country\&quot; | [default to &#39;null&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::OptionalAddressColumnMapping.new(
  address_line2: null,
  company: null,
  address_country: null
)
```

