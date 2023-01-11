# Lob::BillingGroupsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**billing_group_create**](BillingGroupsApi.md#billing_group_create) | **POST** /billing_groups | create |
| [**billing_group_retrieve**](BillingGroupsApi.md#billing_group_retrieve) | **GET** /billing_groups/{bg_id} | get |
| [**billing_group_update**](BillingGroupsApi.md#billing_group_update) | **POST** /billing_groups/{bg_id} | update |
| [**billing_groups_list**](BillingGroupsApi.md#billing_groups_list) | **GET** /billing_groups | list |


## billing_group_create

> <BillingGroup> billing_group_create(billing_group_editable)

create

Creates a new billing_group with the provided properties.

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

api_instance = Lob::BillingGroupsApi.new
billing_group_editable = Lob::BillingGroupEditable.new({name: 'name_example'}) # BillingGroupEditable | 

begin
  # create
  result = api_instance.create(billing_group_editable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->create: #{e}"
end
```

#### Using the billing_group_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BillingGroup>, Integer, Hash)> billing_group_create_with_http_info(billing_group_editable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.billing_group_create_with_http_info(billing_group_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BillingGroup>
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->billing_group_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **billing_group_editable** | [**BillingGroupEditable**](BillingGroupEditable.md) |  |  |

### Return type

[**BillingGroup**](BillingGroup.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## billing_group_retrieve

> <BillingGroup> billing_group_retrieve(bg_id)

get

Retrieves the details of an existing billing_group. You need only supply the unique billing_group identifier that was returned upon billing_group creation.

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

api_instance = Lob::BillingGroupsApi.new
bg_id = 'bg_id_example' # String | id of the billing_group

begin
  # get
  result = api_instance.get(bg_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->get: #{e}"
end
```

#### Using the billing_group_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BillingGroup>, Integer, Hash)> billing_group_retrieve_with_http_info(bg_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.billing_group_retrieve_with_http_info(bg_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BillingGroup>
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->billing_group_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bg_id** | **String** | id of the billing_group |  |

### Return type

[**BillingGroup**](BillingGroup.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## billing_group_update

> <BillingGroup> billing_group_update(bg_id, billing_group_editable)

update

Updates all editable attributes of the billing_group with the given id.

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

api_instance = Lob::BillingGroupsApi.new
bg_id = 'bg_id_example' # String | id of the billing_group
billing_group_editable = Lob::BillingGroupEditable.new({name: 'name_example'}) # BillingGroupEditable | 

begin
  # update
  result = api_instance.update(bg_id, billing_group_editable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->update: #{e}"
end
```

#### Using the billing_group_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BillingGroup>, Integer, Hash)> billing_group_update_with_http_info(bg_id, billing_group_editable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.billing_group_update_with_http_info(bg_id, billing_group_editable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BillingGroup>
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->billing_group_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bg_id** | **String** | id of the billing_group |  |
| **billing_group_editable** | [**BillingGroupEditable**](BillingGroupEditable.md) |  |  |

### Return type

[**BillingGroup**](BillingGroup.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## billing_groups_list

> <BillingGroupList> billing_groups_list(opts)

list

Returns a list of your billing_groups. The billing_groups are returned sorted by creation date, with the most recently created billing_groups appearing first.

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

api_instance = Lob::BillingGroupsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  offset: 56, # Integer | An integer that designates the offset at which to begin returning results. Defaults to 0.
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  date_modified: { key: 'inner_example'}, # Hash<String, String> | Filter by date modified.
  sort_by_date_modified: Lob::SortByDateModified.new # SortByDateModified | Sorts items by ascending or descending dates. Use either `date_created` or `date_modfied`, not both. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->list: #{e}"
end
```

#### Using the billing_groups_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BillingGroupList>, Integer, Hash)> billing_groups_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.billing_groups_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BillingGroupList>
rescue Lob::ApiError => e
  puts "Error when calling BillingGroupsApi->billing_groups_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **offset** | **Integer** | An integer that designates the offset at which to begin returning results. Defaults to 0. | [optional][default to 0] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |
| **date_created** | [**Hash&lt;String, Time&gt;**](Time.md) | Filter by date created. | [optional] |
| **date_modified** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date modified. | [optional] |
| **sort_by_date_modified** | [**SortByDateModified**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;date_modfied&#x60;, not both.  | [optional] |

### Return type

[**BillingGroupList**](BillingGroupList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

