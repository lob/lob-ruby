# Lob::BuckslipOrdersApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**buckslip_order_create**](BuckslipOrdersApi.md#buckslip_order_create) | **POST** /buckslips/{buckslip_id}/orders | create |
| [**buckslip_orders_retrieve**](BuckslipOrdersApi.md#buckslip_orders_retrieve) | **GET** /buckslips/{buckslip_id}/orders | get |


## buckslip_order_create

> <BuckslipOrder> buckslip_order_create(buckslip_id, buckslip_order_editable)

create

Creates a new buckslip order given information

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

api_instance = Lob::BuckslipOrdersApi.new
buckslip_id = 'buckslip_id_example' # String | The ID of the buckslip to which the buckslip orders belong.
buckslip_order_editable = Lob::BuckslipOrderEditable.new({quantity: 37}) # BuckslipOrderEditable | 

begin
  # create
  result = api_instance.create(buckslip_id, buckslip_order_editable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BuckslipOrdersApi->create: #{e}"
end
```

#### Using the buckslip_order_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BuckslipOrder>, Integer, Hash)> buckslip_order_create_with_http_info(buckslip_id, buckslip_order_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.buckslip_order_create_with_http_info(buckslip_id, buckslip_order_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BuckslipOrder>
rescue Lob::ApiError => e
  puts "Error when calling BuckslipOrdersApi->buckslip_order_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_id** | **String** | The ID of the buckslip to which the buckslip orders belong. |  |
| **buckslip_order_editable** | [**BuckslipOrderEditable**](BuckslipOrderEditable.md) |  |  |

### Return type

[**BuckslipOrder**](BuckslipOrder.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## buckslip_orders_retrieve

> <BuckslipOrdersList> buckslip_orders_retrieve(buckslip_id, opts)

get

Retrieves the buckslip orders associated with the given buckslip id.

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

api_instance = Lob::BuckslipOrdersApi.new
buckslip_id = 'buckslip_id_example' # String | The ID of the buckslip to which the buckslip orders belong.
opts = {
  limit: 56, # Integer | How many results to return.
  offset: 56 # Integer | An integer that designates the offset at which to begin returning results. Defaults to 0.
}

begin
  # get
  result = api_instance.get(buckslip_id, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BuckslipOrdersApi->get: #{e}"
end
```

#### Using the buckslip_orders_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BuckslipOrdersList>, Integer, Hash)> buckslip_orders_retrieve_with_http_info(buckslip_id, opts)

```ruby
begin
  # get
  data, status_code, headers = api_instance.buckslip_orders_retrieve_with_http_info(buckslip_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BuckslipOrdersList>
rescue Lob::ApiError => e
  puts "Error when calling BuckslipOrdersApi->buckslip_orders_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **buckslip_id** | **String** | The ID of the buckslip to which the buckslip orders belong. |  |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **offset** | **Integer** | An integer that designates the offset at which to begin returning results. Defaults to 0. | [optional][default to 0] |

### Return type

[**BuckslipOrdersList**](BuckslipOrdersList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

