# OpenapiClient::DefaultApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**placeholder**](DefaultApi.md#placeholder) | **GET** /shared_dont_call | placeholder_no_call |


## placeholder

> <PlaceholderModel> placeholder

placeholder_no_call

Don't call this. It's so that the right models can be generated.

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

api_instance = OpenapiClient::DefaultApi.new

begin
  # placeholder_no_call
  result = api_instance.placeholder_no_call
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling DefaultApi->placeholder_no_call: #{e}"
end
```

#### Using the placeholder_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PlaceholderModel>, Integer, Hash)> placeholder_with_http_info

```ruby
begin
  # placeholder_no_call
  data, status_code, headers = api_instance.placeholder_with_http_info
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PlaceholderModel>
rescue OpenapiClient::ApiError => e
  puts "Error when calling DefaultApi->placeholder_with_http_info: #{e}"
end
```

### Parameters

This endpoint does not need any parameter.

### Return type

[**PlaceholderModel**](PlaceholderModel.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

