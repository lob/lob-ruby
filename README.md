# lob-ruby

[![Build Status](https://travis-ci.org/lob/lob-ruby.svg?branch=master)](https://travis-ci.org/lob/lob-ruby)
[![Gem Version](https://badge.fury.io/rb/lob.svg)](http://badge.fury.io/rb/lob)
[![Dependency Status](https://gemnasium.com/lob/lob-ruby.svg)](https://gemnasium.com/lob/lob-ruby)
[![Coverage Status](https://coveralls.io/repos/lob/lob-ruby/badge.svg?branch=master)](https://coveralls.io/r/lob/lob-ruby?branch=master)
[![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/lob?color=green&type=total)](https://rubygems.org/gems/lob)

Ruby wrapper for the [Lob.com](http://lob.com) API. See the full Lob.com [API Documentation](https://lob.com/docs/ruby).  For best results, be sure that you're using [the latest version](https://lob.com/docs/ruby#version) of the Lob API and the latest version of the ruby wrapper. This gem gives you an ActiveRecord-style syntax to use the Lob.com API.

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

- [Postcards API](https://lob.com/services/postcards)
- [Letters API](https://lob.com/services/letters)
- [Checks API](https://lob.com/services/checks)
- [Area Mail API](https://lob.com/services/area)
- [Address Verification API](https://lob.com/verification/address)

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

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different zip-code than intended.

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
  lob.objects.create(name: "Test", file: "https://lob.com/test.pdf", bad_param: "bad_value")
rescue Lob::InvalidRequestError => e
  e._response.headers[:content_type]
  # => "application/json; charset=utf-8"
end
```

## Examples

We've provided various examples for you to try out [here](https://github.com/lob/lob-ruby/tree/master/examples).

There are simple scripts to demonstrate how to create all the core Lob products (checks, letters, postcards, jobs etc.), as well as more complex examples that utilize other libraries and external files:

- [Creating Dynamic Postcards with HTML and Data](https://github.com/lob/lob-ruby/tree/master/examples/csv_postcards)

## API Documentation

- [Introduction](https://lob.com/docs/ruby#introduction)
- [Versioning](https://lob.com/docs/ruby#version)
- [Errors](https://lob.com/docs/ruby#errors)
- [Rate Limiting](https://lob.com/docs/ruby#rate-limits)
- [Metadata](https://lob.com/docs/ruby#metadata)
- [Asset URLs](https://lob.com/docs/ruby#urls)
- **Addresses**
  - [Address Book](https://lob.com/docs/ruby#addresses)
    - [The Address Object](https://lob.com/docs/ruby#addresses_object)
    - [Create an Address](https://lob.com/docs/ruby#addresses_create)
    - [Retrieve an Address](https://lob.com/docs/ruby#addresses_retrieve)
    - [Delete an Address](https://lob.com/docs/ruby#addresses_delete)
    - [List all Addresses](https://lob.com/docs/ruby#addresses_list)
  - [Address Verification API](https://lob.com/docs/ruby#verify)
    - [Verify an Address](https://lob.com/docs/ruby#verify_create)
- **Postcards API**
  - [Postcards](https://lob.com/docs/ruby#postcards)
    - [The Postcard Object](https://lob.com/docs/ruby#postcards_object)
    - [Create a Postcard](https://lob.com/docs/ruby#postcards_create)
    - [Retrieve a Postcard](https://lob.com/docs/ruby#postcards_retrieve)
    - [List all Postcards](https://lob.com/docs/ruby#postcards_list)
- **Letters API**
  - [Letters](https://lob.com/docs/ruby#letters)
    - [The Letter Object](https://lob.com/docs/ruby#letters_object)
    - [Create a Letter](https://lob.com/docs/ruby#letters_create)
    - [Retrieve a Letter](https://lob.com/docs/ruby#letters_retrieve)
    - [List all Letters](https://lob.com/docs/ruby#letters_list)
- **Checks API**
  - [Checks](https://lob.com/docs/ruby#checks)
    - [The Check Object](https://lob.com/docs/ruby#checks_object)
    - [Create a Check](https://lob.com/docs/ruby#checks_create)
    - [Retrieve a Check](https://lob.com/docs/ruby#checks_retrieve)
    - [List all Checks](https://lob.com/docs/ruby#checks_list)
  - [Bank Accounts](https://lob.com/docs/ruby#bank-accounts)
    - [The Bank Account Object](https://lob.com/docs/ruby#bankaccounts_object)
    - [Create a Bank Account](https://lob.com/docs/ruby#bankaccounts_create)
    - [Retrieve a Bank Account](https://lob.com/docs/ruby#bankaccounts_retrieve)
    - [Delete a Bank Account](https://lob.com/docs/ruby#bankaccounts_delete)
    - [Verify a Bank Account](https://lob.com/docs/ruby#bankaccounts_verify)
    - [List all Bank Accounts](https://lob.com/docs/ruby#bankaccounts_list)
- **Area Mail API**
  - [Areas](https://lob.com/docs/ruby#areas)
    - [The Area Object](https://lob.com/docs/ruby#areas_object)
    - [Create an Area Mailing](https://lob.com/docs/ruby#areas_create)
    - [Retrieve an Area Mailing](https://lob.com/docs/ruby#areas_retrieve)
    - [List all Area Mailings](https://lob.com/docs/ruby#areas_list)
  - [Routes](https://lob.com/docs/ruby#routes)
    - [The Routes Object](https://lob.com/docs/ruby#routes_object)
    - [Retrieve Routes](https://lob.com/docs/ruby#routes_retrieve)
    - [List all Routes](https://lob.com/docs/ruby#routes_list)
- **Resources**
  - [Countries](https://lob.com/docs/ruby#countries)
    - [List all Countries](https://lob.com/docs/ruby#countries_list)
  - [States](https://lob.com/docs/ruby#states)
    - [List all States](https://lob.com/docs/ruby#states_list)
- **Appendix**
  - [API Changelog](https://lob.com/docs/ruby#changelog)
  - [The Tracking Event Object](https://lob.com/docs/ruby#tracking_event_object)
  - [HTML Examples](https://lob.com/docs/ruby#html-examples)
  - [Image Prepping](https://lob.com/docs/ruby#prepping)

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

