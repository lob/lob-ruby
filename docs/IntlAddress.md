# Lob::IntlAddress

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;adr_&#x60;. | [optional] |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **name** | **String** | name associated with address | [optional] |
| **company** | **String** | Either &#x60;name&#x60; or &#x60;company&#x60; is required, you may also add both. | [optional] |
| **phone** | **String** | Must be no longer than 40 characters. | [optional] |
| **email** | **String** | Must be no longer than 100 characters. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **address_line1** | **String** |  | [optional] |
| **address_line2** | **String** |  | [optional] |
| **address_city** | **String** |  | [optional] |
| **address_state** | **String** | 2 letter state short-name code | [optional] |
| **address_zip** | **String** | Must have a maximum of 12 characters  | [optional] |
| **address_country** | [**CountryExtendedExpandedNoUs**](CountryExtendedExpandedNoUs.md) |  | [optional] |
| **object** | **String** |  | [optional][default to &#39;address&#39;] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **inline** | **Boolean** | Checks if address id is used or not | [optional] |
| **recipient_moved** | **Boolean** | Only returned for accounts on certain &lt;a href&#x3D;\&quot;https://dashboard.lob.com/#/settings/editions\&quot;&gt;Print &amp;amp; Mail Editions&lt;/a&gt;. Value is &#x60;true&#x60; if the address was altered because the recipient filed for a &lt;a href&#x3D;\&quot;#ncoa\&quot;&gt;National Change of Address (NCOA)&lt;/a&gt;, &#x60;false&#x60; if the NCOA check was run but no altered address was found, and &#x60;null&#x60; if the NCOA check was not run. The NCOA check does not happen for non-US addresses, for non-deliverable US addresses, or for addresses created before the NCOA feature was added to your account.  | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::IntlAddress.new(
  id: null,
  description: null,
  name: null,
  company: null,
  phone: null,
  email: null,
  metadata: null,
  address_line1: null,
  address_line2: null,
  address_city: null,
  address_state: null,
  address_zip: null,
  address_country: null,
  object: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  inline: null,
  recipient_moved: null
)
```

