# Lob::IdentityValidation

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;id_validation_&#x60;. | [optional] |
| **recipient** | **String** | The intended recipient, typically a person&#39;s or firm&#39;s name. | [optional] |
| **primary_line** | **String** | The primary delivery line (usually the street address) of the address. Combination of the following applicable &#x60;components&#x60;: * &#x60;primary_number&#x60; * &#x60;street_predirection&#x60; * &#x60;street_name&#x60; * &#x60;street_suffix&#x60; * &#x60;street_postdirection&#x60; * &#x60;secondary_designator&#x60; * &#x60;secondary_number&#x60; * &#x60;pmb_designator&#x60; * &#x60;pmb_number&#x60;  | [optional] |
| **secondary_line** | **String** | The secondary delivery line of the address. This field is typically empty but may contain information if &#x60;primary_line&#x60; is too long.  | [optional] |
| **urbanization** | **String** | Only present for addresses in Puerto Rico. An urbanization refers to an area, sector, or development within a city. See [USPS documentation](https://pe.usps.com/text/pub28/28api_008.htm#:~:text&#x3D;I51.,-4%20Urbanizations&amp;text&#x3D;In%20Puerto%20Rico%2C%20identical%20street,placed%20before%20the%20urbanization%20name.) for clarification.  | [optional] |
| **last_line** | **String** | Combination of the following applicable &#x60;components&#x60;: * City (&#x60;city&#x60;) * State (&#x60;state&#x60;) * ZIP code (&#x60;zip_code&#x60;) * ZIP+4 (&#x60;zip_code_plus_4&#x60;)  | [optional] |
| **score** | **Float** | A numerical score between 0 and 100 that represents the likelihood the provided name is associated with a physical address.  | [optional] |
| **confidence** | **String** | Indicates the likelihood the recipient name and address match based on our custom internal calculation. Possible values are: - &#x60;high&#x60; — Has a Lob confidence score greater than 70. - &#x60;medium&#x60; — Has a Lob confidence score between 40 and 70. - &#x60;low&#x60; — Has a Lob confidence score less than 40. - &#x60;\&quot;\&quot;&#x60; — No tracking data exists for this address.  | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;id_validation&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::IdentityValidation.new(
  id: null,
  recipient: null,
  primary_line: null,
  secondary_line: null,
  urbanization: null,
  last_line: null,
  score: null,
  confidence: null,
  object: null
)
```

