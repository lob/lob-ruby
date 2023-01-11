# Lob::CardEditable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **front** | **String** | A PDF template for the front of the card |  |
| **back** | **String** | A PDF template for the back of the card | [optional][default to &#39;https://s3.us-west-2.amazonaws.com/public.lob.com/assets/card_blank_horizontal.pdf&#39;] |
| **size** | **String** | The size of the card | [optional][default to &#39;2.125x3.375&#39;] |
| **description** | **String** | Description of the card. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::CardEditable.new(
  front: null,
  back: null,
  size: null,
  description: null
)
```

