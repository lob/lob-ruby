# OpenapiClient::LetterDetailsWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_placement** | **String** | Specifies the location of the address information that will show through the double-window envelope.  | [optional][default to &#39;top_first_page&#39;] |
| **cards** | **Array&lt;String&gt;** | A single-element array containing an existing card id in a string format. See [cards](#tag/Cards) for more information. |  |
| **color** | **Boolean** | Set this key to &#x60;true&#x60; if you would like to print in color. Set to &#x60;false&#x60; if you would like to print in black and white. |  |
| **double_sided** | **Boolean** | Set this attribute to &#x60;true&#x60; for double sided printing, or &#x60;false&#x60; for for single sided printing. Defaults to &#x60;true&#x60;. | [optional][default to true] |
| **extra_service** | **String** | Add an extra service to your letter. | [optional] |
| **mail_type** | [**MailType**](MailType.md) |  | [optional][default to &#39;usps_first_class&#39;] |
| **return_envelope** | **Boolean** |  | [optional][default to false] |
| **custom_envelope** | **String** | Accepts an envelope ID for any customized envelope with available inventory. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::LetterDetailsWritable.new(
  address_placement: null,
  cards: null,
  color: null,
  double_sided: null,
  extra_service: null,
  mail_type: null,
  return_envelope: null,
  custom_envelope: null
)
```

