# Lob::BillingGroup

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | Description of the billing group. | [optional] |
| **name** | **String** | Name of the billing group. |  |
| **id** | **String** | Unique identifier prefixed with &#x60;bg_&#x60;. |  |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **object** | **String** | Value is resource type. | [default to &#39;billing_group&#39;] |

## Example

```ruby
require 'lob'

instance = Lob::BillingGroup.new(
  description: null,
  name: null,
  id: null,
  date_created: null,
  date_modified: null,
  object: null
)
```

