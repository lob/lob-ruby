# OpenapiClient::IntlVerification

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;intl_ver_&#x60;. | [optional] |
| **recipient** | **String** | The intended recipient, typically a person&#39;s or firm&#39;s name. | [optional] |
| **primary_line** | **String** | The primary delivery line (usually the street address) of the address.  | [optional] |
| **secondary_line** | **String** | The secondary delivery line of the address. This field is typically empty but may contain information if &#x60;primary_line&#x60; is too long.  | [optional] |
| **last_line** | **String** | Combination of the following applicable &#x60;components&#x60;: * &#x60;city&#x60; * &#x60;state&#x60; * &#x60;zip_code&#x60; * &#x60;zip_code_plus_4&#x60;  | [optional] |
| **country** | **String** | The country of the address. Will be returned as a 2 letter country short-name code (ISO 3166). | [optional] |
| **coverage** | **String** | The coverage level for the country. This represents the maximum level of accuracy an input address can be verified to.  * &#x60;SUBBUILDING&#x60; - Coverage down to unit numbers. For example, in an apartment or a large building * &#x60;HOUSENUMBER/BUILDING&#x60; - Coverage down to house number. For example, the address where a house or building may be located * &#x60;STREET&#x60; - Coverage down to street. This means that we can verify that an street exists in a city, state, country * &#x60;LOCALITY&#x60; - Coverage down to city, state, or village or province. This means that we can verify that a city, village, province, or state exists in a country. Countries differ in how they define what is a province, state, city, village, etc. This attempts to group eveyrthing together. * &#x60;SPARSE&#x60; - Some addresses for this country exist in our databases  | [optional] |
| **deliverability** | **String** | Summarizes the deliverability of the &#x60;intl_verification&#x60; object. Possible values are: * &#x60;deliverable&#x60; — The address is deliverable. * &#x60;deliverable_missing_info&#x60; — The address is missing some information, but is most likely deliverable. * &#x60;undeliverable&#x60; — The address is most likely not deliverable. Some components of the address (such as city or postal code) may have been found. * &#x60;no_match&#x60; — This address is not deliverable. No matching street could be found within the city or postal code.  | [optional] |
| **status** | **String** | The status level for the country. This represents the maximum level of accuracy an input address can be verified to.  * &#x60;LV4&#x60; - Verified. The input data is correct. All input data was able to match in databases. * &#x60;LV3&#x60; - Verified. The input data is correct. All input data was able to match in databases &lt;em&gt;after&lt;/em&gt; some or all elements were standarized. The input data may also be using outdated city, state, or country names. * &#x60;LV2&#x60; - Verified. The input data is correct although some input data is unverifiable due to incomplete data. * &#x60;LV1&#x60; - Verified. The input data is acceptable but in an attempt to standarize user input, errors were introduced. * &#x60;LF4&#x60; - Fixed. The input data is matched and fixed. (Example: Brighon, UK -&gt; Brighton, UK) * &#x60;LF3&#x60; - Fixed. The input data is matched and fixed but some elements such as Subbuilding number and house number cannot be checked. * &#x60;LF2&#x60; - Fixed. The input data is matched but some elements such as Street cannot be checked. * &#x60;LF1&#x60; - Fixed. The input data is acceptable but in an attempt to standarize user input, errors were introduced. * &#x60;LM4&#x60; - Missing Info. The input data cannot be corrected completely. * &#x60;LM3&#x60; - Missing Info. The input data cannot be corrected completely and there were multiple matches found in databases. * &#x60;LM2&#x60; - Missing Info. The input data cannot be corrected completely and only some elements were found. * &#x60;LU1&#x60; - Unverified. The input data cannot be corrected or matched.  | [optional] |
| **components** | [**IntlComponents**](IntlComponents.md) |  | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;intl_verification&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::IntlVerification.new(
  id: null,
  recipient: null,
  primary_line: null,
  secondary_line: null,
  last_line: null,
  country: null,
  coverage: null,
  deliverability: null,
  status: null,
  components: null,
  object: null
)
```

