# Lob::Card

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;card_&#x60;. |  |
| **url** | **String** | The signed link for the card. |  |
| **auto_reorder** | **Boolean** | True if the cards should be auto-reordered. | [default to false] |
| **reorder_quantity** | **Integer** | The number of cards to be reordered. Only present when auto_reorder is True. | [optional] |
| **raw_url** | **String** | The raw URL of the card. | [optional] |
| **front_original_url** | **String** | The original URL of the front template. | [optional] |
| **back_original_url** | **String** | The original URL of the back template. | [optional] |
| **thumbnails** | [**Array&lt;Thumbnail&gt;**](Thumbnail.md) |  |  |
| **available_quantity** | **Integer** | The available quantity of cards. | [default to 0] |
| **pending_quantity** | **Integer** | The pending quantity of cards. | [default to 0] |
| **status** | **String** |  | [optional] |
| **orientation** | **String** | The orientation of the card. | [optional][default to &#39;horizontal&#39;] |
| **threshold_amount** | **Integer** | The threshold amount of the card | [optional][default to 0] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | object | [default to &#39;card&#39;] |
| **description** | **String** | Description of the card. | [optional] |
| **size** | **String** | The size of the card | [default to &#39;2.125x3.375&#39;] |

## Example

```ruby
require 'openapi_client'

instance = Lob::Card.new(
  id: null,
  url: null,
  auto_reorder: null,
  reorder_quantity: null,
  raw_url: null,
  front_original_url: null,
  back_original_url: null,
  thumbnails: null,
  available_quantity: null,
  pending_quantity: null,
  status: null,
  orientation: null,
  threshold_amount: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null,
  description: null,
  size: null
)
```

