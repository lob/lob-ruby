# OpenapiClient::LetterEditable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **mail_type** | [**MailType**](MailType.md) |  | [optional][default to &#39;usps_first_class&#39;] |
| **merge_variables** | **Object** | You can input a merge variable payload object to your template to render dynamic content. For example, if you have a template like: &#x60;{{variable_name}}&#x60;, pass in &#x60;{\&quot;variable_name\&quot;: \&quot;Harry\&quot;}&#x60; to render &#x60;Harry&#x60;. &#x60;merge_variables&#x60; must be an object. Any type of value is accepted as long as the object is valid JSON; you can use &#x60;strings&#x60;, &#x60;numbers&#x60;, &#x60;booleans&#x60;, &#x60;arrays&#x60;, &#x60;objects&#x60;, or &#x60;null&#x60;. The max length of the object is 25,000 characters. If you call &#x60;JSON.stringify&#x60; on your object, it can be no longer than 25,000 characters. Your variable names cannot contain any whitespace or any of the following special characters: &#x60;!&#x60;, &#x60;\&quot;&#x60;, &#x60;#&#x60;, &#x60;%&#x60;, &#x60;&amp;&#x60;, &#x60;&#39;&#x60;, &#x60;(&#x60;, &#x60;)&#x60;, &#x60;*&#x60;, &#x60;+&#x60;, &#x60;,&#x60;, &#x60;/&#x60;, &#x60;;&#x60;, &#x60;&lt;&#x60;, &#x60;&#x3D;&#x60;, &#x60;&gt;&#x60;, &#x60;@&#x60;, &#x60;[&#x60;, &#x60;\\&#x60;, &#x60;]&#x60;, &#x60;^&#x60;, &#x60;&#x60; &#x60; &#x60;&#x60;, &#x60;{&#x60;, &#x60;|&#x60;, &#x60;}&#x60;, &#x60;~&#x60;. More instructions can be found in [our guide to using html and merge variables](https://lob.com/resources/guides/general/using-html-and-merge-variables). Depending on your [Merge Variable strictness](https://dashboard.lob.com/#/settings/account) setting, if you define variables in your HTML but do not pass them here, you will either receive an error or the variable will render as an empty string. | [optional] |
| **send_date** | **Time** | A timestamp in ISO 8601 format which specifies a date after the current time and up to 180 days in the future to send the letter off for production. Setting a send date overrides the default [cancellation window](#section/Cancellation-Windows) applied to the mailpiece. Until the &#x60;send_date&#x60; has passed, the mailpiece can be canceled. If a date in the format &#x60;2017-11-01&#x60; is passed, it will evaluate to midnight UTC of that date (&#x60;2017-11-01T00:00:00.000Z&#x60;). If a datetime is passed, that exact time will be used. A &#x60;send_date&#x60; passed with no time zone will default to UTC, while a &#x60;send_date&#x60; passed with a time zone will be converted to UTC. | [optional] |
| **color** | **Boolean** | Set this key to &#x60;true&#x60; if you would like to print in color. Set to &#x60;false&#x60; if you would like to print in black and white. |  |
| **double_sided** | **Boolean** | Set this attribute to &#x60;true&#x60; for double sided printing, or &#x60;false&#x60; for for single sided printing. Defaults to &#x60;true&#x60;. | [optional][default to true] |
| **address_placement** | **String** | Specifies the location of the address information that will show through the double-window envelope. To see how this will impact your letter design, view our letter template.   * &#x60;top_first_page&#x60; - (default) print address information at the top of your provided first page   * &#x60;insert_blank_page&#x60; - insert a blank address page at the beginning of your file (you will be charged for the extra page)   * &#x60;bottom_first_page_center&#x60; - **(deprecation planned within a few months)** print address information at the bottom center of your provided first page   * &#x60;bottom_first_page&#x60; - print address information at the bottom of your provided first page  | [optional][default to &#39;top_first_page&#39;] |
| **return_envelope** | [**AnyType**](.md) | indicates if a return envelope is requested for the letter. The value corresponding to this field is by default a boolean. But if the account is signed up for custom return envelopes, the value is of type string and is &#x60;no_9_single_window&#x60; for a standard return envelope and a custom &#x60;return_envelope_id&#x60; for non-standard return envelopes.  To include a return envelope with your letter, set to &#x60;true&#x60; and specify the &#x60;perforated_page&#x60;. See [pricing](https://www.lob.com/pricing/print-mail#compare) for extra costs incurred. | [optional] |
| **perforated_page** | **Integer** | Required if &#x60;return_envelope&#x60; is &#x60;true&#x60;. The number of the page that should be perforated for use with the return envelope. Must be greater than or equal to &#x60;1&#x60;. The blank page added by &#x60;address_placement&#x3D;insert_blank_page&#x60; will be ignored when considering the perforated page number. To see how perforation will impact your letter design, view our [perforation guide](https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/letter_perf_template.pdf). | [optional] |
| **custom_envelope** | **String** |  | [optional] |
| **to** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. |  |
| **from** | [**AnyType**](.md) | Must either be an address ID or an inline object with correct address parameters. |  |
| **file** | **String** | PDF file containing the letter&#39;s formatting. |  |
| **extra_service** | **String** | Add an extra service to your letter:   * &#x60;certified&#x60; - track and confirm delivery for domestic destinations. An extra sheet (1 PDF page single-sided or 2 PDF pages double-sided) is added to the beginning of your letter for address and barcode information. See here for templates: [#10 envelope](https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/letter_certified_template.pdf) and [flat envelope](https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/letter_certified_flat_template.pdf) (used for letters over 6 pages single-sided or 12 pages double-sided). You will not be charged for this extra sheet.   * &#x60;certified_return_receipt&#x60; - request an electronic copy of the recipient&#39;s signature to prove delivery of your certified letter   * &#x60;registered&#x60; - provides tracking and confirmation for international addresses  | [optional] |
| **cards** | **Array&lt;String&gt;** | A single-element array containing an existing card id in a string format. See [cards](#tag/Cards) for more information. | [optional] |
| **billing_group_id** | **String** | An optional string with the billing group ID to tag your usage with. Is used for billing purposes. Requires special activation to use. See [Billing Group API](https://lob.github.io/lob-openapi/#tag/Billing-Groups) for more information. | [optional] |
| **qr_code** | [**QrCode**](QrCode.md) |  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::LetterEditable.new(
  description: null,
  metadata: null,
  mail_type: null,
  merge_variables: null,
  send_date: null,
  color: null,
  double_sided: null,
  address_placement: null,
  return_envelope: null,
  perforated_page: null,
  custom_envelope: null,
  to: null,
  from: null,
  file: null,
  extra_service: null,
  cards: null,
  billing_group_id: null,
  qr_code: null
)
```

