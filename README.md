# lob-ruby

[![Build Status](https://travis-ci.org/lob/lob-ruby.png?branch=master)](https://travis-ci.org/lob/lob-ruby)

Ruby wrapper for the [Lob.com](http://lob.com) API. This gem gives you an ActiveRecord-style syntax to use the Lob.com API.

Supports Ruby 1.9.3 and greater.

## Installation

Add this line to your application's `Gemfile`:

    gem 'lob'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install lob

## Usage

The library uses an ActiveRecord-style interface. You'll feel right at home.
You'll need a Lob.com API key. It's free and you can get yours [here](https://www.lob.com/account).

For optional parameters and other details, refer the docs here - <https://lob.com/docs>

#### Caution: Pass zero-prefixed zip codes as strings

When using zip codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different zip-code than intended.

### Initialization and configuration

```ruby
# To initialize a Lob object
@lob = Lob(api_key: "your-api-key")


# Alternatively, to set the API key for all calls in the future
Lob.api_key = "you-api-key"
@lob = Lob()   # don't forget the paranthesis!
```

#### Or if you want some detailed configuration

```ruby
Lob.configure do |config|
  config.api_key = "your-api-key"  # get your own at http://lob.com :)
  config.api_version = "v1"        # default version
  config.protocol = "https"        # default protocol
  config.api_host = "api.lob.com"  # ofcourse it's Lob
end
```

### Addresses

#### To create an address

```ruby
# name, address, city, state, country and zip are required parameters
@lob.addresses.create(
  name: "John Doe",
  address_line1: "104, Printing Boulevard",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

# You can also pass address_line2
@lob.addresses.create(
  name: "John Doe",
  email: "test@test.com",  # see you can also pass other optional parameters?
  address_line1: "104, Printing Boulevard",
  address_line2: "Sunset Town",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)
```

#### List addresses

```ruby
# returns an array of addresses
@lob.addresses.list

#you can also pass count and offset
@lob.addresses.list(count: 10, offset: 3)
```

#### Find a specific address

```ruby
# returns the address with the corresponding ID
@lob.addresses.find("some-address-id")
```

#### Deletes a specific address

```ruby
# deletes the address with the corresponding ID
@lob.addresses.destroy("some-address-id")
```

### Address verification

```ruby
# verifies and returns an address with more details
@lob.addresses.verify(
      address_line1: "220 WILLIAM T MORRISSEY BLVD",
      city:    "Boston",
      state:   "MA",
      zip:     "02125"
  )
```

### Jobs

#### Create jobs

```ruby
# name, to-address and object are the arguments
# to-address can be specified as an address-id
@lob.jobs.create(
  name: "New Cool Posters",
  from: "from-address-id",
  to: "to-address-id",
  objects: "object-id"
)

# to-address can also be specified as address params to create new address
@lob.jobs.create(
  name: "New Cool Posters",
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  },
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  },
  objects: "object-id"
)

# You can also pass new object params for the object
# and other options like packaging_id an setting_id
@lob.jobs.create(
  name: "New Cool Posters",
  from: "from-address-id",
  to: "to-address-id",
  objects: "object-id",
  {
    name: "Your fantistic object",
    file: "http://test.com/file.pdf",
    setting_id: "some-setting-id"
  }
)

# Or add a job with multiple objects

@lob.jobs.create(
  name: "New Cool Posters",
  from: "from-address-id",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  },
  objects: ["object-id", "another-object-id"]
)

```

#### List jobs

```ruby
# returns an array of jobs
@lob.jobs.list

#you can also pass count and offset
@lob.jobs.list(count: 10, offset: 3)
```

#### Find a specific job

```ruby
# returns the job with the corresponding ID
@lob.jobs.find("some-job-id")
```

### Objects

#### Create objects

```ruby
# You can create by passing the name, file url and setting ID
@lob.objects.create(
  name: "Your fantistic object",
  file: "http://test.com/file.pdf",
  setting_id: "some-setting-id"
)

# You can also pass the quantity as an option
# Or pass a file for upload instead of a url
@lob.objects.create(
  name: "Your fantistic object",
  file: File.new("/path/to/file.pdf"),
  setting_id: "some-setting-id",
  quantity: 12
)
```

#### List objects

```ruby
# returns an array of objects
@lob.objects.list

#you can also pass count and offset
@lob.objects.list(count: 10, offset: 3)
```

#### Find a specific object

```ruby
# returns the object with the corresponding ID
@lob.objects.find("some-object-id")
```

#### Delete a specific object

```ruby
# deletes the object with the corresponding ID
@lob.objects.destroy("some-object-id")
```

### Packagings

#### List packagings

```ruby
# returns a list of packagings
@lob.packagings.list
```

### Postcards

#### Creating post cards

You'll have to specify either the `message` option or the `back` option.

```ruby
# accepts the name, address-id to send to and options
@lob.postcards.create(
  name: "John Joe",
  to: "to-address-id",
  message: front: File.new("/path/to/file.pdf")
)

# create using address params, front, back and from address
@lob.postcards.create(
  name: "John Joe",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  },
  message: "Hey buddy. Waiting to hear your stories",
  front: "http://test.com/file.pdf",
  back: File.new("/path/to/file.pdf"),
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  }
)
```

#### List postcards

```ruby
@lob.postcards.list

#you can also pass count and offset
@lob.postcards.list(count: 10, offset: 3)
```

#### Find a postcard

```ruby
@lob.postcards.find("post-card-id")
```

### Services

#### List services

```ruby
# returns a list of services
@lob.services.list
```

### Bank accounts

#### List bank accounts

```ruby
# returns a list of accounts
@lob.bank_accounts.list
```

#### Add a bank account

```ruby
bank_address = {name: "ToAddress", address_line1: "120, 6th Ave", city: "Boston", country: "US", zip: 12345}
account_address = {name: "ToAddress", address_line1: "120, 6th Ave", city: "Boston", country: "US", zip: 12345}

# Pass address params or address IDs
# The 5th argument is the options argument and is optional
@lob.bank_accounts.create(
  routing_number: "routing_number",
  bank_address: bank_address,
  account_number: "account_number",
  account_address: account_address
)
```

#### Find a bank account

```ruby
@lob.bank_accounts.find("bank-account-id")
```

### Checks

#### Create a check

```ruby
# Transfer $5000 to a bank account.
@lob.checks.create(
  bank_account: "bank-account-id",
  to: "to-address-ID",
  amount: 5000
)

# For the "to" address, you can pass params or an address ID
# You can also specify an optional 4th argument, with other options.
```

#### List checks

```ruby
@lob.checks.list
```

#### Find a check

```ruby
@lob.checks.find("check-id")
```

### Supported countries

#### List supported countries

```ruby
# returns a list of countries
@lob.countries.list
```

## Developing

Make sure you have Ruby 2.0 installed. Copy and paste the following commands in your projects directory.

    git clone https://github.com/lob/lob-ruby.git
    cd lob-ruby
    bundle install

You are powered up and ready to roll ~!

## Running the test-suite

To run the tests, download the required sample files by running the following command:

    bundle exec rake dev:setup

Tests are written using MiniTest, a testing library that comes with Ruby stdlib. The remote responses are tested using [vcr](https://github.com/vcr/vcr).

You'll need to pass in your Lob.com API as the environment variable `LOB_API_KEY`, to run the tests. Be sure to use your Test API key, and not the Live one.

Here's how you can run the tests:

    LOB_API_KEY=your_test_api_key bundle exec rake test


When you make changes to failed tests, then clear out the vcr cassettes to re-record the http requests. You can clear out all the cassettes by running `rm -rf spec/vcr_cassettes`.

You can also configure, TravisCI for your fork of the repository and it'll run the tests for you, when you push.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure the tests pass and add tests if required
6. Create new Pull Request

## Credits

* [Akash Manohar J](http://github.com/HashNuke)

Copyright &copy; 2013 Lob.com

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
