# OpenapiClient::CardOrder

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;co_&#x60;. | [optional] |
| **card_id** | **String** | Unique identifier prefixed with &#x60;card_&#x60;. | [optional] |
| **status** | **String** | The status of the card order. | [optional] |
| **inventory** | **Float** | The inventory of the card order. | [optional][default to 0] |
| **quantity_ordered** | **Float** | The quantity of cards ordered | [optional][default to 0] |
| **unit_price** | **Float** | The unit price for the card order. | [optional][default to 0] |
| **cancelled_reason** | **String** | The reason for cancellation. | [optional] |
| **availability_date** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **expected_availability_date** | **Time** | The fixed deadline for the cards to be printed. | [optional] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is type of resource. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CardOrder.new(
  id: null,
  card_id: null,
  status: null,
  inventory: null,
  quantity_ordered: null,
  unit_price: null,
  cancelled_reason: null,
  availability_date: null,
  expected_availability_date: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null
)
```

