# Lob::CreativesApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**creative_create**](CreativesApi.md#creative_create) | **POST** /creatives | create |
| [**creative_retrieve**](CreativesApi.md#creative_retrieve) | **GET** /creatives/{crv_id} | get |
| [**creative_update**](CreativesApi.md#creative_update) | **PATCH** /creatives/{crv_id} | update |


## creative_create

> <CreativeResponse> creative_create(creative_writable, opts)

create

Creates a new creative with the provided properties

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

api_instance = Lob::CreativesApi.new
creative_writable = Lob::CreativeWritable.new({from: TODO, resource_type: 'letter', campaign_id: 'campaign_id_example'}) # CreativeWritable | 
opts = {
  x_lang_output: 'native' # String | * `native` - Translate response to the native language of the country in the request * `match` - match the response to the language in the request  Default response is in English. 
}

begin
  # create
  result = api_instance.create(creative_writable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->create: #{e}"
end
```

#### Using the creative_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreativeResponse>, Integer, Hash)> creative_create_with_http_info(creative_writable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.creative_create_with_http_info(creative_writable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreativeResponse>
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->creative_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **creative_writable** | [**CreativeWritable**](CreativeWritable.md) |  |  |
| **x_lang_output** | **String** | * &#x60;native&#x60; - Translate response to the native language of the country in the request * &#x60;match&#x60; - match the response to the language in the request  Default response is in English.  | [optional] |

### Return type

[**CreativeResponse**](CreativeResponse.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## creative_retrieve

> <CreativeResponse> creative_retrieve(crv_id)

get

Retrieves the details of an existing creative. You need only supply the unique creative identifier that was returned upon creative creation.

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

api_instance = Lob::CreativesApi.new
crv_id = 'crv_id_example' # String | id of the creative

begin
  # get
  result = api_instance.get(crv_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->get: #{e}"
end
```

#### Using the creative_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreativeResponse>, Integer, Hash)> creative_retrieve_with_http_info(crv_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.creative_retrieve_with_http_info(crv_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreativeResponse>
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->creative_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **crv_id** | **String** | id of the creative |  |

### Return type

[**CreativeResponse**](CreativeResponse.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## creative_update

> <CreativeResponse> creative_update(crv_id, creative_patch)

update

Update the details of an existing creative. You need only supply the unique identifier that was returned upon creative creation.

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

api_instance = Lob::CreativesApi.new
crv_id = 'crv_id_example' # String | id of the creative
creative_patch = Lob::CreativePatch.new # CreativePatch | 

begin
  # update
  result = api_instance.update(crv_id, creative_patch)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->update: #{e}"
end
```

#### Using the creative_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CreativeResponse>, Integer, Hash)> creative_update_with_http_info(crv_id, creative_patch)

```ruby
begin
  # update
  data, status_code, headers = api_instance.creative_update_with_http_info(crv_id, creative_patch)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CreativeResponse>
rescue Lob::ApiError => e
  puts "Error when calling CreativesApi->creative_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **crv_id** | **String** | id of the creative |  |
| **creative_patch** | [**CreativePatch**](CreativePatch.md) |  |  |

### Return type

[**CreativeResponse**](CreativeResponse.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

