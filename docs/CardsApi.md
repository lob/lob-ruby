# Lob::CardsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**card_create**](CardsApi.md#card_create) | **POST** /cards | create |
| [**card_delete**](CardsApi.md#card_delete) | **DELETE** /cards/{card_id} | delete |
| [**card_retrieve**](CardsApi.md#card_retrieve) | **GET** /cards/{card_id} | get |
| [**card_update**](CardsApi.md#card_update) | **POST** /cards/{card_id} | update |
| [**cards_list**](CardsApi.md#cards_list) | **GET** /cards | list |


## card_create

> <Card> card_create(card_editable)

create

Creates a new card given information

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

api_instance = Lob::CardsApi.new
card_editable = Lob::CardEditable.new({front: 'front_example'}) # CardEditable | 

begin
  # create
  result = api_instance.create(card_editable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->create: #{e}"
end
```

#### Using the card_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Card>, Integer, Hash)> card_create_with_http_info(card_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.card_create_with_http_info(card_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Card>
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->card_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_editable** | [**CardEditable**](CardEditable.md) |  |  |

### Return type

[**Card**](Card.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## card_delete

> <CardDeletion> card_delete(card_id)

delete

Delete an existing card. You need only supply the unique identifier that was returned upon card creation.

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

api_instance = Lob::CardsApi.new
card_id = 'card_id_example' # String | id of the card

begin
  # delete
  result = api_instance.delete(card_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->delete: #{e}"
end
```

#### Using the card_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CardDeletion>, Integer, Hash)> card_delete_with_http_info(card_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.card_delete_with_http_info(card_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CardDeletion>
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->card_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_id** | **String** | id of the card |  |

### Return type

[**CardDeletion**](CardDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## card_retrieve

> <Card> card_retrieve(card_id)

get

Retrieves the details of an existing card. You need only supply the unique customer identifier that was returned upon card creation.

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

api_instance = Lob::CardsApi.new
card_id = 'card_id_example' # String | id of the card

begin
  # get
  result = api_instance.get(card_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->get: #{e}"
end
```

#### Using the card_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Card>, Integer, Hash)> card_retrieve_with_http_info(card_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.card_retrieve_with_http_info(card_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Card>
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->card_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_id** | **String** | id of the card |  |

### Return type

[**Card**](Card.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## card_update

> <Card> card_update(card_id, card_updatable)

update

Update the details of an existing card. You need only supply the unique identifier that was returned upon card creation.

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

api_instance = Lob::CardsApi.new
card_id = 'card_id_example' # String | id of the card
card_updatable = Lob::CardUpdatable.new # CardUpdatable | 

begin
  # update
  result = api_instance.update(card_id, card_updatable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->update: #{e}"
end
```

#### Using the card_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Card>, Integer, Hash)> card_update_with_http_info(card_id, card_updatable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.card_update_with_http_info(card_id, card_updatable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Card>
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->card_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **card_id** | **String** | id of the card |  |
| **card_updatable** | [**CardUpdatable**](CardUpdatable.md) |  |  |

### Return type

[**Card**](Card.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## cards_list

> <CardList> cards_list(opts)

list

Returns a list of your cards. The cards are returned sorted by creation date, with the most recently created addresses appearing first.

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

api_instance = Lob::CardsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'] # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->list: #{e}"
end
```

#### Using the cards_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CardList>, Integer, Hash)> cards_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.cards_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CardList>
rescue Lob::ApiError => e
  puts "Error when calling CardsApi->cards_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |

### Return type

[**CardList**](CardList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

