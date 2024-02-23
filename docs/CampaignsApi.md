# Lob::CampaignsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**campaign_create**](CampaignsApi.md#campaign_create) | **POST** /campaigns | create |
| [**campaign_delete**](CampaignsApi.md#campaign_delete) | **DELETE** /campaigns/{cmp_id} | delete |
| [**campaign_retrieve**](CampaignsApi.md#campaign_retrieve) | **GET** /campaigns/{cmp_id} | get |
| [**campaign_update**](CampaignsApi.md#campaign_update) | **PATCH** /campaigns/{cmp_id} | update |
| [**campaigns_list**](CampaignsApi.md#campaigns_list) | **GET** /campaigns | list |


## campaign_create

> <Campaign> campaign_create(campaign_writable, opts)

create

Creates a new campaign with the provided properties. See how to launch your first campaign [here](https://help.lob.com/best-practices/launching-your-first-campaign).

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

api_instance = Lob::CampaignsApi.new
campaign_writable = Lob::CampaignWritable.new({name: 'name_example', schedule_type: Lob::CmpScheduleType::IMMEDIATE, use_type: Lob::CmpUseType::MARKETING}) # CampaignWritable | 
opts = {
  x_lang_output: 'native' # String | * `native` - Translate response to the native language of the country in the request * `match` - match the response to the language in the request  Default response is in English. 
}

begin
  # create
  result = api_instance.create(campaign_writable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->create: #{e}"
end
```

#### Using the campaign_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Campaign>, Integer, Hash)> campaign_create_with_http_info(campaign_writable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.campaign_create_with_http_info(campaign_writable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Campaign>
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->campaign_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **campaign_writable** | [**CampaignWritable**](CampaignWritable.md) |  |  |
| **x_lang_output** | **String** | * &#x60;native&#x60; - Translate response to the native language of the country in the request * &#x60;match&#x60; - match the response to the language in the request  Default response is in English.  | [optional] |

### Return type

[**Campaign**](Campaign.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## campaign_delete

> <CampaignDeletion> campaign_delete(cmp_id)

delete

Delete an existing campaign. You need only supply the unique identifier that was returned upon campaign creation. Deleting a campaign also deletes any associated mail pieces that have been created but not sent. A campaign's `send_date` matches its associated mail pieces' `send_date`s.

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

api_instance = Lob::CampaignsApi.new
cmp_id = 'cmp_id_example' # String | id of the campaign

begin
  # delete
  result = api_instance.delete(cmp_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->delete: #{e}"
end
```

#### Using the campaign_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CampaignDeletion>, Integer, Hash)> campaign_delete_with_http_info(cmp_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.campaign_delete_with_http_info(cmp_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CampaignDeletion>
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->campaign_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cmp_id** | **String** | id of the campaign |  |

### Return type

[**CampaignDeletion**](CampaignDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## campaign_retrieve

> <Campaign> campaign_retrieve(cmp_id)

get

Retrieves the details of an existing campaign. You need only supply the unique campaign identifier that was returned upon campaign creation.

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

api_instance = Lob::CampaignsApi.new
cmp_id = 'cmp_id_example' # String | id of the campaign

begin
  # get
  result = api_instance.get(cmp_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->get: #{e}"
end
```

#### Using the campaign_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Campaign>, Integer, Hash)> campaign_retrieve_with_http_info(cmp_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.campaign_retrieve_with_http_info(cmp_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Campaign>
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->campaign_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cmp_id** | **String** | id of the campaign |  |

### Return type

[**Campaign**](Campaign.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## campaign_update

> <Campaign> campaign_update(cmp_id, campaign_updatable)

update

Update the details of an existing campaign. You need only supply the unique identifier that was returned upon campaign creation.

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

api_instance = Lob::CampaignsApi.new
cmp_id = 'cmp_id_example' # String | id of the campaign
campaign_updatable = Lob::CampaignUpdatable.new # CampaignUpdatable | 

begin
  # update
  result = api_instance.update(cmp_id, campaign_updatable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->update: #{e}"
end
```

#### Using the campaign_update_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Campaign>, Integer, Hash)> campaign_update_with_http_info(cmp_id, campaign_updatable)

```ruby
begin
  # update
  data, status_code, headers = api_instance.campaign_update_with_http_info(cmp_id, campaign_updatable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Campaign>
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->campaign_update_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **cmp_id** | **String** | id of the campaign |  |
| **campaign_updatable** | [**CampaignUpdatable**](CampaignUpdatable.md) |  |  |

### Return type

[**Campaign**](Campaign.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## campaigns_list

> <CampaignsList> campaigns_list(opts)

list

Returns a list of your campaigns. The campaigns are returned sorted by creation date, with the most recently created campaigns appearing first.

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

api_instance = Lob::CampaignsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example' # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->list: #{e}"
end
```

#### Using the campaigns_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CampaignsList>, Integer, Hash)> campaigns_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.campaigns_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CampaignsList>
rescue Lob::ApiError => e
  puts "Error when calling CampaignsApi->campaigns_list_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **limit** | **Integer** | How many results to return. | [optional][default to 10] |
| **include** | [**Array&lt;String&gt;**](String.md) | Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;.  | [optional] |
| **before** | **String** | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response.  | [optional] |
| **after** | **String** | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response.  | [optional] |

### Return type

[**CampaignsList**](CampaignsList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

