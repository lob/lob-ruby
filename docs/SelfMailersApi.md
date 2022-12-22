# OpenapiClient::SelfMailersApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**self_mailer_create**](SelfMailersApi.md#self_mailer_create) | **POST** /self_mailers | create |
| [**self_mailer_delete**](SelfMailersApi.md#self_mailer_delete) | **DELETE** /self_mailers/{sfm_id} | delete |
| [**self_mailer_retrieve**](SelfMailersApi.md#self_mailer_retrieve) | **GET** /self_mailers/{sfm_id} | get |
| [**self_mailers_list**](SelfMailersApi.md#self_mailers_list) | **GET** /self_mailers | list |


## self_mailer_create

> <SelfMailer> self_mailer_create(self_mailer_editable, opts)

create

Creates a new self_mailer given information

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

api_instance = OpenapiClient::SelfMailersApi.new
self_mailer_editable = OpenapiClient::SelfMailerEditable.new({to: 'to_example', inside: 'inside_example', outside: 'outside_example'}) # SelfMailerEditable | 
opts = {
  idempotency_key: 'idempotency_key_example' # String | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
}

begin
  # create
  result = api_instance.create(self_mailer_editable, opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->create: #{e}"
end
```

#### Using the self_mailer_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SelfMailer>, Integer, Hash)> self_mailer_create_with_http_info(self_mailer_editable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.self_mailer_create_with_http_info(self_mailer_editable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SelfMailer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->self_mailer_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **self_mailer_editable** | [**SelfMailerEditable**](SelfMailerEditable.md) |  |  |
| **idempotency_key** | **String** | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request).  | [optional] |

### Return type

[**SelfMailer**](SelfMailer.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## self_mailer_delete

> <SelfMailerDeletion> self_mailer_delete(sfm_id)

delete

Completely removes a self mailer from production. This can only be done if the self mailer's `send_date` has not yet passed.

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

api_instance = OpenapiClient::SelfMailersApi.new
sfm_id = 'sfm_id_example' # String | id of the self_mailer

begin
  # delete
  result = api_instance.delete(sfm_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->delete: #{e}"
end
```

#### Using the self_mailer_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SelfMailerDeletion>, Integer, Hash)> self_mailer_delete_with_http_info(sfm_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.self_mailer_delete_with_http_info(sfm_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SelfMailerDeletion>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->self_mailer_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sfm_id** | **String** | id of the self_mailer |  |

### Return type

[**SelfMailerDeletion**](SelfMailerDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## self_mailer_retrieve

> <SelfMailer> self_mailer_retrieve(sfm_id)

get

Retrieves the details of an existing self_mailer. You need only supply the unique self_mailer identifier that was returned upon self_mailer creation.

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

api_instance = OpenapiClient::SelfMailersApi.new
sfm_id = 'sfm_id_example' # String | id of the self_mailer

begin
  # get
  result = api_instance.get(sfm_id)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->get: #{e}"
end
```

#### Using the self_mailer_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SelfMailer>, Integer, Hash)> self_mailer_retrieve_with_http_info(sfm_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.self_mailer_retrieve_with_http_info(sfm_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SelfMailer>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->self_mailer_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **sfm_id** | **String** | id of the self_mailer |  |

### Return type

[**SelfMailer**](SelfMailer.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## self_mailers_list

> <SelfMailerList> self_mailers_list(opts)

list

Returns a list of your self_mailers. The self_mailers are returned sorted by creation date, with the most recently created self_mailers appearing first.

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

api_instance = OpenapiClient::SelfMailersApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'}, # Hash<String, String> | Filter by metadata key-value pair`.
  size: [OpenapiClient::SelfMailerSize::N6X18_BIFOLD], # Array<SelfMailerSize> | The self mailer sizes to be returned.
  scheduled: true, # Boolean | * `true` - only return orders (past or future) where `send_date` is greater than `date_created` * `false` - only return orders where `send_date` is equal to `date_created` 
  send_date: { key: 'inner_example'}, # Hash<String, String> | Filter by date sent.
  mail_type: OpenapiClient::MailType::FIRST_CLASS, # MailType | A string designating the mail postage type: * `usps_first_class` - (default) * `usps_standard` - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. `usps_standard` cannot be used with `4x6` postcards or for any postcards sent outside of the United States. 
  sort_by: OpenapiClient::SortBy3.new # SortBy3 | Sorts items by ascending or descending dates. Use either `date_created` or `send_date`, not both. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->list: #{e}"
end
```

#### Using the self_mailers_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SelfMailerList>, Integer, Hash)> self_mailers_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.self_mailers_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SelfMailerList>
rescue OpenapiClient::ApiError => e
  puts "Error when calling SelfMailersApi->self_mailers_list_with_http_info: #{e}"
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
| **size** | [**Array&lt;SelfMailerSize&gt;**](SelfMailerSize.md) | The self mailer sizes to be returned. | [optional] |
| **scheduled** | **Boolean** | * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60;  | [optional] |
| **send_date** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date sent. | [optional] |
| **mail_type** | [**MailType**](.md) | A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States.  | [optional][default to &#39;usps_first_class&#39;] |
| **sort_by** | [**SortBy3**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both.  | [optional] |

### Return type

[**SelfMailerList**](SelfMailerList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

