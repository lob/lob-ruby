# Lob::UsVerificationsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**bulk_us_verifications**](UsVerificationsApi.md#bulk_us_verifications) | **POST** /bulk/us_verifications | verifyBulk |
| [**us_verification**](UsVerificationsApi.md#us_verification) | **POST** /us_verifications | verifySingle |


## bulk_us_verifications

> <UsVerifications> bulk_us_verifications(multiple_components_list, opts)

verifyBulk

Verify a list of US or US territory addresses with a live API key.

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

api_instance = Lob::UsVerificationsApi.new
multiple_components_list = Lob::MultipleComponentsList.new({addresses: [Lob::MultipleComponents.new({primary_line: 'primary_line_example'})]}) # MultipleComponentsList | 
opts = {
  _case: 'upper' # String | Casing of the verified address. Possible values are `upper` and `proper` for uppercased (e.g. \"PO BOX\") and proper-cased (e.g. \"PO Box\"), respectively.
}

begin
  # verifyBulk
  result = api_instance.verifyBulk(multiple_components_list, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UsVerificationsApi->verifyBulk: #{e}"
end
```

#### Using the bulk_us_verifications_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UsVerifications>, Integer, Hash)> bulk_us_verifications_with_http_info(multiple_components_list, opts)

```ruby
begin
  # verifyBulk
  data, status_code, headers = api_instance.bulk_us_verifications_with_http_info(multiple_components_list, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UsVerifications>
rescue Lob::ApiError => e
  puts "Error when calling UsVerificationsApi->bulk_us_verifications_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **multiple_components_list** | [**MultipleComponentsList**](MultipleComponentsList.md) |  |  |
| **_case** | **String** | Casing of the verified address. Possible values are &#x60;upper&#x60; and &#x60;proper&#x60; for uppercased (e.g. \&quot;PO BOX\&quot;) and proper-cased (e.g. \&quot;PO Box\&quot;), respectively. | [optional][default to &#39;upper&#39;] |

### Return type

[**UsVerifications**](UsVerifications.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## us_verification

> <UsVerification> us_verification(us_verifications_writable, opts)

verifySingle

Verify a US or US territory address with a live API key.

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

api_instance = Lob::UsVerificationsApi.new
us_verifications_writable = Lob::UsVerificationsWritable.new # UsVerificationsWritable | 
opts = {
  _case: 'upper' # String | Casing of the verified address. Possible values are `upper` and `proper` for uppercased (e.g. \"PO BOX\") and proper-cased (e.g. \"PO Box\"), respectively.
}

begin
  # verifySingle
  result = api_instance.verifySingle(us_verifications_writable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling UsVerificationsApi->verifySingle: #{e}"
end
```

#### Using the us_verification_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<UsVerification>, Integer, Hash)> us_verification_with_http_info(us_verifications_writable, opts)

```ruby
begin
  # verifySingle
  data, status_code, headers = api_instance.us_verification_with_http_info(us_verifications_writable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <UsVerification>
rescue Lob::ApiError => e
  puts "Error when calling UsVerificationsApi->us_verification_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **us_verifications_writable** | [**UsVerificationsWritable**](UsVerificationsWritable.md) |  |  |
| **_case** | **String** | Casing of the verified address. Possible values are &#x60;upper&#x60; and &#x60;proper&#x60; for uppercased (e.g. \&quot;PO BOX\&quot;) and proper-cased (e.g. \&quot;PO Box\&quot;), respectively. | [optional][default to &#39;upper&#39;] |

### Return type

[**UsVerification**](UsVerification.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

