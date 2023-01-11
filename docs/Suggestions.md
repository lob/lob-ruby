# Lob::Suggestions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **primary_line** | **String** | The primary delivery line (usually the street address) of the address. Combination of the following applicable &#x60;components&#x60; (primary number &amp; secondary information may be missing or inaccurate): * &#x60;primary_number&#x60; * &#x60;street_predirection&#x60; * &#x60;street_name&#x60; * &#x60;street_suffix&#x60; * &#x60;street_postdirection&#x60; * &#x60;secondary_designator&#x60; * &#x60;secondary_number&#x60; * &#x60;pmb_designator&#x60; * &#x60;pmb_number&#x60;  |  |
| **city** | **String** |  |  |
| **state** | **String** | The [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) two letter code for the state.  |  |
| **zip_code** | **String** | A 5-digit zip code. Left empty if a test key is used. |  |
| **object** | **String** | Value is resource type. | [optional][default to &#39;us_autocompletion&#39;] |

## Example

```ruby
require 'openapi_client'

instance = Lob::Suggestions.new(
  primary_line: null,
  city: null,
  state: null,
  zip_code: null,
  object: null
)
```

