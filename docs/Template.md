# Lob::Template

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **description** | **String** | An internal description that identifies this resource. Must be no longer than 255 characters.  | [optional] |
| **id** | **String** | Unique identifier prefixed with &#x60;tmpl_&#x60;. ID of a saved [HTML template](#section/HTML-Templates). |  |
| **versions** | [**Array&lt;TemplateVersion&gt;**](TemplateVersion.md) | An array of all non-deleted [version objects](#tag/Template-Versions) associated with the template. |  |
| **published_version** | [**TemplateVersion**](TemplateVersion.md) |  |  |
| **object** | **String** | Value is resource type. | [optional][default to &#39;template&#39;] |
| **metadata** | **Hash&lt;String, String&gt;** | Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters &#x60;\&quot;&#x60; and &#x60;\\&#x60;. i.e. &#39;{\&quot;customer_id\&quot; : \&quot;NEWYORK2015\&quot;}&#39; Nested objects are not supported.  See [Metadata](#section/Metadata) for more information. | [optional] |
| **date_created** | **Time** | A timestamp in ISO 8601 format of the date the resource was created. | [optional] |
| **date_modified** | **Time** | A timestamp in ISO 8601 format of the date the resource was last modified. | [optional] |
| **deleted** | **Boolean** | Only returned if the resource has been successfully deleted. | [optional] |

## Example

```ruby
require 'lob'

instance = Lob::Template.new(
  description: null,
  id: null,
  versions: null,
  published_version: null,
  object: null,
  metadata: null,
  date_created: null,
  date_modified: null,
  deleted: null
)
```

