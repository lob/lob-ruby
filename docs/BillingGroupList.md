# OpenapiClient::BillingGroupList

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **data** | [**Array&lt;BillingGroup&gt;**](BillingGroup.md) | list of billing groups | [optional] |
| **object** | **String** | Value is type of resource. | [optional] |
| **next_url** | **String** | url of next page of items in list. | [optional] |
| **previous_url** | **String** | url of previous page of items in list. | [optional] |
| **count** | **Integer** | number of resources in a set | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::BillingGroupList.new(
  data: null,
  object: null,
  next_url: null,
  previous_url: null,
  count: null
)
```

