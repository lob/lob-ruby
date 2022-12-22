# OpenapiClient::Export

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;ex_&#x60;. |  |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the export was created |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the export was last modified |  |
| **deleted** | **Boolean** | Returns as &#x60;true&#x60; if the resource has been successfully deleted. |  |
| **s3_url** | **String** | The URL for the generated export file. | [optional] |
| **state** | **String** | The state of the export file, which can be &#x60;in_progress&#x60;, &#x60;failed&#x60; or &#x60;succeeded&#x60;. |  |
| **type** | **String** | The export file type, which can be &#x60;all&#x60;, &#x60;failures&#x60; or &#x60;successes&#x60;. |  |
| **upload_id** | **String** | Unique identifier prefixed with &#x60;upl_&#x60;. |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Export.new(
  id: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  s3_url: null,
  state: null,
  type: null,
  upload_id: null
)
```

