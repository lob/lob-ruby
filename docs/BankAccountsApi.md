# Lob::BankAccountsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**bank_account_create**](BankAccountsApi.md#bank_account_create) | **POST** /bank_accounts | create |
| [**bank_account_delete**](BankAccountsApi.md#bank_account_delete) | **DELETE** /bank_accounts/{bank_id} | delete |
| [**bank_account_retrieve**](BankAccountsApi.md#bank_account_retrieve) | **GET** /bank_accounts/{bank_id} | get |
| [**bank_account_verify**](BankAccountsApi.md#bank_account_verify) | **POST** /bank_accounts/{bank_id}/verify | verify |
| [**bank_accounts_list**](BankAccountsApi.md#bank_accounts_list) | **GET** /bank_accounts | list |


## bank_account_create

> <BankAccount> bank_account_create(bank_account_writable)

create

Creates a new bank account with the provided properties. Bank accounts created in live mode will need to be verified via micro deposits before being able to send live checks. The deposits will appear in the bank account in 2-3 business days and have the description \"VERIFICATION\".

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

api_instance = Lob::BankAccountsApi.new
bank_account_writable = Lob::BankAccountWritable.new({routing_number: 'routing_number_example', account_number: 'account_number_example', account_type: Lob::BankTypeEnum::COMPANY, signatory: 'signatory_example'}) # BankAccountWritable | 

begin
  # create
  result = api_instance.create(bank_account_writable)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->create: #{e}"
end
```

#### Using the bank_account_create_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BankAccount>, Integer, Hash)> bank_account_create_with_http_info(bank_account_writable)

```ruby
begin
  # create
  data, status_code, headers = api_instance.bank_account_create_with_http_info(bank_account_writable)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BankAccount>
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->bank_account_create_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_account_writable** | [**BankAccountWritable**](BankAccountWritable.md) |  |  |

### Return type

[**BankAccount**](BankAccount.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## bank_account_delete

> <BankAccountDeletion> bank_account_delete(bank_id)

delete

Permanently deletes a bank account. It cannot be undone.

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

api_instance = Lob::BankAccountsApi.new
bank_id = 'bank_id_example' # String | id of the bank account

begin
  # delete
  result = api_instance.delete(bank_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->delete: #{e}"
end
```

#### Using the bank_account_delete_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BankAccountDeletion>, Integer, Hash)> bank_account_delete_with_http_info(bank_id)

```ruby
begin
  # delete
  data, status_code, headers = api_instance.bank_account_delete_with_http_info(bank_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BankAccountDeletion>
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->bank_account_delete_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_id** | **String** | id of the bank account |  |

### Return type

[**BankAccountDeletion**](BankAccountDeletion.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## bank_account_retrieve

> <BankAccount> bank_account_retrieve(bank_id)

get

Retrieves the details of an existing bank account. You need only supply the unique bank account identifier that was returned upon bank account creation.

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

api_instance = Lob::BankAccountsApi.new
bank_id = 'bank_id_example' # String | id of the bank account

begin
  # get
  result = api_instance.get(bank_id)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->get: #{e}"
end
```

#### Using the bank_account_retrieve_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BankAccount>, Integer, Hash)> bank_account_retrieve_with_http_info(bank_id)

```ruby
begin
  # get
  data, status_code, headers = api_instance.bank_account_retrieve_with_http_info(bank_id)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BankAccount>
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->bank_account_retrieve_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_id** | **String** | id of the bank account |  |

### Return type

[**BankAccount**](BankAccount.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json


## bank_account_verify

> <BankAccount> bank_account_verify(bank_id, bank_account_verify)

verify

Verify a bank account in order to create a check.

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

api_instance = Lob::BankAccountsApi.new
bank_id = 'bank_id_example' # String | id of the bank account to be verified
bank_account_verify = Lob::BankAccountVerify.new({amounts: [37]}) # BankAccountVerify | 

begin
  # verify
  result = api_instance.verify(bank_id, bank_account_verify)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->verify: #{e}"
end
```

#### Using the bank_account_verify_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BankAccount>, Integer, Hash)> bank_account_verify_with_http_info(bank_id, bank_account_verify)

```ruby
begin
  # verify
  data, status_code, headers = api_instance.bank_account_verify_with_http_info(bank_id, bank_account_verify)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BankAccount>
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->bank_account_verify_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **bank_id** | **String** | id of the bank account to be verified |  |
| **bank_account_verify** | [**BankAccountVerify**](BankAccountVerify.md) |  |  |

### Return type

[**BankAccount**](BankAccount.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json


## bank_accounts_list

> <BankAccountList> bank_accounts_list(opts)

list

Returns a list of your bank accounts. The bank accounts are returned sorted by creation date, with the most recently created bank accounts appearing first.

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

api_instance = Lob::BankAccountsApi.new
opts = {
  limit: 56, # Integer | How many results to return.
  before: 'before_example', # String | A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the `previous_url` field in the return response. 
  after: 'after_example', # String | A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the `next_url` field in the return response. 
  include: ['inner_example'], # Array<String> | Request that the response include the total count by specifying `include[]=total_count`. 
  date_created: { key: Time.now}, # Hash<String, Time> | Filter by date created.
  metadata: { key: 'inner_example'} # Hash<String, String> | Filter by metadata key-value pair`.
}

begin
  # list
  result = api_instance.list(opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->list: #{e}"
end
```

#### Using the bank_accounts_list_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<BankAccountList>, Integer, Hash)> bank_accounts_list_with_http_info(opts)

```ruby
begin
  # list
  data, status_code, headers = api_instance.bank_accounts_list_with_http_info(opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <BankAccountList>
rescue Lob::ApiError => e
  puts "Error when calling BankAccountsApi->bank_accounts_list_with_http_info: #{e}"
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

### Return type

[**BankAccountList**](BankAccountList.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: Not defined
- **Accept**: application/json

