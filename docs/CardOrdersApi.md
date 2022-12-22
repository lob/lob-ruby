# OpenapiClient::CardOrdersApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**card_order_create**](CardOrdersApi.md#card_order_create) | **POST** /cards/{card_id}/orders | create |
| [**card_orders_retrieve**](CardOrdersApi.md#card_orders_retrieve) | **GET** /cards/{card_id}/orders | get |


## card_order_create

> <CardOrder> card_order_create(card_id, card_order_editable)

create

Creates a new card order given information

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

api_instance = OpenapiClient::CardOrdersApi.new
card_id = 'card_id_example' # String | The ID of the card to which the card orders belong.
card_order_editable = OpenapiClient::CardOrderEditable.new({quantity: 37}) # CardOrderEditable | 

begin
  # create
  result = api_instance.create(card_id, card_order_editable)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CardOrdersApi->create: #{e}"
end
```

#### Using the card_order_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CardOrder>, Integer, Hash)> card_order_create_with_http_info(card_id, card_order_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.card_order_create_with_http_info(card_id, card_order_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CardOrder>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CardOrdersApi->card_order_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_id** | **String** | The ID of the card to which the card orders belong. |  |
| **card_order_editable** | [**CardOrderEditable**](CardOrderEditable.md) |  |  |

### Return type

[**CardOrder**](CardOrder.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## card_orders_retrieve

> <CardOrderList> card_orders_retrieve(card_id, opts)

get

Retrieves the card orders associated with the given card id.

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

api_instance = OpenapiClient::CardOrdersApi.new
card_id = 'card_id_example' # String | The ID of the card to which the card orders belong.
opts = {
  limit: 56, # Integer | How many results to return.
  offset: 56 # Integer | An integer that designates the offset at which to begin returning results. Defaults to 0.
}

begin
  # get
  result = api_instance.get(card_id, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling CardOrdersApi->get: #{e}"
end
```

#### Using the card_orders_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CardOrderList>, Integer, Hash)> card_orders_retrieve_with_http_info(card_id, opts)

```ruby
begin
  # get
  data, status_code, headers = api_instance.card_orders_retrieve_with_http_info(card_id, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CardOrderList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling CardOrdersApi->card_orders_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_id** | **String** | The ID of the card to which the card orders belong. |  |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **offset** | **Integer** | An integer that designates the offset at which to begin returning results. Defaults to 0. | [optional][default to 0] |

### Return type

[**CardOrderList**](CardOrderList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

