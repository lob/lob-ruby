# Migrate from version < v6.0.0

This guide illustrates differences between Lob’s the legacy versions of this SDK and the new current version.

In this guide we compare how `v5.*.*` and >= `v6.0.0` implement the following method pattern.

- CREATE
- LIST
- GET
- DELETE
- VERIFY (BANK ACCOUNTS)
- UPDATE

## INSTALL

Similar to the legacy version, the new lob-ruby SDK is available through `gem`:

```
$ gem install lob
```

## IMPORT AND INITIALIZE


```ruby
require 'lob'
config = Lob::Configuration.default
config.username = ENV['LOB_API_TEST_KEY']
```
You then instantiate the specific resource API that you need access to as follows:

```ruby
api = Lob::ApiClient.new(config)
addressApi = AddressesApi.new(@api)

```

## METHODS

The new SDK version abstracts the request/response interaction out of the calling code such that you create the resource and pass it to the corresponding API in a begin/rescue such that any non-success is an `ApiException` that must be handled.

### COMPARE CREATE METHODS

Here is a sample of the legacy lob-ruby CREATE function:

```ruby
@lob.addresses.create(
  description: 'Harry - Office',
  name: 'Harry Zhang',
  company: 'Lob',
  email: 'harry@lob.com',
  phone: '5555555555',
  address_line1: '210 King St',
  address_line2: '# 6100',
  address_city: 'San Francisco',
  address_state: 'CA',
  address_country: 'US',
  address_zip: '94107'
)
```

Here is a sample of the updated CREATE method

```ruby
addressEditable = AddressEditable.new({
    name: 'Thing T. Thing',
    address_line1: '1313 CEMETERY LN',
    address_city: 'WESTFIELD',
    address_state: 'NJ',
    address_zip: '07000',
})

begin
  response = @addressApi.create(addressEditable)
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```

### COMPARE LIST METHODS

Here is a sample of the legacy lob-ruby LIST method:

```ruby
@lob.addresses.list(limit: 2)
```

Here is a sample of the updated LIST method:

```ruby
begin
  response = @addressApi.list()
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```

### COMPARE GET BY ID METHOD

Here is a sample of the legacy lob-ruby GET method:

```ruby
@lob.addresses.find('adr_xxx')

```

Here is a sample of the updated GET method:

```ruby
begin
  response = @addressApi.get('adr_xxx')
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```

### COMPARE DELETE METHOD

Here is a sample of the legacy lob-ruby DELETE method:

```ruby
@lob.addresses.destroy('adr_xxx')
```

Here is a sample of the updated DELETE method:

```ruby
begin
  response = @addressApi.delete('adr_xxx')
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```

### COMPARE BANK ACCOUNT VERIFY

Here is a sample of the legacy lob-ruby BANK ACCOUNT VERIFY method:

```ruby
@lob.bank_accounts.verify('bank_xxx', amounts: [25, 63])
```

Here is a sample of the updated BANK ACCOUNT VERIFY method:

```ruby
bankVerify = BankAccountVerify.new({ 'amounts': [11, 35] })
begin
  response = @bankAccountApi.verify('bank_xxx', bankVerify)
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```

### COMPARE UPDATE METHOD

Here is a sample of the legacy lob-ruby UPDATE method:

```ruby
This feature was not supported by the legacy library.
```

Here is a sample of the updated UPDATE method:

```ruby
updatableTemplate = TemplateUpdate.new({
    description: 'Updated template for Ruby Integration Test'
})

begin
  updatedTemplate = @templateApi.update('tmpl_xxxx', updatableTemplate)
rescue => e
  puts 'An error of has occcured, message is #{e.message}'
end
```
