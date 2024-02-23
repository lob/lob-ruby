# Lob::BuckslipDeletion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;bck_&#x60;. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::BuckslipDeletion.new(
  id: null,
  deleted: null
)
```

