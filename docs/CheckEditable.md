# Lob::CheckEditable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **from** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. |  |
| **to** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. |  |
| **bank_account** | **String** |  |  |
| **amount** | **Float** | The payment amount to be sent in US dollars. |  |
| **logo** | **String** | Accepts a remote URL or local file upload to an image to print (in grayscale) in the upper-left corner of your check. | [optional] |
| **check_bottom** | **String** | The artwork to use on the bottom of the check page.  Notes: - HTML merge variables should not include delimiting whitespace. - PDF, PNG, and JPGs must be sized at 8.5\&quot;x11\&quot; at 300 DPI, while supplied HTML will be rendered and trimmed to fit on a 8.5\&quot;x11\&quot; page. - The check bottom will always be printed in black &amp; white. - Must conform to [this template](https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/check_bottom_template.pdf).  Need more help? Consult our [HTML examples](#section/HTML-Examples). | [optional] |
| **attachment** | **String** | A document to include with the check. | [optional] |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **merge_variables** | **Object** | You can input a merge variable payload object to your template to render dynamic content. For example, if you have a template like: &#x60;{{variable_name}}&#x60;, pass in &#x60;{\&quot;variable_name\&quot;: \&quot;Harry\&quot;}&#x60; to render &#x60;Harry&#x60;. &#x60;merge_variables&#x60; must be an object. Any type of value is accepted as long as the object is valid JSON; you can use &#x60;strings&#x60;, &#x60;numbers&#x60;, &#x60;booleans&#x60;, &#x60;arrays&#x60;, &#x60;objects&#x60;, or &#x60;null&#x60;. The max length of the object is 25,000 characters. If you call &#x60;JSON.stringify&#x60; on your object, it can be no longer than 25,000 characters. Your variable names cannot contain any whitespace or any of the following special characters: &#x60;!&#x60;, &#x60;\&quot;&#x60;, &#x60;#&#x60;, &#x60;%&#x60;, &#x60;&amp;&#x60;, &#x60;&#39;&#x60;, &#x60;(&#x60;, &#x60;)&#x60;, &#x60;*&#x60;, &#x60;+&#x60;, &#x60;,&#x60;, &#x60;/&#x60;, &#x60;;&#x60;, &#x60;&lt;&#x60;, &#x60;&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;@&#x60;, &#x60;[&#x60;, &#x60;\\&#x60;, &#x60;]&#x60;, &#x60;^&#x60;, &#x60;&#x60; &#x60; &#x60;&#x60;, &#x60;{&#x60;, &#x60;|&#x60;, &#x60;}&#x60;, &#x60;~&#x60;. More instructions can be found in [our guide to using html and merge variables](https://lob.com/resources/guides/general/using-html-and-merge-variables). Depending on your [Merge Variable strictness](https://dashboard.lob.com/#/settings/account) setting, if you define variables in your HTML but do not pass them here, you will either receive an error or the variable will render as an empty string. | [optional] |
| **send_date** | **Time** | A timestamp in ISO 8601 format which specifies a date after the current time and up to 180 days in the future to send the letter off for production. Setting a send date overrides the default [cancellation window](#section/Cancellation-Windows) applied to the mailpiece. Until the &#x60;send_date&#x60; has passed, the mailpiece can be canceled. If a date in the format &#x60;2017-11-01&#x60; is passed, it will evaluate to midnight UTC of that date (&#x60;2017-11-01T00:00:00.000Z&#x60;). If a datetime is passed, that exact time will be used. A &#x60;send_date&#x60; passed with no time zone will default to UTC, while a &#x60;send_date&#x60; passed with a time zone will be converted to UTC. | [optional] |
| **mail_type** | **String** | Checks must be sent &#x60;usps_first_class&#x60; | [optional][default to &#39;usps_first_class&#39;] |
| **memo** | **String** | Text to include on the memo line of the check. | [optional] |
| **check_number** | **Integer** | An integer that designates the check number. | [optional] |
| **message** | **String** | Max of 400 characters to be included at the bottom of the check page. | [optional] |
| **billing_group_id** | **String** | An optional string with the billing group ID to tag your usage with. Is used for billing purposes. Requires special activation to use. See [Billing Group API](https://lob.github.io/lob-openapi/#tag/Billing-Groups) for more information. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::CheckEditable.new(
  from: null,
  to: null,
  bank_account: null,
  amount: null,
  logo: null,
  check_bottom: null,
  attachment: null,
  description: null,
  metadata: null,
  merge_variables: null,
  send_date: null,
  mail_type: null,
  memo: null,
  check_number: null,
  message: null,
  billing_group_id: null
)
```

