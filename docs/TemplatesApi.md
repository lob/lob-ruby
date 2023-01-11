# Lob::TemplatesApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_template**](TemplatesApi.md#create_template) | **POST** /templates | create |
| [**template_delete**](TemplatesApi.md#template_delete) | **DELETE** /templates/{tmpl_id} | delete |
| [**template_retrieve**](TemplatesApi.md#template_retrieve) | **GET** /templates/{tmpl_id} | get |
| [**template_update**](TemplatesApi.md#template_update) | **POST** /templates/{tmpl_id} | update |
| [**templates_list**](TemplatesApi.md#templates_list) | **GET** /templates | list |


## create_template

> <Template> create_template(template_writable)

create

Creates a new template for use with the Print & Mail API. In Live mode, you can only have as many non-deleted templates as allotted in your current [Print & Mail Edition](https://dashboard.lob.com/#/settings/editions). If you attempt to create a template past your limit, you will receive a `403` error. There is no limit in Test mode.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::TemplatesApi.new
template_writable = Lob::TemplateWritable.new({html: 'html_example'}) # TemplateWritable | 

begin
  # create
  result = api_instance.create(template_writable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->create: #{e}"
end
```

#### Using the create_template_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Template>, Integer, Hash)> create_template_with_http_info(template_writable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.create_template_with_http_info(template_writable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Template>
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->create_template_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **template_writable** | [**TemplateWritable**](TemplateWritable.md) |  |  |

### Return type

[**Template**](Template.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## template_delete

> <TemplateDeletion> template_delete(tmpl_id)

delete

Permanently deletes a template.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::TemplatesApi.new
tmpl_id = 'tmpl_id_example' # String | id of the template

begin
  # delete
  result = api_instance.delete(tmpl_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->delete: #{e}"
end
```

#### Using the template_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateDeletion>, Integer, Hash)> template_delete_with_http_info(tmpl_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.template_delete_with_http_info(tmpl_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateDeletion>
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->template_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | id of the template |  |

### Return type

[**TemplateDeletion**](TemplateDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## template_retrieve

> <Template> template_retrieve(tmpl_id)

get

Retrieves the details of an existing template.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::TemplatesApi.new
tmpl_id = 'tmpl_id_example' # String | id of the template

begin
  # get
  result = api_instance.get(tmpl_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->get: #{e}"
end
```

#### Using the template_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Template>, Integer, Hash)> template_retrieve_with_http_info(tmpl_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.template_retrieve_with_http_info(tmpl_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Template>
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->template_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | id of the template |  |

### Return type

[**Template**](Template.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## template_update

> <Template> template_update(tmpl_id, template_update)

update

Updates the description and/or published version of the template with the given id.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::TemplatesApi.new
tmpl_id = 'tmpl_id_example' # String | id of the template
template_update = Lob::TemplateUpdate.new # TemplateUpdate | 

begin
  # update
  result = api_instance.update(tmpl_id, template_update)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->update: #{e}"
end
```

#### Using the template_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Template>, Integer, Hash)> template_update_with_http_info(tmpl_id, template_update)

```ruby
begin
  # update
  data, status_code, headers = api_instance.template_update_with_http_info(tmpl_id, template_update)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Template>
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->template_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | id of the template |  |
| **template_update** | [**TemplateUpdate**](TemplateUpdate.md) |  |  |

### Return type

[**Template**](Template.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## templates_list

> <TemplateList> templates_list(opts)

list

Returns a list of your templates. The templates are returned sorted by creation date, with the most recently created templates appearing first.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::TemplatesApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'} # Hash<String, String> | Filter by metadata key-value pair`.
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->list: #{e}"
end
```

#### Using the templates_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateList>, Integer, Hash)> templates_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.templates_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateList>
rescue Lob::ApiError => e
  puts "Error when calling TemplatesApi->templates_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |
| **date_created** | [**Hash&lt;String, Time&gt;**](Time.md) | Filter by date created. | [optional] |
| **metadata** | [**Hash&lt;String, String&gt;**](String.md) | Filter by metadata key-value pair&#x60;. | [optional] |

### Return type

[**TemplateList**](TemplateList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

