# OpenapiClient::TemplateVersionUpdatable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **engine** | [**EngineHtml**](EngineHtml.md) |  | [optional][default to &#39;legacy&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TemplateVersionUpdatable.new(
  description: null,
  engine: null
)
```

