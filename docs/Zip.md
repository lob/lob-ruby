# OpenapiClient::Zip

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **zip_code** | **String** | A 5-digit ZIP code. | [optional] |
| **id** | **String** | Unique identifier prefixed with &#x60;us_zip_&#x60;. |  |
| **cities** | [**Array&lt;ZipLookupCity&gt;**](ZipLookupCity.md) | An array of city objects containing valid cities for the &#x60;zip_code&#x60;. Multiple cities will be returned if more than one city is associated with the input ZIP code.  |  |
| **zip_code_type** | [**ZipCodeType**](ZipCodeType.md) |  |  |
| **object** | **String** |  | [default to &#39;us_zip_lookup&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Zip.new(
  zip_code: null,
  id: null,
  cities: null,
  zip_code_type: null,
  object: null
)
```

