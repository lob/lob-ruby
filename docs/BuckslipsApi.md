# OpenapiClient::BuckslipsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**buckslip_create**](BuckslipsApi.md#buckslip_create) | **POST** /buckslips | create |
| [**buckslip_delete**](BuckslipsApi.md#buckslip_delete) | **DELETE** /buckslips/{buckslip_id} | delete |
| [**buckslip_retrieve**](BuckslipsApi.md#buckslip_retrieve) | **GET** /buckslips/{buckslip_id} | get |
| [**buckslip_update**](BuckslipsApi.md#buckslip_update) | **PATCH** /buckslips/{buckslip_id} | update |
| [**buckslips_list**](BuckslipsApi.md#buckslips_list) | **GET** /buckslips | List |


## buckslip_create

> <Buckslip> buckslip_create(buckslip_editable)

create

Creates a new buckslip given information

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = OpenapiClient::BuckslipsApi.new
buckslip_editable = OpenapiClient::BuckslipEditable.new({front: 'front_example'}) # BuckslipEditable | 

begin
  # create
  result = api_instance.create(buckslip_editable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->create: #{e}"
end
```

#### Using the buckslip_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Buckslip>, Integer, Hash)> buckslip_create_with_http_info(buckslip_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.buckslip_create_with_http_info(buckslip_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Buckslip>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->buckslip_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_editable** | [**BuckslipEditable**](BuckslipEditable.md) |  |  |

### Return type

[**Buckslip**](Buckslip.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## buckslip_delete

> <BuckslipDeletion> buckslip_delete(buckslip_id)

delete

Delete an existing buckslip. You need only supply the unique identifier that was returned upon buckslip creation.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = OpenapiClient::BuckslipsApi.new
buckslip_id = 'buckslip_id_example' # String | id of the buckslip

begin
  # delete
  result = api_instance.delete(buckslip_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->delete: #{e}"
end
```

#### Using the buckslip_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BuckslipDeletion>, Integer, Hash)> buckslip_delete_with_http_info(buckslip_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.buckslip_delete_with_http_info(buckslip_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BuckslipDeletion>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->buckslip_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_id** | **String** | id of the buckslip |  |

### Return type

[**BuckslipDeletion**](BuckslipDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## buckslip_retrieve

> <Buckslip> buckslip_retrieve(buckslip_id)

get

Retrieves the details of an existing buckslip. You need only supply the unique customer identifier that was returned upon buckslip creation.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = OpenapiClient::BuckslipsApi.new
buckslip_id = 'buckslip_id_example' # String | id of the buckslip

begin
  # get
  result = api_instance.get(buckslip_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->get: #{e}"
end
```

#### Using the buckslip_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Buckslip>, Integer, Hash)> buckslip_retrieve_with_http_info(buckslip_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.buckslip_retrieve_with_http_info(buckslip_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Buckslip>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->buckslip_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_id** | **String** | id of the buckslip |  |

### Return type

[**Buckslip**](Buckslip.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## buckslip_update

> <Buckslip> buckslip_update(buckslip_id, buckslip_updatable)

update

Update the details of an existing buckslip. You need only supply the unique identifier that was returned upon buckslip creation.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = OpenapiClient::BuckslipsApi.new
buckslip_id = 'buckslip_id_example' # String | id of the buckslip
buckslip_updatable = OpenapiClient::BuckslipUpdatable.new # BuckslipUpdatable | 

begin
  # update
  result = api_instance.update(buckslip_id, buckslip_updatable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->update: #{e}"
end
```

#### Using the buckslip_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Buckslip>, Integer, Hash)> buckslip_update_with_http_info(buckslip_id, buckslip_updatable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.buckslip_update_with_http_info(buckslip_id, buckslip_updatable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Buckslip>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->buckslip_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_id** | **String** | id of the buckslip |  |
| **buckslip_updatable** | [**BuckslipUpdatable**](BuckslipUpdatable.md) |  |  |

### Return type

[**Buckslip**](Buckslip.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## buckslips_list

> <BuckslipsList> buckslips_list(opts)

List

Returns a list of your buckslips. The buckslips are returned sorted by creation date, with the most recently created buckslips appearing first.

### Examples

```ruby
require 'time'
require 'openapi_client'
# setup authorization
OpenapiClient.configure do |config|
  # Configure HTTP basic authorization: basicAuth
  config.username = 'YOUR USERNAME'
  config.password = 'YOUR PASSWORD'
end

api_instance = OpenapiClient::BuckslipsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'] # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
}

begin
  # List
  result = api_instance.List(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->List: #{e}"
end
```

#### Using the buckslips_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BuckslipsList>, Integer, Hash)> buckslips_list_with_http_info(opts)

```ruby
begin
  # List
  data, status_code, headers = api_instance.buckslips_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BuckslipsList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling BuckslipsApi->buckslips_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |

### Return type

[**BuckslipsList**](BuckslipsList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

