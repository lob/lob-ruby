# Lob::TemplateVersionsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**create_template_version**](TemplateVersionsApi.md#create_template_version) | **POST** /templates/{tmpl_id}/versions | create |
| [**template_version_delete**](TemplateVersionsApi.md#template_version_delete) | **DELETE** /templates/{tmpl_id}/versions/{vrsn_id} | delete |
| [**template_version_retrieve**](TemplateVersionsApi.md#template_version_retrieve) | **GET** /templates/{tmpl_id}/versions/{vrsn_id} | get |
| [**template_version_update**](TemplateVersionsApi.md#template_version_update) | **POST** /templates/{tmpl_id}/versions/{vrsn_id} | update |
| [**template_versions_list**](TemplateVersionsApi.md#template_versions_list) | **GET** /templates/{tmpl_id}/versions | list |


## create_template_version

> <TemplateVersion> create_template_version(tmpl_id, template_version_writable)

create

Creates a new template version attached to the specified template.

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

api_instance = Lob::TemplateVersionsApi.new
tmpl_id = 'tmpl_id_example' # String | The ID of the template the new version will be attached to
template_version_writable = Lob::TemplateVersionWritable.new({html: 'html_example'}) # TemplateVersionWritable | 

begin
  # create
  result = api_instance.create(tmpl_id, template_version_writable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->create: #{e}"
end
```

#### Using the create_template_version_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateVersion>, Integer, Hash)> create_template_version_with_http_info(tmpl_id, template_version_writable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.create_template_version_with_http_info(tmpl_id, template_version_writable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateVersion>
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->create_template_version_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | The ID of the template the new version will be attached to |  |
| **template_version_writable** | [**TemplateVersionWritable**](TemplateVersionWritable.md) |  |  |

### Return type

[**TemplateVersion**](TemplateVersion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## template_version_delete

> <TemplateVersionDeletion> template_version_delete(tmpl_id, vrsn_id)

delete

Permanently deletes a template version. A template's `published_version` can not be deleted.

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

api_instance = Lob::TemplateVersionsApi.new
tmpl_id = 'tmpl_id_example' # String | The ID of the template to which the version belongs.
vrsn_id = 'vrsn_id_example' # String | id of the template_version

begin
  # delete
  result = api_instance.delete(tmpl_id, vrsn_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->delete: #{e}"
end
```

#### Using the template_version_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateVersionDeletion>, Integer, Hash)> template_version_delete_with_http_info(tmpl_id, vrsn_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.template_version_delete_with_http_info(tmpl_id, vrsn_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateVersionDeletion>
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->template_version_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | The ID of the template to which the version belongs. |  |
| **vrsn_id** | **String** | id of the template_version |  |

### Return type

[**TemplateVersionDeletion**](TemplateVersionDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## template_version_retrieve

> <TemplateVersion> template_version_retrieve(tmpl_id, vrsn_id)

get

Retrieves the template version with the given template and version ids.

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

api_instance = Lob::TemplateVersionsApi.new
tmpl_id = 'tmpl_id_example' # String | The ID of the template to which the version belongs.
vrsn_id = 'vrsn_id_example' # String | id of the template_version

begin
  # get
  result = api_instance.get(tmpl_id, vrsn_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->get: #{e}"
end
```

#### Using the template_version_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateVersion>, Integer, Hash)> template_version_retrieve_with_http_info(tmpl_id, vrsn_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.template_version_retrieve_with_http_info(tmpl_id, vrsn_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateVersion>
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->template_version_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | The ID of the template to which the version belongs. |  |
| **vrsn_id** | **String** | id of the template_version |  |

### Return type

[**TemplateVersion**](TemplateVersion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## template_version_update

> <TemplateVersion> template_version_update(tmpl_id, vrsn_id, template_version_updatable)

update

Updates the template version with the given template and version ids.

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

api_instance = Lob::TemplateVersionsApi.new
tmpl_id = 'tmpl_id_example' # String | The ID of the template to which the version belongs.
vrsn_id = 'vrsn_id_example' # String | id of the template_version
template_version_updatable = Lob::TemplateVersionUpdatable.new # TemplateVersionUpdatable | 

begin
  # update
  result = api_instance.update(tmpl_id, vrsn_id, template_version_updatable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->update: #{e}"
end
```

#### Using the template_version_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateVersion>, Integer, Hash)> template_version_update_with_http_info(tmpl_id, vrsn_id, template_version_updatable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.template_version_update_with_http_info(tmpl_id, vrsn_id, template_version_updatable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateVersion>
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->template_version_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | The ID of the template to which the version belongs. |  |
| **vrsn_id** | **String** | id of the template_version |  |
| **template_version_updatable** | [**TemplateVersionUpdatable**](TemplateVersionUpdatable.md) |  |  |

### Return type

[**TemplateVersion**](TemplateVersion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## template_versions_list

> <TemplateVersionList> template_versions_list(tmpl_id, opts)

list

Returns a list of template versions for the given template ID. The template versions are sorted by creation date, with the most recently created appearing first. 

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

api_instance = Lob::TemplateVersionsApi.new
tmpl_id = 'tmpl_id_example' # String | The ID of the template associated with the retrieved versions
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now} # Hash<String, Time> | Filter by date created.
}

begin
  # list
  result = api_instance.list(tmpl_id, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->list: #{e}"
end
```

#### Using the template_versions_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<TemplateVersionList>, Integer, Hash)> template_versions_list_with_http_info(tmpl_id, opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.template_versions_list_with_http_info(tmpl_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <TemplateVersionList>
rescue Lob::ApiError => e
  puts "Error when calling TemplateVersionsApi->template_versions_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **tmpl_id** | **String** | The ID of the template associated with the retrieved versions |  |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |
| **date_created** | [**Hash&lt;String, Time&gt;**](Time.md) | Filter by date created. | [optional] |

### Return type

[**TemplateVersionList**](TemplateVersionList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

