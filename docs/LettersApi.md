# Lob::LettersApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**letter_cancel**](LettersApi.md#letter_cancel) | **DELETE** /letters/{ltr_id} | cancel |
| [**letter_create**](LettersApi.md#letter_create) | **POST** /letters | create |
| [**letter_retrieve**](LettersApi.md#letter_retrieve) | **GET** /letters/{ltr_id} | get |
| [**letters_list**](LettersApi.md#letters_list) | **GET** /letters | list |


## letter_cancel

> <LetterDeletion> letter_cancel(ltr_id)

cancel

Completely removes a letter from production. This can only be done if the letter has a `send_date` and the `send_date` has not yet passed. If the letter is successfully canceled, you will not be charged for it. Read more on [cancellation windows](#section/Cancellation-Windows) and [scheduling](#section/Scheduled-Mailings). Scheduling and cancellation is a premium feature. Upgrade to the appropriate [Print & Mail Edition](https://dashboard.lob.com/#/settings/editions) to gain access.

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

api_instance = Lob::LettersApi.new
ltr_id = 'ltr_id_example' # String | id of the letter

begin
  # cancel
  result = api_instance.cancel(ltr_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->cancel: #{e}"
end
```

#### Using the letter_cancel_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LetterDeletion>, Integer, Hash)> letter_cancel_with_http_info(ltr_id)

```ruby
begin
  # cancel
  data, status_code, headers = api_instance.letter_cancel_with_http_info(ltr_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LetterDeletion>
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->letter_cancel_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ltr_id** | **String** | id of the letter |  |

### Return type

[**LetterDeletion**](LetterDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## letter_create

> <Letter> letter_create(letter_editable, opts)

create

Creates a new letter given information

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

api_instance = Lob::LettersApi.new
letter_editable = Lob::LetterEditable.new({color: false, to: TODO, from: TODO, file: 'file_example', use_type: Lob::LtrUseType::MARKETING}) # LetterEditable | 
opts = {
  idempotency_key: 'idempotency_key_example', # String | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
  file: TODO # Object | An optional file upload as either a byte array or file type. 
}

begin
  # create
  result = api_instance.create(letter_editable, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->create: #{e}"
end
```

#### Using the letter_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Letter>, Integer, Hash)> letter_create_with_http_info(letter_editable, opts)

```ruby
begin
  # create
  data, status_code, headers = api_instance.letter_create_with_http_info(letter_editable, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Letter>
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->letter_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **letter_editable** | [**LetterEditable**](LetterEditable.md) |  |  |
| **idempotency_key** | **String** | A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request).  | [optional] |
| **file** | [**Object**](.md) | An optional file upload as either a byte array or file type.  | [optional] |

### Return type

[**Letter**](Letter.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## letter_retrieve

> <Letter> letter_retrieve(ltr_id)

get

Retrieves the details of an existing letter. You need only supply the unique letter identifier that was returned upon letter creation.

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

api_instance = Lob::LettersApi.new
ltr_id = 'ltr_id_example' # String | id of the letter

begin
  # get
  result = api_instance.get(ltr_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->get: #{e}"
end
```

#### Using the letter_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<Letter>, Integer, Hash)> letter_retrieve_with_http_info(ltr_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.letter_retrieve_with_http_info(ltr_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <Letter>
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->letter_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **ltr_id** | **String** | id of the letter |  |

### Return type

[**Letter**](Letter.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## letters_list

> <LetterList> letters_list(opts)

list

Returns a list of your letters. The letters are returned sorted by creation date, with the most recently created letters appearing first.

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

api_instance = Lob::LettersApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'}, # Hash<String, String> | Filter by metadata key-value pair`.
  color: true, # Boolean | Set to `true` to return only color letters. Set to `false` to return only black & white letters.
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
  puts "Error when calling LettersApi->list: #{e}"
end
```

#### Using the letters_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<LetterList>, Integer, Hash)> letters_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.letters_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <LetterList>
rescue Lob::ApiError => e
  puts "Error when calling LettersApi->letters_list_with_http_info: #{e}"
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
| **color** | **Boolean** | Set to &#x60;true&#x60; to return only color letters. Set to &#x60;false&#x60; to return only black &amp; white letters. | [optional] |
| **scheduled** | **Boolean** | * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60;  | [optional] |
| **send_date** | [**Hash&lt;String, String&gt;**](String.md) | Filter by date sent. | [optional] |
| **mail_type** | [**MailType**](.md) | A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States.  | [optional][default to &#39;usps_first_class&#39;] |
| **sort_by** | [**SortBy4**](.md) | Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both.  | [optional] |

### Return type

[**LetterList**](LetterList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

