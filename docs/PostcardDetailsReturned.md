# Lob::PostcardDetailsReturned

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mail_type** | [**MailType**](MailType.md) |  | [optional][default to &#39;usps_first_class&#39;] |
| **size** | [**PostcardSize**](PostcardSize.md) |  | [optional][default to &#39;4x6&#39;] |
| **setting** | **Integer** |  | [optional][default to 1001] |
| **front_original_url** | **String** | The original URL of the front template. | [optional] |
| **back_original_url** | **String** | The original URL of the back template. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::PostcardDetailsReturned.new(
  mail_type: null,
  size: null,
  setting: null,
  front_original_url: null,
  back_original_url: null
)
```

