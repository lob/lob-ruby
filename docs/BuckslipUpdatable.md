# Lob::BuckslipUpdatable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Description of the buckslip. | [optional] |
| **auto_reorder** | **Boolean** | Allows for auto reordering | [optional] |
| **reorder_quantity** | **Float** | The quantity of items to be reordered (only required when auto_reorder is true). | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::BuckslipUpdatable.new(
  description: null,
  auto_reorder: null,
  reorder_quantity: null
)
```

