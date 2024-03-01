# Lob::SnapPacksApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**snap_pack_create**](SnapPacksApi.md#snap_pack_create) | **POST** /snap_packs | create |
| [**snap_pack_delete**](SnapPacksApi.md#snap_pack_delete) | **DELETE** /snap_packs/{snp_id} | delete |
| [**snap_pack_retrieve**](SnapPacksApi.md#snap_pack_retrieve) | **GET** /snap_packs/{snp_id} | get |
| [**snap_packs_list**](SnapPacksApi.md#snap_packs_list) | **GET** /snap_packs | list |


## snap_pack_create

> <SnapPack> snap_pack_create(snap_pack_editable, opts)

create

Creates a new snap_pack given information

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

api_instance = Lob::SnapPacksApi.new
snap_pack_editable = Lob::SnapPackEditable.new({to: TODO, inside: 'inside_example', outside: 'outside_example', use_type: Lob::SnpUseType::MARKETING}) # SnapPackEditable | 
opts = {
  idempotency_key: 'idempotency_key_example' # String | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
}

begin
  # create
  result = api_instance.create(snap_pack_editable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->create: #{e}"
end
```

#### Using the snap_pack_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SnapPack>, Integer, Hash)> snap_pack_create_with_http_info(snap_pack_editable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.snap_pack_create_with_http_info(snap_pack_editable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SnapPack>
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->snap_pack_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snap_pack_editable** | [**SnapPackEditable**](SnapPackEditable.md) |  |  |
| **idempotency_key** | **String** | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request).  | [optional] |

### Return type

[**SnapPack**](SnapPack.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## snap_pack_delete

> <SnapPackDeletion> snap_pack_delete(snp_id)

delete

Completely removes a snap pack from production. This can only be done if the snap pack's `send_date` has not yet passed.

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

api_instance = Lob::SnapPacksApi.new
snp_id = 'snp_id_example' # String | id of the snap_pack

begin
  # delete
  result = api_instance.delete(snp_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->delete: #{e}"
end
```

#### Using the snap_pack_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SnapPackDeletion>, Integer, Hash)> snap_pack_delete_with_http_info(snp_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.snap_pack_delete_with_http_info(snp_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SnapPackDeletion>
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->snap_pack_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snp_id** | **String** | id of the snap_pack |  |

### Return type

[**SnapPackDeletion**](SnapPackDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## snap_pack_retrieve

> <SnapPack> snap_pack_retrieve(snp_id)

get

Retrieves the details of an existing snap_pack. You need only supply the unique snap_pack identifier that was returned upon snap_pack creation.

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

api_instance = Lob::SnapPacksApi.new
snp_id = 'snp_id_example' # String | id of the snap_pack

begin
  # get
  result = api_instance.get(snp_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->get: #{e}"
end
```

#### Using the snap_pack_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SnapPack>, Integer, Hash)> snap_pack_retrieve_with_http_info(snp_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.snap_pack_retrieve_with_http_info(snp_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SnapPack>
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->snap_pack_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **snp_id** | **String** | id of the snap_pack |  |

### Return type

[**SnapPack**](SnapPack.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## snap_packs_list

> <SnapPackList> snap_packs_list(opts)

list

Returns a list of your Snap Packs. The snap packs are returned sorted by creation date, with the most recently created snap packs appearing first.

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

api_instance = Lob::SnapPacksApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'}, # Hash<String, String> | Filter by metadata key-value pair`.
  size: [Lob::SnapPackSize::N8_5X11], # Array<SnapPackSize> | The Snap Pack sizes to be returned.
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
  puts "Error when calling SnapPacksApi->list: #{e}"
end
```

#### Using the snap_packs_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<SnapPackList>, Integer, Hash)> snap_packs_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.snap_packs_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <SnapPackList>
rescue Lob::ApiError => e
  puts "Error when calling SnapPacksApi->snap_packs_list_with_http_info: #{e}"
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
| **size** | [**Array&lt;SnapPackSize&gt;**](SnapPackSize.md) | The Snap Pack sizes to be returned. | [optional] |
| **scheduled** | **Boolean** | * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60;  | [optional] |
| **send_date** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date sent. | [optional] |
| **mail_type** | [**MailType**](.md) | A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States.  | [optional][default to &#39;usps_first_class&#39;] |
| **sort_by** | [**SortBy4**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both.  | [optional] |

### Return type

[**SnapPackList**](SnapPackList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

