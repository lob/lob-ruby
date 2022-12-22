# OpenapiClient::Buckslip

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;bck_&#x60;. |  |
| **auto_reorder** | **Boolean** | True if the buckslips should be auto-reordered. | [default to false] |
| **reorder_quantity** | **Integer** | The number of buckslips to be reordered. |  |
| **threshold_amount** | **Integer** | The threshold amount of the buckslip | [default to 0] |
| **url** | **String** | The signed link for the buckslip. |  |
| **raw_url** | **String** | The raw URL of the buckslip. |  |
| **front_original_url** | **String** | The original URL of the front template. |  |
| **back_original_url** | **String** | The original URL of the back template. |  |
| **thumbnails** | [**Array&lt;Thumbnail&gt;**](Thumbnail.md) |  |  |
| **available_quantity** | **Float** | The available quantity of buckslips. | [default to 0] |
| **allocated_quantity** | **Float** | The allocated quantity of buckslips. | [default to 0] |
| **onhand_quantity** | **Float** | The onhand quantity of buckslips. | [default to 0] |
| **pending_quantity** | **Float** | The pending quantity of buckslips. | [default to 0] |
| **projected_quantity** | **Float** | The sum of pending and onhand quantities of buckslips. | [default to 0] |
| **buckslip_orders** | [**Array&lt;BuckslipOrder&gt;**](BuckslipOrder.md) | An array of buckslip orders that are associated with the buckslip. |  |
| **stock** | **String** |  |  |
| **weight** | **String** |  |  |
| **finish** | **String** |  |  |
| **status** | **String** |  |  |
| **object** | **String** | object | [default to &#39;buckslip&#39;] |
| **description** | **String** | Description of the buckslip. |  |
| **size** | **String** | The size of the buckslip | [optional][default to &#39;8.75x3.75&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Buckslip.new(
  id: null,
  auto_reorder: null,
  reorder_quantity: null,
  threshold_amount: null,
  url: null,
  raw_url: null,
  front_original_url: null,
  back_original_url: null,
  thumbnails: null,
  available_quantity: null,
  allocated_quantity: null,
  onhand_quantity: null,
  pending_quantity: null,
  projected_quantity: null,
  buckslip_orders: null,
  stock: null,
  weight: null,
  finish: null,
  status: null,
  object: null,
  description: null,
  size: null
)
```

