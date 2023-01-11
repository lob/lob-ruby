# Lob::CardOrderList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;CardOrder&gt;**](CardOrder.md) | list of card orders | [optional] |
| **object** | **String** | Value is type of resource. | [optional] |
| **next_url** | **String** | url of next page of items in list. | [optional] |
| **previous_url** | **String** | url of previous page of items in list. | [optional] |
| **count** | **Integer** | number of resources in a set | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::CardOrderList.new(
  data: null,
  object: null,
  next_url: null,
  previous_url: null,
  count: null
)
```

