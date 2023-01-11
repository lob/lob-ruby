# Lob::CardUpdatable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Description of the card. | [optional] |
| **auto_reorder** | **Boolean** | Allows for auto reordering | [optional] |
| **reorder_quantity** | **Float** | The quantity of items to be reordered (only required when auto_reorder is true). | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::CardUpdatable.new(
  description: null,
  auto_reorder: null,
  reorder_quantity: null
)
```

