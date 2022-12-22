# OpenapiClient::BuckslipOrder

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is type of resource. |  |
| **id** | **String** | Unique identifier prefixed with &#x60;bo_&#x60;. | [optional] |
| **buckslip_id** | **String** | Unique identifier prefixed with &#x60;bck_&#x60;. | [optional] |
| **status** | **String** | The status of the buckslip order. | [optional] |
| **quantity_ordered** | **Float** | The quantity of buckslips ordered. | [optional][default to 0] |
| **unit_price** | **Float** | The unit price for the buckslip order. | [optional][default to 0] |
| **inventory** | **Float** | The inventory of the buckslip order. | [optional][default to 0] |
| **cancelled_reason** | **String** | The reason for cancellation. | [optional] |
| **availability_date** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **expected_availability_date** | **Time** | The fixed deadline for the buckslips to be printed. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BuckslipOrder.new(
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null,
  id: null,
  buckslip_id: null,
  status: null,
  quantity_ordered: null,
  unit_price: null,
  inventory: null,
  cancelled_reason: null,
  availability_date: null,
  expected_availability_date: null
)
```

