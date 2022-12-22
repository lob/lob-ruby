# OpenapiClient::TemplateVersion

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **id** | **String** | Unique identifier prefixed with &#x60;vrsn_&#x60;. |  |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **html** | **String** | An HTML string of less than 100,000 characters to be used as the &#x60;published_version&#x60; of this template. See [here](#section/HTML-Examples) for guidance on designing HTML templates. Please see endpoint specific documentation for any other product-specific HTML details: - [Postcards](https://docs.lob.com/#tag/Postcards/operation/postcard_create) - &#x60;front&#x60; and &#x60;back&#x60; - [Self Mailers](https://docs.lob.com/#tag/Self-Mailers/operation/self_mailer_create) - &#x60;inside&#x60; and &#x60;outside&#x60; - [Letters](https://docs.lob.com/#tag/Letters/operation/letter_create) - &#x60;file&#x60; - [Checks](https://docs.lob.com/#tag/Checks/operation/check_create) - &#x60;check_bottom&#x60; and &#x60;attachment&#x60; - [Cards](https://docs.lob.com/#tag/Cards/operation/card_create) - &#x60;front&#x60; and &#x60;back&#x60;  If there is a syntax error with your variable names within your HTML, then an error will be thrown, e.g. using a &#x60;{{#users}}&#x60; opening tag without the corresponding closing tag &#x60;{{/users}}&#x60;.  |  |
| **engine** | [**EngineHtml**](EngineHtml.md) |  | [optional][default to &#39;legacy&#39;] |
| **suggest_json_editor** | **Boolean** | Used by frontend, true if the template uses advanced features.  | [optional] |
| **merge_variables** | **Object** | Used by frontend, an object representing the keys of every merge variable present in the template. It has one key named &#39;keys&#39;, and its value is an array of strings.  | [optional] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |
| **object** | **String** | Value is resource type. | [optional][default to &#39;version&#39;] |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::TemplateVersion.new(
  id: null,
  description: null,
  html: null,
  engine: null,
  suggest_json_editor: null,
  merge_variables: null,
  date_created: null,
  date_modified: null,
  deleted: null,
  object: null
)
```

