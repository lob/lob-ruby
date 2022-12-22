# OpenapiClient::IdentityValidationApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**identity_validation**](IdentityValidationApi.md#identity_validation) | **POST** /identity_validation | validate |


## identity_validation

> <IdentityValidation> identity_validation(multi_line_address)

validate

Validates whether a given name is associated with an address.

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

api_instance = OpenapiClient::IdentityValidationApi.new
multi_line_address = OpenapiClient::MultiLineAddress.new({primary_line: 'primary_line_example'}) # MultiLineAddress | 

begin
  # validate
  result = api_instance.validate(multi_line_address)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling IdentityValidationApi->validate: #{e}"
end
```

#### Using the identity_validation_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IdentityValidation>, Integer, Hash)> identity_validation_with_http_info(multi_line_address)

```ruby
begin
  # validate
  data, status_code, headers = api_instance.identity_validation_with_http_info(multi_line_address)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IdentityValidation>
rescue OpenapiClient::ApiError => e
  puts "Error when calling IdentityValidationApi->identity_validation_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **multi_line_address** | [**MultiLineAddress**](MultiLineAddress.md) |  |  |

### Return type

[**IdentityValidation**](IdentityValidation.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

