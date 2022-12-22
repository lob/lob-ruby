# OpenapiClient::UsAutocompletionsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**us_autocompletion**](UsAutocompletionsApi.md#us_autocompletion) | **POST** /us_autocompletions | autocomplete |


## us_autocompletion

> <UsAutocompletions> us_autocompletion(us_autocompletions_writable)

autocomplete

Given an address prefix consisting of a partial primary line, as well as optional input of city, state, and zip code, this functionality returns up to 10 full US address suggestions. Not all of them will turn out to be valid addresses; they'll need to be [verified](#operation/verification_us).

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

api_instance = OpenapiClient::UsAutocompletionsApi.new
us_autocompletions_writable = OpenapiClient::UsAutocompletionsWritable.new({address_prefix: 'address_prefix_example'}) # UsAutocompletionsWritable | 

begin
  # autocomplete
  result = api_instance.autocomplete(us_autocompletions_writable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsAutocompletionsApi->autocomplete: #{e}"
end
```

#### Using the us_autocompletion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UsAutocompletions>, Integer, Hash)> us_autocompletion_with_http_info(us_autocompletions_writable)

```ruby
begin
  # autocomplete
  data, status_code, headers = api_instance.us_autocompletion_with_http_info(us_autocompletions_writable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UsAutocompletions>
rescue OpenapiClient::ApiError => e
  puts "Error when calling UsAutocompletionsApi->us_autocompletion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **us_autocompletions_writable** | [**UsAutocompletionsWritable**](UsAutocompletionsWritable.md) |  |  |

### Return type

[**UsAutocompletions**](UsAutocompletions.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

