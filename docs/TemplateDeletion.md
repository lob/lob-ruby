# OpenapiClient::TemplateDeletion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;tmpl_&#x60;. ID of a saved [HTML template](#section/HTML-Templates). | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is type of resource. | [optional][default to &#39;template_deleted&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TemplateDeletion.new(
  id: null,
  deleted: null,
  object: null
)
```

