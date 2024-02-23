# Lob::AddressDomesticExpanded

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_line1** | **String** | The building number, street name, street suffix, and any street directionals. For US addresses, the max length is 64 characters. | [optional] |
| **address_line2** | **String** | The suite or apartment number of the recipient address, if applicable. For US addresses, the max length is 64 characters. | [optional] |
| **address_city** | **String** |  | [optional] |
| **address_state** | **String** |  | [optional] |
| **address_zip** | **String** | Optional postal code. For US addresses, must be either 5 or 9 digits. | [optional] |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **name** | **String** | Either &#x60;name&#x60; or &#x60;company&#x60; is required, you may also add both. Must be no longer than 40 characters. If both &#x60;name&#x60; and &#x60;company&#x60; are provided, they will be printed on two separate lines above the rest of the address.  | [optional] |
| **company** | **String** | Either &#x60;name&#x60; or &#x60;company&#x60; is required, you may also add both. | [optional] |
| **phone** | **String** | Must be no longer than 40 characters. | [optional] |
| **email** | **String** | Must be no longer than 100 characters. | [optional] |
| **address_country** | **String** | The country associated with this address. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::AddressDomesticExpanded.new(
  address_line1: null,
  address_line2: null,
  address_city: null,
  address_state: null,
  address_zip: null,
  description: null,
  name: null,
  company: null,
  phone: null,
  email: null,
  address_country: null,
  metadata: null
)
```

