# Lob::IntlVerificationsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**bulk_intl_verifications**](IntlVerificationsApi.md#bulk_intl_verifications) | **POST** /bulk/intl_verifications | verifyBulk |
| [**intl_verification**](IntlVerificationsApi.md#intl_verification) | **POST** /intl_verifications | verifySingle |


## bulk_intl_verifications

> <IntlVerifications> bulk_intl_verifications(intl_verifications_payload)

verifyBulk

Verify a list of international (except US or US territories) address with a live API key.

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

api_instance = Lob::IntlVerificationsApi.new
intl_verifications_payload = Lob::IntlVerificationsPayload.new({addresses: [Lob::MultipleComponentsIntl.new({primary_line: 'primary_line_example', country: Lob::CountryExtended::EMPTY})]}) # IntlVerificationsPayload | 

begin
  # verifyBulk
  result = api_instance.verifyBulk(intl_verifications_payload)
  p result
rescue Lob::ApiError => e
  puts "Error when calling IntlVerificationsApi->verifyBulk: #{e}"
end
```

#### Using the bulk_intl_verifications_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IntlVerifications>, Integer, Hash)> bulk_intl_verifications_with_http_info(intl_verifications_payload)

```ruby
begin
  # verifyBulk
  data, status_code, headers = api_instance.bulk_intl_verifications_with_http_info(intl_verifications_payload)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IntlVerifications>
rescue Lob::ApiError => e
  puts "Error when calling IntlVerificationsApi->bulk_intl_verifications_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **intl_verifications_payload** | [**IntlVerificationsPayload**](IntlVerificationsPayload.md) |  |  |

### Return type

[**IntlVerifications**](IntlVerifications.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, multipart/form-data
- **Accept**: application/json


## intl_verification

> <IntlVerification> intl_verification(intl_verification_writable, opts)

verifySingle

Verify an international (except US or US territories) address with a live API key.

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

api_instance = Lob::IntlVerificationsApi.new
intl_verification_writable = Lob::IntlVerificationWritable.new # IntlVerificationWritable | 
opts = {
  x_lang_output: 'native' # String | * `native` - Translate response to the native language of the country in the request * `match` - match the response to the language in the request  Default response is in English. 
}

begin
  # verifySingle
  result = api_instance.verifySingle(intl_verification_writable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling IntlVerificationsApi->verifySingle: #{e}"
end
```

#### Using the intl_verification_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<IntlVerification>, Integer, Hash)> intl_verification_with_http_info(intl_verification_writable, opts)

```ruby
begin
  # verifySingle
  data, status_code, headers = api_instance.intl_verification_with_http_info(intl_verification_writable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <IntlVerification>
rescue Lob::ApiError => e
  puts "Error when calling IntlVerificationsApi->intl_verification_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **intl_verification_writable** | [**IntlVerificationWritable**](IntlVerificationWritable.md) |  |  |
| **x_lang_output** | **String** | * &#x60;native&#x60; - Translate response to the native language of the country in the request * &#x60;match&#x60; - match the response to the language in the request  Default response is in English.  | [optional] |

### Return type

[**IntlVerification**](IntlVerification.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

