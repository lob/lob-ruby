# Lob::BankAccount

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **routing_number** | **String** | Must be a [valid US routing number](https://www.frbservices.org/index.html). |  |
| **account_number** | **String** |  |  |
| **account_type** | **String** | The type of entity that holds the account. |  |
| **signatory** | **String** | The signatory associated with your account. This name will be printed on checks created with this bank account. If you prefer to use a custom signature image on your checks instead, please create your bank account from the [Dashboard](https://dashboard.lob.com/#/login). |  |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **id** | **String** | Unique identifier prefixed with &#x60;bank_&#x60;. |  |
| **signature_url** | **String** | A signed link to the signature image. will be generated. | [optional] |
| **bank_name** | **String** | The name of the bank based on the provided routing number, e.g. &#x60;JPMORGAN CHASE BANK&#x60;. | [optional] |
| **verified** | **Boolean** | A bank account must be verified before a check can be created. | [optional][default to false] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** |  | [default to &#39;bank_account&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::BankAccount.new(
  description: null,
  routing_number: null,
  account_number: null,
  account_type: null,
  signatory: null,
  metadata: null,
  id: null,
  signature_url: null,
  bank_name: null,
  verified: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null
)
```

