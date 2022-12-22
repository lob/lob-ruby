# OpenapiClient::UsAutocompletions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;us_auto_&#x60;. | [optional] |
| **suggestions** | [**Array&lt;Suggestions&gt;**](Suggestions.md) | An array of objects representing suggested addresses.  | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;us_autocompletion&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::UsAutocompletions.new(
  id: null,
  suggestions: null,
  object: null
)
```

