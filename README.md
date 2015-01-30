# lob-ruby

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/lob/lob-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/lob/lob-ruby.svg?branch=master)](https://travis-ci.org/lob/lob-ruby) [![Gem Version](https://badge.fury.io/rb/lob.svg)](http://badge.fury.io/rb/lob) [![Dependency Status](https://gemnasium.com/lob/lob-ruby.svg)](https://gemnasium.com/lob/lob-ruby) [![Coverage Status](https://coveralls.io/repos/lob/lob-ruby/badge.svg?branch=master)](https://coveralls.io/r/lob/lob-ruby?branch=master) [![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/lob?color=green&type=total)](https://rubygems.org/gems/lob)

Ruby wrapper for the [Lob.com](http://lob.com) API. This gem gives you an ActiveRecord-style syntax to use the Lob.com API.

Supports Ruby 1.9.3 and greater.

## Table of Contents

- [Installation](#installation)
- [Usage](#usage)
- [Supported Image Types](#supported-image-types)
- [Initialization and Configuration](#initialization-and-configuration)
- [API Reference](#api-reference)
- [Developing](#developing)
- [Testing](#testing)
- [Contributing](#contributing)

## Installation

Add this line to your application's `Gemfile`:

    gem 'lob'

And then execute:

    $ bundle

Or manually install it yourself:

    $ gem install lob

## Usage

The library uses an ActiveRecord-style interface. You'll feel right at home.
You'll need a Lob.com API key. It's free and you can get yours [here](https://dashboard.lob.com/settings).

For optional parameters and other details, refer to the docs [here](https://lob.com/docs).

#### Caution: Pass zero-prefixed zip codes as strings

When using zip codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different zip-code than intended.

## Supported Image Types

The Lob.com API supports the following image types:

- PDF
- PNG
- JPEG

For more information on prepping images please see the [Lob documentation](https://lob.com/docs#prepping).

#### Creating a PDF

If you need to generate your own PDF programmatically we recommend using [prawn](https://github.com/prawnpdf/prawn). There is an example provided in the examples folder [here](examples/create_pdf.rb).

## Initialization and Configuration

```ruby
# To initialize a Lob object
@lob = Lob.load(api_key: "your-api-key")

# Alternatively, to set the API key for all calls in the future
Lob.api_key = "your-api-key"
@lob = Lob.load
```

#### Or if you want some detailed configuration

```ruby
Lob.configure do |config|
  config.api_key = "your-api-key"    # get your own at http://lob.com :)
  config.api_version = "2014-12-18"  # override the API version
end
```

## API Reference

- [Simple Print Service](#simple-print-service)
  - [lob.jobs](#lobjobs)
    - [lob.jobs.create](#lobjobscreate)
    - [lob.jobs.list](#lobjobslist)
    - [lob.jobs.find](#lobjobsfind)
  - [lob.addresses](#lobaddresses)
    - [lob.addresses.create](#lobaddressescreate)
    - [lob.addresses.list](#lobaddresseslist)
    - [lob.addresses.find](#lobaddressesfind)
    - [lob.addresses.destroy](#lobaddressesdestroy)
    - [lob.addresses.verify](#lobaddressesverify)
  - [lob.objects](#lobobjects)
    - [lob.objects.create](#lobobjectscreate)
    - [lob.objects.list](#lobobjectslist)
    - [lob.objects.find](#lobobjectsfind)
    - [lob.objects.destroy](#lobobjectsdestroy)
  - [lob.settings](#lobsettings)
    - [lob.settings.list](#lobsettingslist)
    - [lob.settings.find](#lobsettingsfind)
  - [lob.packagings](#lobpackagings)
    - [lob.packagings.list](#lobpackagingslist)
  - [lob.services](#lobservices)
    - [lob.services.list](#lobserviceslist)
- [Simple Postcard Service](#simple-postcard-service)
  - [lob.postcards](#lobpostcards)
    - [lob.postcards.create](#lobpostcardscreate)
    - [lob.postcards.list](#lobpostcardslist)
    - [lob.postcards.find](#lobpostcardsfind)
- [Simple Check Service](#simple-check-service)
  - [lob.checks](#lobchecks)
    - [lob.checks.create](#lobcheckscreate)
    - [lob.checks.list](#lobcheckslist)
    - [lob.checks.find](#lobchecksfind)
  - [lob.bank_accounts](#lobbank_accounts)
    - [lob.bank_accounts.create](#lobbank_accountscreate)
    - [lob.bank_accounts.list](#lobbank_accountslist)
    - [lob.bank_accounts.find](#lobbank_accountsfind)
- [Simple Area Mail](#simple-area-mail)
  - [lob.areas](#lobareas)
    - [lob.areas.create](#lobareascreate)
    - [lob.areas.list](#lobareaslist)
    - [lob.areas.find](#lobareasfind)
  - [lob.routes](#lobroutes)
    - [lob.routes.find](#lobroutesfind)
- [Resources](#lobresources)
  - [lob.countries](#lobcountries)
    - [lob.countries.list](#lobcountrieslist)
  - [lob.states](#lobstates)
    - [lob.states.list](#lobstateslist)

## Simple Print Service

### lob.jobs

#### lob.jobs.create

```ruby

# Below is an example with inline addresses and object creation

@lob.jobs.create(
  name: "Inline Test Job",
  from: {
    name:    "Test Address",
    email:  "test@test.com",
    address_line1: "123 Test Street",
    address_line2: "Unit 199",
    city:    "Mountain View",
    state:  "CA",
    country: "US",
    zip:    94085
  },
  to: {
    name:    "TestAddress",
    email:  "test@test.com",
    address_line1: "123 Test Street",
    address_line2: "Unit 199",
    city:    "Mountain View",
    state:  "CA",
    country: "US",
    zip:    94085
  },
  objects: {
    name: "Local File Object",
    file: File.new("/path/to/file.pdf"),
    setting_id: 100
  })


# name, to-address and object are the arguments
# to-address can be specified as an address-id
@lob.jobs.create(
  name: "New Cool Posters",
  from: "from-address-id",
  to: "to-address-id",
  objects: "object-id"
)

# mixing inline objects with ids
@lob.jobs.create(
  name: "New Cool Posters",
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  to: "to-address-id",
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
    setting: "some-setting"
  }
)

# Multi Object Jobs (include more than 1 file)

@lob.jobs.create(
  name: "New Cool Posters",
  from: "from-address-id",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  objects: ["object-id", "another-object-id"]
)



```

#### lob.jobs.list

```ruby
# returns an array of jobs
@lob.jobs.list

#you can also pass count and offset
@lob.jobs.list(count: 10, offset: 3)
```

#### lob.jobs.find

```ruby
# returns the job with the corresponding ID
@lob.jobs.find("some-job-id")
```

### lob.addresses

#### lob.addresses.create

```ruby
# name, address, city, state, country and zip are required parameters
@lob.addresses.create(
  name: "John Doe",
  email: "test@test.com",  # optional
  address_line1: "104, Printing Boulevard",
  address_line2: "Sunset Town", # optional
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)
```

#### lob.addresses.list

```ruby
# returns an array of addresses
@lob.addresses.list

#you can also pass count and offset
@lob.addresses.list(count: 10, offset: 3)
```

#### lob.addresses.find

```ruby
# returns the address with the corresponding ID
@lob.addresses.find("some-address-id")
```

#### lob.addresses.destroy

```ruby
# deletes the address with the corresponding ID
@lob.addresses.destroy("some-address-id")
```

#### lob.addresses.verify

```ruby
# verifies and returns an address with more details
@lob.addresses.verify(
      address_line1: "220 WILLIAM T MORRISSEY BLVD",
      city:    "Boston",
      state:   "MA",
      zip:     "02125"
  )
```

### lob.objects

#### lob.objects.create

```ruby
# You can create an onject by passing the name, file url and setting ID, quantity is defaulted to 1
@lob.objects.create(
  name: "Your fantistic object",
  file: "https://s3-us-west-2.amazonaws.com/lob-assets/test.pdf",
  setting: "201"
)

# You can also pass the quantity as an option
# Or pass a file for upload instead of a url
@lob.objects.create(
  name: "Your fantistic object",
  file: File.new("/path/to/file.pdf"),
  setting: "some-setting",
  quantity: 12
)
```

#### lob.objects.list

```ruby
# returns an array of objects
@lob.objects.list

#you can also pass count and offset
@lob.objects.list(count: 10, offset: 3)
```

#### lob.objects.find

```ruby
# returns the object with the corresponding ID
@lob.objects.find("some-object-id")
```

#### lob.objects.destroy

```ruby
# deletes the object with the corresponding ID
@lob.objects.destroy("some-object-id")
```

### lob.settings

#### lob.settings.list
```ruby
# returns an array of settings
@lob.settings.list
```

#### lob.settings.find
```ruby
# returns a setting object
@lob.settings.find("setting")
```

### lob.packagings

#### lob.packagings.list

```ruby
# returns a list of packagings
@lob.packagings.list
```

### lob.services

#### lob.services.list

```ruby
# returns a list of services
@lob.services.list
```

## Simple Postcard Service

### lob.postcards

#### lob.postcards.create

You'll have to specify either the `message` option or the `back` option.

```ruby


# create postcard with complete customization
@lob.postcards.create(
  name: "John Joe",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  }
  front: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardback.pdf",
  back: File.new("/path/to/file.pdf")
)

# create postcard with templated back

@lob.postcards.create(
  name: "John Joe",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  }
  front: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardback.pdf",
  message: "Hey Buddy, Thanks for Visiting"
)

# sending a new postcard with stored address id
@lob.postcards.create(
  name: "John Joe",
  to: "to-address-id",
  message: "Hey buddy. Waiting to hear your stories",
  front: File.new("/path/to/file.pdf")
)
```

#### lob.postcards.list

```ruby
@lob.postcards.list

#you can also pass count and offset
@lob.postcards.list(count: 10, offset: 3)
```

#### lob.postcards.find

```ruby
@lob.postcards.find("post-card-id")
```

## Simple Check Service

### lob.checks

#### lob.checks.create

```ruby
# For the "to" address, you can pass params
# Transfer $5000 to a bank account.
@lob.checks.create(
  bank_account: "bank-account-id",
  to: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  amount: 5000
)

# or an address ID
@lob.checks.create(
  bank_account: "bank-account-id",
  to: "to-address-ID",
  amount: 5000
)

# You can also specify an optional 4th argument, with other options.
```

#### lob.checks.list

```ruby
@lob.checks.list
```

#### lob.checks.find

```ruby
@lob.checks.find("check-id")
```

### lob.bank_accounts

#### lob.bank_accounts.create

```ruby
bank_address =

account_address =

# Pass address params or address IDs
# The 5th argument is the options argument and is optional
@lob.bank_accounts.create(
  routing_number: "routing_number",
  account_number: "account_number",
  bank_address: {
    name: "ToAddress",
    address_line1: "120 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  },
  account_address: {
    name: "ToAddress",
    address_line1: "120 6th Ave",
    city: "Boston",
    country: "US",
    zip: 12345
  }
)
```

#### lob.bank_accounts.list

```ruby
# returns a list of accounts
@lob.bank_accounts.list
```

#### lob.bank_accounts.find

```ruby
@lob.bank_accounts.find("bank-account-id")
```

## Simple Area Mail

### lob.areas

#### lob.areas.create

You'll have to specify front, back, and either zip_codes or routes

```ruby
# create an area request with routes
@lob.areas.create(
  name: "My Area",
  front: "https://s3-us-west-2.amazonaws.com/lob-assets/areafront.pdf",
  back: "https://s3-us-west-2.amazonaws.com/lob-assets/areaback.pdf",
  routes: ["94158-C001", "94107-C031"],
  target_type: "all",
  full_bleed: "1"
)

# create an area request with zip_codes
@lob.areas.create(
  name: "My Area",
  front: "https://s3-us-west-2.amazonaws.com/lob-assets/areafront.pdf",
  back: "https://s3-us-west-2.amazonaws.com/lob-assets/areaback.pdf",
  zip_codes: ["95678", "94158"],
  target_type: "all",
  full_bleed: "1"
)
```

zip_codes and routes can be a string or an array of strings

#### lob.areas.list
```ruby
@lob.areas.list

# you can also pass count and offset
@lob.areas.list(count: 10, offset: 3)
```

#### lob.areas.find
```ruby
@lob.areas.find("area_id")
```

### lob.routes

You'll have to specify zip_codes

#### lob.routes.find

```ruby
@lob.routes.find(
  zip_codes: ["95678, 94158"]
)
```

zip_codes can be a string or an array of strings

## Resources

### lob.countries

#### lob.countries.list

```ruby
# returns a list of countries
@lob.countries.list
```

### lob.states

#### lob.states.list

```ruby
# returns a list of states
@lob.states.list
```

## Developing

Make sure you have Ruby 2.0 installed. Copy and paste the following commands in your projects directory.

    git clone https://github.com/lob/lob-ruby.git
    cd lob-ruby
    bundle install

You are powered up and ready to roll ~!

## Testing

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
5. Make sure the tests pass
6. Open up coverage/index.html in your browser and add tests if required
7. Create new Pull Request

## Credits

* [Akash Manohar J](http://github.com/HashNuke)

Copyright &copy; 2013 Lob.com

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
