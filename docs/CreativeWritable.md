# OpenapiClient::CreativeWritable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. |  |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **resource_type** | **String** | Mailpiece type for the creative |  |
| **campaign_id** | **String** | Unique identifier prefixed with &#x60;cmp_&#x60;. |  |
| **details** | [**AnyType**](.md) | Either PostcardDetailsWritable or LetterDetailsWritable | [optional] |
| **file** | **String** | PDF file containing the letter&#39;s formatting. Do not include for resource_type &#x3D; postcard. | [optional] |
| **front** | **String** | The artwork to use as the front of your postcard. Do not include for resource_type &#x3D; letter.  | [optional] |
| **back** | **String** | The artwork to use as the back of your postcard. Do not include for resource_type &#x3D; letter.  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::CreativeWritable.new(
  from: null,
  description: null,
  metadata: null,
  resource_type: null,
  campaign_id: null,
  details: null,
  file: null,
  front: null,
  back: null
)
```

