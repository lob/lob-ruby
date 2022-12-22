# OpenapiClient::PlaceholderModel

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **return_envelope** | [**ReturnEnvelope**](ReturnEnvelope.md) |  | [optional] |
| **address_domestic** | [**AddressDomestic**](AddressDomestic.md) |  | [optional] |
| **letter_details_writable** | [**LetterDetailsWritable**](LetterDetailsWritable.md) |  | [optional] |
| **postcard_details_writable** | [**PostcardDetailsWritable**](PostcardDetailsWritable.md) |  | [optional] |
| **letter_details_returned** | [**LetterDetailsReturned**](LetterDetailsReturned.md) |  | [optional] |
| **postcard_details_returned** | [**PostcardDetailsReturned**](PostcardDetailsReturned.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::PlaceholderModel.new(
  return_envelope: null,
  address_domestic: null,
  letter_details_writable: null,
  postcard_details_writable: null,
  letter_details_returned: null,
  postcard_details_returned: null
)
```

