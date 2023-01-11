# Lob::CheckDeletion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;chk_&#x60;. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is type of resource. | [optional][default to &#39;check_deleted&#39;] |

## Example

```ruby
require 'openapi_client'

instance = Lob::CheckDeletion.new(
  id: null,
  deleted: null,
  object: null
)
```

