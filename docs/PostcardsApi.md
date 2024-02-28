# Lob::PostcardsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**postcard_create**](PostcardsApi.md#postcard_create) | **POST** /postcards | create |
| [**postcard_delete**](PostcardsApi.md#postcard_delete) | **DELETE** /postcards/{psc_id} | cancel |
| [**postcard_retrieve**](PostcardsApi.md#postcard_retrieve) | **GET** /postcards/{psc_id} | get |
| [**postcards_list**](PostcardsApi.md#postcards_list) | **GET** /postcards | list |


## postcard_create

> <Postcard> postcard_create(postcard_editable, opts)

create

Creates a new postcard given information

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

api_instance = Lob::PostcardsApi.new
postcard_editable = Lob::PostcardEditable.new({to: TODO, front: 'front_example', back: 'back_example', use_type: Lob::PscUseType::MARKETING}) # PostcardEditable | 
opts = {
  idempotency_key: 'idempotency_key_example' # String | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
}

begin
  # create
  result = api_instance.create(postcard_editable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->create: #{e}"
end
```

#### Using the postcard_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Postcard>, Integer, Hash)> postcard_create_with_http_info(postcard_editable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.postcard_create_with_http_info(postcard_editable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Postcard>
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->postcard_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **postcard_editable** | [**PostcardEditable**](PostcardEditable.md) |  |  |
| **idempotency_key** | **String** | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request).  | [optional] |

### Return type

[**Postcard**](Postcard.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## postcard_delete

> <PostcardDeletion> postcard_delete(psc_id)

cancel

Completely removes a postcard from production. This can only be done if the postcard has a `send_date` and the `send_date` has not yet passed. If the postcard is successfully canceled, you will not be charged for it. Read more on [cancellation windows](#section/Cancellation-Windows) and [scheduling](#section/Scheduled-Mailings). Scheduling and cancellation is a premium feature. Upgrade to the appropriate [Print & Mail Edition](https://dashboard.lob.com/#/settings/editions) to gain access.

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

api_instance = Lob::PostcardsApi.new
psc_id = 'psc_id_example' # String | id of the postcard

begin
  # cancel
  result = api_instance.cancel(psc_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->cancel: #{e}"
end
```

#### Using the postcard_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PostcardDeletion>, Integer, Hash)> postcard_delete_with_http_info(psc_id)

```ruby
begin
  # cancel
  data, status_code, headers = api_instance.postcard_delete_with_http_info(psc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PostcardDeletion>
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->postcard_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **psc_id** | **String** | id of the postcard |  |

### Return type

[**PostcardDeletion**](PostcardDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## postcard_retrieve

> <Postcard> postcard_retrieve(psc_id)

get

Retrieves the details of an existing postcard. You need only supply the unique customer identifier that was returned upon postcard creation.

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

api_instance = Lob::PostcardsApi.new
psc_id = 'psc_id_example' # String | id of the postcard

begin
  # get
  result = api_instance.get(psc_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->get: #{e}"
end
```

#### Using the postcard_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Postcard>, Integer, Hash)> postcard_retrieve_with_http_info(psc_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.postcard_retrieve_with_http_info(psc_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Postcard>
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->postcard_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **psc_id** | **String** | id of the postcard |  |

### Return type

[**Postcard**](Postcard.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## postcards_list

> <PostcardList> postcards_list(opts)

list

Returns a list of your postcards. The addresses are returned sorted by creation date, with the most recently created addresses appearing first.

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

api_instance = Lob::PostcardsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'}, # Hash<String, String> | Filter by metadata key-value pair`.
  size: [Lob::PostcardSize::N4X6], # Array<PostcardSize> | Specifies the size of the postcard. Only `4x6` postcards can be sent to international destinations.
  scheduled: true, # Boolean | * `true` - only return orders (past or future) where `send_date` is greater than `date_created` * `false` - only return orders where `send_date` is equal to `date_created` 
  send_date: { key: 'inner_example'}, # Hash<String, String> | Filter by date sent.
  mail_type: Lob::MailType::FIRST_CLASS, # MailType | A string designating the mail postage type: * `usps_first_class` - (default) * `usps_standard` - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. `usps_standard` cannot be used with `4x6` postcards or for any postcards sent outside of the United States. 
  sort_by: Lob::SortBy4.new # SortBy4 | Sorts items by ascending or descending dates. Use either `date_created` or `send_date`, not both. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->list: #{e}"
end
```

#### Using the postcards_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<PostcardList>, Integer, Hash)> postcards_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.postcards_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <PostcardList>
rescue Lob::ApiError => e
  puts "Error when calling PostcardsApi->postcards_list_with_http_info: #{e}"
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
| **size** | [**Array&lt;PostcardSize&gt;**](PostcardSize.md) | Specifies the size of the postcard. Only &#x60;4x6&#x60; postcards can be sent to international destinations. | [optional] |
| **scheduled** | **Boolean** | * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60;  | [optional] |
| **send_date** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date sent. | [optional] |
| **mail_type** | [**MailType**](.md) | A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States.  | [optional][default to &#39;usps_first_class&#39;] |
| **sort_by** | [**SortBy4**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both.  | [optional] |

### Return type

[**PostcardList**](PostcardList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

