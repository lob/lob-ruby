# OpenapiClient::CreativeResponse

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;crv_&#x60;. | [optional] |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **from** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. | [optional] |
| **resource_type** | **String** | Mailpiece type for the creative | [optional] |
| **details** | [**AnyType**](.md) | Either PostcardDetailsReturned or LetterDetailsReturned | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **template_preview_urls** | **Object** | Preview URLs associated with a creative&#39;s artwork asset(s) if the creative uses HTML templates as assets. | [optional] |
| **template_previews** | **Array&lt;Object&gt;** | A list of template preview objects if the creative uses HTML template(s) as artwork asset(s). | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **campaigns** | [**Array&lt;Campaign&gt;**](Campaign.md) | Array of campaigns associated with the creative ID | [optional] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;creative&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CreativeResponse.new(
  id: null,
  description: null,
  from: null,
  resource_type: null,
  details: null,
  metadata: null,
  template_preview_urls: null,
  template_previews: null,
  deleted: null,
  campaigns: null,
  date_created: null,
  date_modified: null,
  object: null
)
```

