# Lob::CampaignDeletion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;cmp_&#x60;. | [optional] |
| **deleted** | **Boolean** | True if the resource has been successfully deleted. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::CampaignDeletion.new(
  id: null,
  deleted: null
)
```

