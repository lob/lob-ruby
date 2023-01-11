# Lob::EventType

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** |  |  |
| **enabled_for_test** | **Boolean** | Value is &#x60;true&#x60; if the event type is enabled in both the test and live environments. |  |
| **resource** | **String** |  |  |
| **object** | **String** | Value is resource type. | [default to &#39;event_type&#39;] |

## Example

```ruby
require 'openapi_client'

instance = Lob::EventType.new(
  id: null,
  enabled_for_test: null,
  resource: null,
  object: null
)
```

