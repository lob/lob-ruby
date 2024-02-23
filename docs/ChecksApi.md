# Lob::ChecksApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**check_cancel**](ChecksApi.md#check_cancel) | **DELETE** /checks/{chk_id} | cancel |
| [**check_create**](ChecksApi.md#check_create) | **POST** /checks | create |
| [**check_retrieve**](ChecksApi.md#check_retrieve) | **GET** /checks/{chk_id} | get |
| [**checks_list**](ChecksApi.md#checks_list) | **GET** /checks | list |


## check_cancel

> <CheckDeletion> check_cancel(chk_id)

cancel

Completely removes a check from production. This can only be done if the check has a `send_date` and the `send_date` has not yet passed. If the check is successfully canceled, you will not be charged for it. Read more on [cancellation windows](#section/Cancellation-Windows) and [scheduling](#section/Scheduled-Mailings). Scheduling and cancellation is a premium feature. Upgrade to the appropriate [Print & Mail Edition](https://dashboard.lob.com/#/settings/editions) to gain access.

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

api_instance = Lob::ChecksApi.new
chk_id = 'chk_id_example' # String | id of the check

begin
  # cancel
  result = api_instance.cancel(chk_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->cancel: #{e}"
end
```

#### Using the check_cancel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckDeletion>, Integer, Hash)> check_cancel_with_http_info(chk_id)

```ruby
begin
  # cancel
  data, status_code, headers = api_instance.check_cancel_with_http_info(chk_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckDeletion>
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->check_cancel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chk_id** | **String** | id of the check |  |

### Return type

[**CheckDeletion**](CheckDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## check_create

> <Check> check_create(check_editable, opts)

create

Creates a new check with the provided properties.

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

api_instance = Lob::ChecksApi.new
check_editable = Lob::CheckEditable.new({from: TODO, to: TODO, bank_account: 'bank_account_example', amount: 3.56, use_type: Lob::ChkUseType::MARKETING}) # CheckEditable | 
opts = {
  idempotency_key: 'idempotency_key_example' # String | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
}

begin
  # create
  result = api_instance.create(check_editable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->create: #{e}"
end
```

#### Using the check_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Check>, Integer, Hash)> check_create_with_http_info(check_editable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.check_create_with_http_info(check_editable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Check>
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->check_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **check_editable** | [**CheckEditable**](CheckEditable.md) |  |  |
| **idempotency_key** | **String** | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request).  | [optional] |

### Return type

[**Check**](Check.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## check_retrieve

> <Check> check_retrieve(chk_id)

get

Retrieves the details of an existing check. You need only supply the unique check identifier that was returned upon check creation.

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

api_instance = Lob::ChecksApi.new
chk_id = 'chk_id_example' # String | id of the check

begin
  # get
  result = api_instance.get(chk_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->get: #{e}"
end
```

#### Using the check_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Check>, Integer, Hash)> check_retrieve_with_http_info(chk_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.check_retrieve_with_http_info(chk_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Check>
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->check_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **chk_id** | **String** | id of the check |  |

### Return type

[**Check**](Check.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## checks_list

> <CheckList> checks_list(opts)

list

Returns a list of your checks. The checks are returned sorted by creation date, with the most recently created checks appearing first.

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

api_instance = Lob::ChecksApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'}, # Hash<String, String> | Filter by metadata key-value pair`.
  scheduled: true, # Boolean | * `true` - only return orders (past or future) where `send_date` is greater than `date_created` * `false` - only return orders where `send_date` is equal to `date_created` 
  send_date: { key: 'inner_example'}, # Hash<String, String> | Filter by date sent.
  mail_type: Lob::MailType::FIRST_CLASS, # MailType | A string designating the mail postage type: * `usps_first_class` - (default) * `usps_standard` - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. `usps_standard` cannot be used with `4x6` postcards or for any postcards sent outside of the United States. 
  sort_by: Lob::SortBy3.new # SortBy3 | Sorts items by ascending or descending dates. Use either `date_created` or `send_date`, not both. 
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->list: #{e}"
end
```

#### Using the checks_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<CheckList>, Integer, Hash)> checks_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.checks_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <CheckList>
rescue Lob::ApiError => e
  puts "Error when calling ChecksApi->checks_list_with_http_info: #{e}"
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
| **scheduled** | **Boolean** | * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60;  | [optional] |
| **send_date** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date sent. | [optional] |
| **mail_type** | [**MailType**](.md) | A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States.  | [optional][default to &#39;usps_first_class&#39;] |
| **sort_by** | [**SortBy3**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both.  | [optional] |

### Return type

[**CheckList**](CheckList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

