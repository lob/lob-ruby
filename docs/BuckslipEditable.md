# Lob::BuckslipEditable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **front** | **String** | A PDF template for the front of the buckslip |  |
| **back** | **String** | A PDF template for the back of the buckslip | [optional] |
| **description** | **String** | Description of the buckslip. | [optional] |
| **size** | **String** | The size of the buckslip | [optional][default to &#39;8.75x3.75&#39;] |

## Example

```ruby
require 'openapi_client'

instance = Lob::BuckslipEditable.new(
  front: null,
  back: null,
  description: null,
  size: null
)
```

