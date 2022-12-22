# OpenapiClient::ZipLookupsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**zip_lookup**](ZipLookupsApi.md#zip_lookup) | **POST** /us_zip_lookups | lookup |


## zip_lookup

> <Zip> zip_lookup(zip_editable)

lookup

Returns information about a ZIP code

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

api_instance = OpenapiClient::ZipLookupsApi.new
zip_editable = OpenapiClient::ZipEditable.new # ZipEditable | 

begin
  # lookup
  result = api_instance.lookup(zip_editable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling ZipLookupsApi->lookup: #{e}"
end
```

#### Using the zip_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Zip>, Integer, Hash)> zip_lookup_with_http_info(zip_editable)

```ruby
begin
  # lookup
  data, status_code, headers = api_instance.zip_lookup_with_http_info(zip_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Zip>
rescue OpenapiClient::ApiError => e
  puts "Error when calling ZipLookupsApi->zip_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **zip_editable** | [**ZipEditable**](ZipEditable.md) |  |  |

### Return type

[**Zip**](Zip.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

