# Lob::UploadsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**export_retrieve**](UploadsApi.md#export_retrieve) | **GET** /uploads/{upl_id}/exports/{ex_id} | get_export |
| [**get**](UploadsApi.md#get) | **GET** /uploads/{upl_id} | get |
| [**upload_create**](UploadsApi.md#upload_create) | **POST** /uploads | create |
| [**upload_delete**](UploadsApi.md#upload_delete) | **DELETE** /uploads/{upl_id} | delete |
| [**upload_export_create**](UploadsApi.md#upload_export_create) | **POST** /uploads/{upl_id}/exports | create_export |
| [**upload_file_create**](UploadsApi.md#upload_file_create) | **POST** /uploads/{upl_id}/file | upload_file |
| [**upload_update**](UploadsApi.md#upload_update) | **PATCH** /uploads/{upl_id} | update |
| [**uploads_list**](UploadsApi.md#uploads_list) | **GET** /uploads | list |


## export_retrieve

> <Export> export_retrieve(upl_id, ex_id)

get_export

Retrieves the details of an existing export. You need only supply the unique export identifier that was returned upon export creation. If you try retrieving an export immediately after creating one (i.e., before we're done processing the export), you will get back an export object with `state = in_progress`.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | ID of the upload
ex_id = 'ex_id_example' # String | ID of the export

begin
  # get_export
  result = api_instance.get_export(upl_id, ex_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->get_export: #{e}"
end
```

#### Using the export_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Export>, Integer, Hash)> export_retrieve_with_http_info(upl_id, ex_id)

```ruby
begin
  # get_export
  data, status_code, headers = api_instance.export_retrieve_with_http_info(upl_id, ex_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Export>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->export_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | ID of the upload |  |
| **ex_id** | **String** | ID of the export |  |

### Return type

[**Export**](Export.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## get

> <Upload> get(upl_id)

get

Retrieves the details of an existing upload. You need only supply the unique upload identifier that was returned upon upload creation.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | id of the upload

begin
  # get
  result = api_instance.get(upl_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->get: #{e}"
end
```

#### Using the get_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Upload>, Integer, Hash)> get_with_http_info(upl_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.get_with_http_info(upl_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Upload>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->get_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | id of the upload |  |

### Return type

[**Upload**](Upload.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## upload_create

> <Upload> upload_create(upload_writable)

create

Creates a new upload with the provided properties.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upload_writable = Lob::UploadWritable.new({campaign_id: 'campaign_id_example'}) # UploadWritable | 

begin
  # create
  result = api_instance.create(upload_writable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->create: #{e}"
end
```

#### Using the upload_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Upload>, Integer, Hash)> upload_create_with_http_info(upload_writable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.upload_create_with_http_info(upload_writable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Upload>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upload_writable** | [**UploadWritable**](UploadWritable.md) |  |  |

### Return type

[**Upload**](Upload.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## upload_delete

> upload_delete(upl_id)

delete

Delete an existing upload. You need only supply the unique identifier that was returned upon upload creation.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | id of the upload

begin
  # delete
  api_instance.delete(upl_id)
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->delete: #{e}"
end
```

#### Using the upload_delete_with_http_info variant

This returns an Array which contains the response data (`nil` in this case), status code and headers.

> <Array(nil, Integer, Hash)> upload_delete_with_http_info(upl_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.upload_delete_with_http_info(upl_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => nil
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | id of the upload |  |

### Return type

nil (empty response body)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## upload_export_create

> <UploadCreateExport> upload_export_create(upl_id, export_model)

create_export

Campaign Exports can help you understand exactly which records in a campaign could not be created. By initiating and retrieving an export, you will get row-by-row errors for your campaign. For a step-by-step walkthrough of creating a campaign and exporting failures, see our [Campaigns Guide](https://help.lob.com/best-practices/launching-your-first-campaign).  Create an export file associated with an upload.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | ID of the upload
export_model = Lob::ExportModel.new # ExportModel | 

begin
  # create_export
  result = api_instance.create_export(upl_id, export_model)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->create_export: #{e}"
end
```

#### Using the upload_export_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UploadCreateExport>, Integer, Hash)> upload_export_create_with_http_info(upl_id, export_model)

```ruby
begin
  # create_export
  data, status_code, headers = api_instance.upload_export_create_with_http_info(upl_id, export_model)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UploadCreateExport>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_export_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | ID of the upload |  |
| **export_model** | [**ExportModel**](ExportModel.md) |  |  |

### Return type

[**UploadCreateExport**](UploadCreateExport.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## upload_file_create

> <UploadFile> upload_file_create(upl_id, file)

upload_file

Upload an [audience file](https://help.lob.com/best-practices/campaign-audience-guide) and associate it with an upload.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | ID of the upload
file = TODO # AnyType | 

begin
  # upload_file
  result = api_instance.upload_file(upl_id, file)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_file: #{e}"
end
```

#### Using the upload_file_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UploadFile>, Integer, Hash)> upload_file_create_with_http_info(upl_id, file)

```ruby
begin
  # upload_file
  data, status_code, headers = api_instance.upload_file_create_with_http_info(upl_id, file)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UploadFile>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_file_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | ID of the upload |  |
| **file** | [**AnyType**](AnyType.md) |  |  |

### Return type

[**UploadFile**](UploadFile.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: multipart/form-data
- **Accept**: application/json


## upload_update

> <Upload> upload_update(upl_id, upload_updatable)

update

Update the details of an existing upload. You need only supply the unique identifier that was returned upon upload creation.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
upl_id = 'upl_id_example' # String | id of the upload
upload_updatable = Lob::UploadUpdatable.new # UploadUpdatable | 

begin
  # update
  result = api_instance.update(upl_id, upload_updatable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->update: #{e}"
end
```

#### Using the upload_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Upload>, Integer, Hash)> upload_update_with_http_info(upl_id, upload_updatable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.upload_update_with_http_info(upl_id, upload_updatable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Upload>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->upload_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **upl_id** | **String** | id of the upload |  |
| **upload_updatable** | [**UploadUpdatable**](UploadUpdatable.md) |  |  |

### Return type

[**Upload**](Upload.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## uploads_list

> <Array<Upload>> uploads_list(opts)

list

Returns a list of your uploads. Optionally, filter uploads by campaign.

### Examples

```ruby
require 'time'
require 'lob'
# setup authorization
Lob.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = Lob::UploadsApi.new
opts = {
  campaign_id: 'campaign_id_example' # String | id of the campaign
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->list: #{e}"
end
```

#### Using the uploads_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Array<Upload>>, Integer, Hash)> uploads_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.uploads_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Array<Upload>>
rescue Lob::ApiError => e
  puts "Error when calling UploadsApi->uploads_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **campaign_id** | **String** | id of the campaign | [optional] |

### Return type

[**Array&lt;Upload&gt;**](Upload.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

