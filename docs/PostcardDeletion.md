# Lob::PostcardDeletion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;psc_&#x60;. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is type of resource. | [optional][default to &#39;postcard_deleted&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::PostcardDeletion.new(
  id: null,
  deleted: null,
  object: null
)
```

