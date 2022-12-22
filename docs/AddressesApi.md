# OpenapiClient::AddressesApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**address_create**](AddressesApi.md#address_create) | **POST** /addresses | create |
| [**address_delete**](AddressesApi.md#address_delete) | **DELETE** /addresses/{adr_id} | delete |
| [**address_retrieve**](AddressesApi.md#address_retrieve) | **GET** /addresses/{adr_id} | get |
| [**addresses_list**](AddressesApi.md#addresses_list) | **GET** /addresses | list |


## address_create

> <Address> address_create(address_editable)

create

Creates a new address given information

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

api_instance = OpenapiClient::AddressesApi.new
address_editable = OpenapiClient::AddressEditable.new # AddressEditable | 

begin
  # create
  result = api_instance.create(address_editable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->create: #{e}"
end
```

#### Using the address_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Address>, Integer, Hash)> address_create_with_http_info(address_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.address_create_with_http_info(address_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Address>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->address_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **address_editable** | [**AddressEditable**](AddressEditable.md) |  |  |

### Return type

[**Address**](Address.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json
- **Accept**: application/json


## address_delete

> <AddressDeletion> address_delete(adr_id)

delete

Deletes the details of an existing address.

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

api_instance = OpenapiClient::AddressesApi.new
adr_id = 'adr_id_example' # String | id of the address

begin
  # delete
  result = api_instance.delete(adr_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->delete: #{e}"
end
```

#### Using the address_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddressDeletion>, Integer, Hash)> address_delete_with_http_info(adr_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.address_delete_with_http_info(adr_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddressDeletion>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->address_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adr_id** | **String** | id of the address |  |

### Return type

[**AddressDeletion**](AddressDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## address_retrieve

> <Address> address_retrieve(adr_id)

get

Retrieves the details of an existing address.

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

api_instance = OpenapiClient::AddressesApi.new
adr_id = 'adr_id_example' # String | id of the address

begin
  # get
  result = api_instance.get(adr_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->get: #{e}"
end
```

#### Using the address_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Address>, Integer, Hash)> address_retrieve_with_http_info(adr_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.address_retrieve_with_http_info(adr_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Address>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->address_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **adr_id** | **String** | id of the address |  |

### Return type

[**Address**](Address.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## addresses_list

> <AddressList> addresses_list(opts)

list

Returns a list of your addresses.

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

api_instance = OpenapiClient::AddressesApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'} # Hash<String, String> | Filter by metadata key-value pair`.
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->list: #{e}"
end
```

#### Using the addresses_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<AddressList>, Integer, Hash)> addresses_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.addresses_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <AddressList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling AddressesApi->addresses_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |
| **date_created** | [**Hash&lt;String, Time&gt;**](Time.md) | Filter by date created. | [optional] |
| **metadata** | [**Hash&lt;String, String&gt;**](String.md) | Filter by metadata key-value pair&#x60;. | [optional] |

### Return type

[**AddressList**](AddressList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

