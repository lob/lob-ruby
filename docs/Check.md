# Lob::Check

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;chk_&#x60;. |  |
| **to** | [**Address**](Address.md) |  |  |
| **from** | [**Address**](Address.md) |  | [optional] |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **merge_variables** | **Object** | You can input a merge variable payload object to your template to render dynamic content. For example, if you have a template like: &#x60;{{variable_name}}&#x60;, pass in &#x60;{\&quot;variable_name\&quot;: \&quot;Harry\&quot;}&#x60; to render &#x60;Harry&#x60;. &#x60;merge_variables&#x60; must be an object. Any type of value is accepted as long as the object is valid JSON; you can use &#x60;strings&#x60;, &#x60;numbers&#x60;, &#x60;booleans&#x60;, &#x60;arrays&#x60;, &#x60;objects&#x60;, or &#x60;null&#x60;. The max length of the object is 25,000 characters. If you call &#x60;JSON.stringify&#x60; on your object, it can be no longer than 25,000 characters. Your variable names cannot contain any whitespace or any of the following special characters: &#x60;!&#x60;, &#x60;\&quot;&#x60;, &#x60;#&#x60;, &#x60;%&#x60;, &#x60;&amp;&#x60;, &#x60;&#39;&#x60;, &#x60;(&#x60;, &#x60;)&#x60;, &#x60;*&#x60;, &#x60;+&#x60;, &#x60;,&#x60;, &#x60;/&#x60;, &#x60;;&#x60;, &#x60;&lt;&#x60;, &#x60;&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;@&#x60;, &#x60;[&#x60;, &#x60;\\&#x60;, &#x60;]&#x60;, &#x60;^&#x60;, &#x60;&#x60; &#x60; &#x60;&#x60;, &#x60;{&#x60;, &#x60;|&#x60;, &#x60;}&#x60;, &#x60;~&#x60;. More instructions can be found in [our guide to using html and merge variables](https://lob.com/resources/guides/general/using-html-and-merge-variables). Depending on your [Merge Variable strictness](https://dashboard.lob.com/#/settings/account) setting, if you define variables in your HTML but do not pass them here, you will either receive an error or the variable will render as an empty string. | [optional] |
| **send_date** | **Time** | A timestamp in ISO 8601 format which specifies a date after the current time and up to 180 days in the future to send the letter off for production. Setting a send date overrides the default [cancellation window](#section/Cancellation-Windows) applied to the mailpiece. Until the &#x60;send_date&#x60; has passed, the mailpiece can be canceled. If a date in the format &#x60;2017-11-01&#x60; is passed, it will evaluate to midnight UTC of that date (&#x60;2017-11-01T00:00:00.000Z&#x60;). If a datetime is passed, that exact time will be used. A &#x60;send_date&#x60; passed with no time zone will default to UTC, while a &#x60;send_date&#x60; passed with a time zone will be converted to UTC. | [optional] |
| **mail_type** | **String** | Checks must be sent &#x60;usps_first_class&#x60; | [optional][default to &#39;usps_first_class&#39;] |
| **memo** | **String** | Text to include on the memo line of the check. | [optional] |
| **check_number** | **Integer** | An integer that designates the check number. If &#x60;check_number&#x60; is not provided, checks created from a new &#x60;bank_account&#x60; will start at &#x60;10000&#x60; and increment with each check created with the &#x60;bank_account&#x60;. A provided &#x60;check_number&#x60; overrides the defaults. Subsequent checks created with the same &#x60;bank_account&#x60; will increment from the provided check number. | [optional] |
| **message** | **String** | Max of 400 characters to be included at the bottom of the check page. | [optional] |
| **amount** | **Float** | The payment amount to be sent in US dollars. |  |
| **bank_account** | [**BankAccount**](BankAccount.md) |  |  |
| **check_bottom_template_id** | **String** | Unique identifier prefixed with &#x60;tmpl_&#x60;. ID of a saved [HTML template](#section/HTML-Templates). | [optional] |
| **attachment_template_id** | **String** | Unique identifier prefixed with &#x60;tmpl_&#x60;. ID of a saved [HTML template](#section/HTML-Templates). | [optional] |
| **check_bottom_template_version_id** | **String** | Unique identifier prefixed with &#x60;vrsn_&#x60;. | [optional] |
| **attachment_template_version_id** | **String** | Unique identifier prefixed with &#x60;vrsn_&#x60;. | [optional] |
| **url** | **String** | A [signed link](#section/Asset-URLs) served over HTTPS. The link returned will expire in 30 days to prevent mis-sharing. Each time a GET request is initiated, a new signed URL will be generated. |  |
| **carrier** | **String** |  | [default to &#39;USPS&#39;] |
| **thumbnails** | [**Array&lt;Thumbnail&gt;**](Thumbnail.md) |  | [optional] |
| **expected_delivery_date** | **Date** | A date in YYYY-MM-DD format of the mailpiece&#39;s expected delivery date based on its &#x60;send_date&#x60;. | [optional] |
| **tracking_events** | [**Array&lt;TrackingEventNormal&gt;**](TrackingEventNormal.md) | An array of tracking_event objects ordered by ascending &#x60;time&#x60;. Will not be populated for checks created in test mode. | [optional] |
| **object** | **String** |  | [default to &#39;check&#39;] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. |  |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. |  |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **use_type** | [**ChkUseType**](ChkUseType.md) |  |  |

## Example

```ruby
require 'lob'

instance = Lob::Check.new(
  id: null,
  to: null,
  from: null,
  description: null,
  metadata: null,
  merge_variables: null,
  send_date: null,
  mail_type: null,
  memo: null,
  check_number: null,
  message: null,
  amount: null,
  bank_account: null,
  check_bottom_template_id: null,
  attachment_template_id: null,
  check_bottom_template_version_id: null,
  attachment_template_version_id: null,
  url: null,
  carrier: null,
  thumbnails: null,
  expected_delivery_date: null,
  tracking_events: null,
  object: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  use_type: null
)
```

