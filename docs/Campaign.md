# OpenapiClient::Campaign

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_group_id** | **String** | Unique identifier prefixed with &#x60;bg_&#x60;. | [optional] |
| **name** | **String** | Name of the campaign. |  |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **schedule_type** | [**CmpScheduleType**](CmpScheduleType.md) |  |  |
| **target_delivery_date** | **Time** | If &#x60;schedule_type&#x60; is &#x60;target_delivery_date&#x60;, provide a targeted delivery date for mail pieces in this campaign. | [optional] |
| **send_date** | **Time** | If &#x60;schedule_type&#x60; is &#x60;scheduled_send_date&#x60;, provide a date to send this campaign. | [optional] |
| **cancel_window_campaign_minutes** | **Integer** | A window, in minutes, within which the campaign can be canceled. | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **use_type** | [**CmpUseType**](CmpUseType.md) |  | [optional] |
| **auto_cancel_if_ncoa** | **Boolean** | Whether or not a mail piece should be automatically canceled and not sent if the address is updated via NCOA. |  |
| **id** | **String** | Unique identifier prefixed with &#x60;cmp_&#x60;. |  |
| **account_id** | **String** | Account ID that this campaign is associated with. | [optional] |
| **is_draft** | **Boolean** | Whether or not the campaign is still a draft. | [default to true] |
| **creatives** | [**Array&lt;CampaignCreative&gt;**](CampaignCreative.md) | An array of creatives that have been associated with this campaign. |  |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is resource type. | [default to &#39;campaign&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::Campaign.new(
  billing_group_id: null,
  name: null,
  description: null,
  schedule_type: null,
  target_delivery_date: null,
  send_date: null,
  cancel_window_campaign_minutes: null,
  metadata: null,
  use_type: null,
  auto_cancel_if_ncoa: null,
  id: null,
  account_id: null,
  is_draft: null,
  creatives: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null
)
```

