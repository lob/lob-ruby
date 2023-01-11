# Lob::Upload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;upl_&#x60;. |  |
| **account_id** | **String** | Account ID that made the request |  |
| **campaign_id** | **String** | Unique identifier prefixed with &#x60;cmp_&#x60;. |  |
| **mode** | **String** | The environment in which the mailpieces were created. Today, will only be &#x60;live&#x60;. |  |
| **failures_url** | **String** | Url where your campaign mailpiece failures can be retrieved | [optional] |
| **original_filename** | **String** | Filename of the upload | [optional] |
| **state** | [**UploadState**](UploadState.md) |  | [default to &#39;Draft&#39;] |
| **total_mailpieces** | **Integer** | Total number of recipients for the campaign |  |
| **failed_mailpieces** | **Integer** | Number of mailpieces that failed to create |  |
| **validated_mailpieces** | **Integer** | Number of mailpieces that were successfully created |  |
| **bytes_processed** | **Integer** | Number of bytes processed in your CSV |  |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the upload was created |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the upload was last modified |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::Upload.new(
  id: null,
  account_id: null,
  campaign_id: null,
  mode: null,
  failures_url: null,
  original_filename: null,
  state: null,
  total_mailpieces: null,
  failed_mailpieces: null,
  validated_mailpieces: null,
  bytes_processed: null,
  date_created: null,
  date_modified: null,
  deleted: null
)
```

