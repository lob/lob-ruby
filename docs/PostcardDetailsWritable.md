# OpenapiClient::PostcardDetailsWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **mail_type** | [**MailType**](MailType.md) |  | [optional][default to &#39;usps_first_class&#39;] |
| **size** | [**PostcardSize**](PostcardSize.md) |  | [optional][default to &#39;4x6&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PostcardDetailsWritable.new(
  mail_type: null,
  size: null
)
```

