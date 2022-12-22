# OpenapiClient::IntlAutocompletionsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**intl_autocompletion**](IntlAutocompletionsApi.md#intl_autocompletion) | **POST** /intl_autocompletions | autocomplete |


## intl_autocompletion

> <IntlAutocompletions> intl_autocompletion(intl_autocompletions_writable, opts)

autocomplete

Given an address prefix consisting of a partial primary line and country, as well as optional input of city, state, and zip code, this functionality returns up to 10 full International address suggestions. Not all of them will turn out to be valid addresses; they'll need to be [verified](#operation/intl_verification).

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

api_instance = OpenapiClient::IntlAutocompletionsApi.new
intl_autocompletions_writable = OpenapiClient::IntlAutocompletionsWritable.new({address_prefix: 'address_prefix_example', country: OpenapiClient::CountryExtended::AD}) # IntlAutocompletionsWritable | 
opts = {
  x_lang_output: 'native' # String | * `native` - Translate response to the native language of the country in the request * `match` - match the response to the language in the request  Default response is in English. 
}

begin
  # autocomplete
  result = api_instance.autocomplete(intl_autocompletions_writable, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling IntlAutocompletionsApi->autocomplete: #{e}"
end
```

#### Using the intl_autocompletion_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IntlAutocompletions>, Integer, Hash)> intl_autocompletion_with_http_info(intl_autocompletions_writable, opts)

```ruby
begin
  # autocomplete
  data, status_code, headers = api_instance.intl_autocompletion_with_http_info(intl_autocompletions_writable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IntlAutocompletions>
rescue OpenapiClient::ApiError => e
  puts "Error when calling IntlAutocompletionsApi->intl_autocompletion_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **intl_autocompletions_writable** | [**IntlAutocompletionsWritable**](IntlAutocompletionsWritable.md) |  |  |
| **x_lang_output** | **String** | * &#x60;native&#x60; - Translate response to the native language of the country in the request * &#x60;match&#x60; - match the response to the language in the request  Default response is in English.  | [optional] |

### Return type

[**IntlAutocompletions**](IntlAutocompletions.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

