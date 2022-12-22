# OpenapiClient::UsVerificationOrError

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;us_ver_&#x60;. | [optional] |
| **recipient** | **String** | The intended recipient, typically a person&#39;s or firm&#39;s name. | [optional] |
| **primary_line** | **String** | The primary delivery line (usually the street address) of the address. Combination of the following applicable &#x60;components&#x60;: * &#x60;primary_number&#x60; * &#x60;street_predirection&#x60; * &#x60;street_name&#x60; * &#x60;street_suffix&#x60; * &#x60;street_postdirection&#x60; * &#x60;secondary_designator&#x60; * &#x60;secondary_number&#x60; * &#x60;pmb_designator&#x60; * &#x60;pmb_number&#x60;  | [optional] |
| **secondary_line** | **String** | The secondary delivery line of the address. This field is typically empty but may contain information if &#x60;primary_line&#x60; is too long.  | [optional] |
| **urbanization** | **String** | Only present for addresses in Puerto Rico. An urbanization refers to an area, sector, or development within a city. See [USPS documentation](https://pe.usps.com/text/pub28/28api_008.htm#:~:text&#x3D;I51.,-4%20Urbanizations&amp;text&#x3D;In%20Puerto%20Rico%2C%20identical%20street,placed%20before%20the%20urbanization%20name.) for clarification.  | [optional] |
| **last_line** | **String** |  | [optional] |
| **deliverability** | **String** |  | [optional] |
| **components** | [**UsComponents**](UsComponents.md) |  | [optional] |
| **deliverability_analysis** | [**DeliverabilityAnalysis**](DeliverabilityAnalysis.md) |  | [optional] |
| **lob_confidence_score** | [**LobConfidenceScore**](LobConfidenceScore.md) |  | [optional] |
| **object** | **String** |  | [optional][default to &#39;us_verification&#39;] |
| **error** | [**BulkError**](BulkError.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UsVerificationOrError.new(
  id: null,
  recipient: null,
  primary_line: null,
  secondary_line: null,
  urbanization: null,
  last_line: null,
  deliverability: null,
  components: null,
  deliverability_analysis: null,
  lob_confidence_score: null,
  object: null,
  error: null
)
```

