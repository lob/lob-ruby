# lob-ruby

[![Build Status](https://travis-ci.org/lob/lob-ruby.svg?branch=master)](https://travis-ci.org/lob/lob-ruby)
[![Gem Version](https://badge.fury.io/rb/lob.svg)](https://badge.fury.io/rb/lob)
[![Coverage Status](https://coveralls.io/repos/lob/lob-ruby/badge.svg?branch=master)](https://coveralls.io/r/lob/lob-ruby?branch=master)
[![Downloads](https://ruby-gem-downloads-badge.herokuapp.com/lob?color=green&type=total)](https://rubygems.org/gems/lob)

Ruby wrapper for the [Lob.com](https://lob.com) API. See the full Lob.com [API Documentation](https://lob.com/docs/ruby).  For best results, be sure that you're using [the latest version](https://lob.com/docs/ruby#version) of the Lob API and the latest version of the ruby wrapper. This gem gives you an ActiveRecord-style syntax to use the Lob.com API.

Supports Ruby 2.0.0 and greater.

## Table of Contents

- [Getting Started](#getting-started)
  - [Registration](#registration)
  - [Installation](#installation)
  - [Usage](#usage)
- [Examples](#examples)
- [API Documentation](#api-documentation)
- [Contributing](#contributing)
- [Testing](#testing)

## Getting Started

Here's a general overview of the Lob services available, click through to read more.

- [Postcards API](https://lob.com/products/print-mail/postcards)
- [Letters API](https://lob.com/products/print-mail/letters)
- [Checks API](https://lob.com/products/print-mail/checks)
- [Address Verification API](https://lob.com/products/address-verification)

Please read through the official [API Documentation](#api-documentation) to get a complete sense of what to expect from each endpoint.

### Registration

First, you will need to first create an account at [Lob.com](https://dashboard.lob.com/#/register) and obtain your Test and Live API Keys.

Once you have created an account, you can access your API Keys from the [Settings Panel](https://dashboard.lob.com/#/settings).

### Installation

Add this line to your application's `Gemfile`:

    gem 'lob'

And then execute:

    $ bundle

Or manually install it yourself:

    $ gem install lob

### Usage

The library uses an ActiveRecord-style interface. You'll feel right at home.

For optional parameters and other details, refer to the docs [here](https://lob.com/docs/ruby).

#### Initialization and Configuration

```ruby
# To initialize a Lob object
lob = Lob::Client.new(api_key: "your-api-key")

# To initialize a Lob object with an older API version
lob = Lob::Client.new(api_key: "your-api-key", api_version: "2014-12-18")
```

#### Caution: Pass zero-prefixed zip codes as strings

When using zip codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter interprets a number with a leading zero as an octal (i.e., base-8) number and converts it to a base-10 number.  Thus `01000` is converted to the base-10 value `512` (since `8*8*8=512`).  So not quoting might result in an entirely different zip-code than intended.

#### Accessing Response Headers

You can access response headers via a hidden `headers` method on the response hash.

```ruby
addresses = lob.addresses.list

addresses._response.headers[:content_type]
# => "application/json; charset=utf-8"

addresses._response.headers[:rate_limit_window]
# => "60"

addresses._response.headers[:rate_limit_remaining]
# => "1234"
```

You can also access headers from `Lob::InvalidRequestError`s.

```ruby
begin
  lob.objects.create(name: "Test", file: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/incorrect_size.pdf", bad_param: "bad_value")
rescue Lob::InvalidRequestError => e
  e._response.headers[:content_type]
  # => "application/json; charset=utf-8"
end
```

## Examples

We've provided various examples for you to try out [here](https://github.com/lob/lob-ruby/tree/master/examples).

There are simple scripts to demonstrate how to create all the core Lob objects (checks, letters, postcards. etc.) as well as more complex examples that utilize other libraries and external files.

## API Documentation

- [Introduction](https://lob.com/docs/ruby#introduction)
- [Versioning](https://lob.com/docs/ruby#version)
- [Errors](https://lob.com/docs/ruby#errors)
- [Rate Limiting](https://lob.com/docs/ruby#rate-limits)
- [Webhooks](https://lob.com/docs/ruby#webhooks)
- [Cancellation Windows](https://lob.com/docs/ruby#cancellation)
- [Scheduled Mailings](https://lob.com/docs/ruby#scheduled)
- [Metadata](https://lob.com/docs/ruby#metadata)
- [HTML Templates](https://lob.com/docs/ruby#templates)
- [Asset URLs](https://lob.com/docs/ruby#urls)
- **Addresses**
  - [Address Book](https://lob.com/docs/ruby#addresses)
    - [The Address Object](https://lob.com/docs/ruby#addresses_object)
    - [Create an Address](https://lob.com/docs/ruby#addresses_create)
    - [Retrieve an Address](https://lob.com/docs/ruby#addresses_retrieve)
    - [Delete an Address](https://lob.com/docs/ruby#addresses_delete)
    - [List all Addresses](https://lob.com/docs/ruby#addresses_list)
- **US Verification API**
  - [US Verification API](https://lob.com/docs/ruby#us_verifications)
    - [The US Verification Object](https://lob.com/docs/ruby#us_verifications_object)
    - [Verify a US Address](https://lob.com/docs/ruby#us_verifications_create)
    - [The US Zip Lookup Object](https://lob.com/docs/ruby#us_zip_lookups_object)
    - [Lookup a US Zip Code](https://lob.com/docs/ruby#us_zip_lookups_create)
  - [US Autocompletion API](https://lob.com/docs/ruby#us_autocompletions)
    - [The US Autocompletion Object](https://lob.com/docs/ruby#us_autocompletions_object)
    - [Autocomplete a US Address](https://lob.com/docs/ruby#us_autocompletions_create)
    - [The US Autocompletion Test Environment](https://lob.com/docs/ruby#us-autocompletions-test-environment)
- **Int'l Verification API**
  - [International Verifications](https://lob.com/docs/ruby#intl_verifications)
    - [Verify an International Address](https://lob.com/docs/ruby#intl_verifications_create)
- **Postcards API**
  - [Postcards](https://lob.com/docs/ruby#postcards)
    - [The Postcard Object](https://lob.com/docs/ruby#postcards_object)
    - [Create a Postcard](https://lob.com/docs/ruby#postcards_create)
    - [Retrieve a Postcard](https://lob.com/docs/ruby#postcards_retrieve)
    - [Cancel a Postcard](https://lob.com/docs/ruby#postcards_delete)
    - [List all Postcards](https://lob.com/docs/ruby#postcards_list)
- **Letters API**
  - [Letters](https://lob.com/docs/ruby#letters)
    - [The Letter Object](https://lob.com/docs/ruby#letters_object)
    - [Create a Letter](https://lob.com/docs/ruby#letters_create)
    - [Retrieve a Letter](https://lob.com/docs/ruby#letters_retrieve)
    - [Cancel a Letter](https://lob.com/docs/ruby#letters_delete)
    - [List all Letters](https://lob.com/docs/ruby#letters_list)
- **Checks API**
  - [Checks](https://lob.com/docs/ruby#checks)
    - [The Check Object](https://lob.com/docs/ruby#checks_object)
    - [Create a Check](https://lob.com/docs/ruby#checks_create)
    - [Retrieve a Check](https://lob.com/docs/ruby#checks_retrieve)
    - [Cancel a Check](https://lob.com/docs/ruby#checks_delete)
    - [List all Checks](https://lob.com/docs/ruby#checks_list)
  - [Bank Accounts](https://lob.com/docs/ruby#bank-accounts)
    - [The Bank Account Object](https://lob.com/docs/ruby#bankaccounts_object)
    - [Create a Bank Account](https://lob.com/docs/ruby#bankaccounts_create)
    - [Retrieve a Bank Account](https://lob.com/docs/ruby#bankaccounts_retrieve)
    - [Delete a Bank Account](https://lob.com/docs/ruby#bankaccounts_delete)
    - [Verify a Bank Account](https://lob.com/docs/ruby#bankaccounts_verify)
    - [List all Bank Accounts](https://lob.com/docs/ruby#bankaccounts_list)
- **Self Mailers API**
  - [Self Mailers](https://lob.com/docs/ruby#self_mailers)
    - [The Self Mailer Object](https://lob.com/docs/ruby#self_mailers_object)
    - [Create a Self Mailer](https://lob.com/docs/ruby#self_mailers_create)
    - [Retrieve a Self Mailer](https://lob.com/docs/ruby#self_mailers_retrieve)
    - [Cancel a Self Mailer](https://lob.com/docs/ruby#self_mailers_delete)
    - [List all Self Mailers](https://lob.com/docs/ruby#self_mailers_list)
- **Appendix**
  - [API Changelog](https://lob.com/docs/ruby#changelog)
  - [The Tracking Event Object](https://lob.com/docs/ruby#tracking_event_object)
  - [Events](https://lob.com/docs/ruby#events)
  - [HTML Examples](https://lob.com/docs/ruby#html-examples)
  - [Image Prepping](https://lob.com/docs/ruby#prepping)
  - [US Verification Details](https://lob.com/docs/ruby#us_verification_details)

## Contributing

To contribute, please see the [CONTRIBUTING.md](CONTRIBUTING.md) file.

## Testing

Tests are written using MiniTest, a testing library that comes with Ruby stdlib.

Here's how you can run the tests:

    bundle exec rake test

You can also configure, TravisCI for your fork of the repository and it'll run the tests for you, when you push.

=======================

Copyright &copy; 2016 Lob.com

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
