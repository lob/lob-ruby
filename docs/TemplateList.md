# Lob::TemplateList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;Template&gt;**](Template.md) | list of templates | [optional] |
| **object** | **String** | Value is type of resource. | [optional] |
| **next_url** | **String** | url of next page of items in list. | [optional] |
| **previous_url** | **String** | url of previous page of items in list. | [optional] |
| **count** | **Integer** | number of resources in a set | [optional] |
| **total_count** | **Integer** | indicates the total number of records. Provided when the request specifies an \&quot;include\&quot; query parameter | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::TemplateList.new(
  data: null,
  object: null,
  next_url: null,
  previous_url: null,
  count: null,
  total_count: null
)
```

