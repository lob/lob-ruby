# Lob::IntlAutocompletions

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;intl_auto_&#x60;. | [optional] |
| **suggestions** | [**Array&lt;IntlSuggestions&gt;**](IntlSuggestions.md) | An array of objects representing suggested addresses.  | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::IntlAutocompletions.new(
  id: null,
  suggestions: null
)
```

