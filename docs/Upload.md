# Lob::Upload

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;upl_&#x60;. |  |
| **account_id** | **String** | Account ID that made the request |  |
| **mode** | **String** | The environment in which the mailpieces were created. Today, will only be &#x60;live&#x60;. |  |
| **campaign_id** | **String** | Campaign ID associated with the upload |  |
| **failures_url** | **String** | Url where your campaign mailpiece failures can be retrieved | [optional] |
| **original_filename** | **String** | Filename of the upload | [optional] |
| **state** | [**UploadState**](UploadState.md) |  | [default to &#39;Draft&#39;] |
| **total_mailpieces** | **Integer** | Total number of recipients for the campaign |  |
| **failed_mailpieces** | **Integer** | Number of mailpieces that failed to create |  |
| **validated_mailpieces** | **Integer** | Number of mailpieces that were successfully created |  |
| **bytes_processed** | **Integer** | Number of bytes processed in your CSV |  |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the upload was created |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the upload was last modified |  |
| **required_address_column_mapping** | [**RequiredAddressColumnMapping**](RequiredAddressColumnMapping.md) |  |  |
| **optional_address_column_mapping** | [**OptionalAddressColumnMapping**](OptionalAddressColumnMapping.md) |  |  |
| **metadata** | [**UploadsMetadata**](UploadsMetadata.md) |  |  |
| **merge_variable_column_mapping** | **Object** | The mapping of column headers in your file to the merge variables present in your creative. See our &lt;a href&#x3D;\&quot;https://help.lob.com/print-and-mail/building-a-mail-strategy/campaign-or-triggered-sends/campaign-audience-guide#step-3-map-merge-variable-data-if-applicable-7\&quot; target&#x3D;\&quot;_blank\&quot;&gt;Campaign Audience Guide&lt;/a&gt; for additional details. &lt;br /&gt;If a merge variable has the same \&quot;name\&quot; as a \&quot;key\&quot; in the &#x60;requiredAddressColumnMapping&#x60; or &#x60;optionalAddressColumnMapping&#x60; objects, then they **CANNOT** have a different value in this object. If a different value is provided, then when the campaign is processing it will get overwritten with the mapped value present in the &#x60;requiredAddressColumnMapping&#x60; or &#x60;optionalAddressColumnMapping&#x60; objects. |  |

## Example

```ruby
require 'lob'

instance = Lob::Upload.new(
  id: null,
  account_id: fa9ea650fc7b31a89f92,
  mode: null,
  campaign_id: null,
  failures_url: null,
  original_filename: null,
  state: null,
  total_mailpieces: null,
  failed_mailpieces: null,
  validated_mailpieces: null,
  bytes_processed: null,
  date_created: null,
  date_modified: null,
  required_address_column_mapping: null,
  optional_address_column_mapping: null,
  metadata: null,
  merge_variable_column_mapping: {&quot;name&quot;:&quot;recipient_name&quot;,&quot;gift_code&quot;:&quot;code&quot;}
)
```

