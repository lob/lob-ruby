# Lob::LetterDetailsReturned

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **color** | **Boolean** | Set this key to &#x60;true&#x60; if you would like to print in color, false for black and white. |  |
| **cards** | **Array&lt;String&gt;** | A single-element array containing an existing card id in a string format. See [cards](#tag/Cards) for more information. |  |
| **address_placement** | **String** | Specifies the location of the address information that will show through the double-window envelope.  | [optional][default to &#39;top_first_page&#39;] |
| **custom_envelope** | [**CustomEnvelopeReturned**](CustomEnvelopeReturned.md) |  | [optional] |
| **double_sided** | **Boolean** | Set this attribute to &#x60;true&#x60; for double sided printing,  &#x60;false&#x60; for for single sided printing. | [optional][default to true] |
| **extra_service** | **String** | Add an extra service to your letter. | [optional] |
| **mail_type** | [**MailType**](MailType.md) |  | [optional][default to &#39;usps_first_class&#39;] |
| **return_envelope** | [**AnyType**](.md) |  | [optional] |
| **bleed** | **Boolean** | Allows for letter bleed. Enabled only with specific feature flags. | [optional][default to false] |
| **file_original_url** | **String** |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::LetterDetailsReturned.new(
  color: null,
  cards: null,
  address_placement: null,
  custom_envelope: null,
  double_sided: null,
  extra_service: null,
  mail_type: null,
  return_envelope: null,
  bleed: null,
  file_original_url: null
)
```

