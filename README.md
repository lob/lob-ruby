# lob-ruby

[![Gitter](https://badges.gitter.im/Join%20Chat.svg)](https://gitter.im/lob/lob-ruby?utm_source=badge&utm_medium=badge&utm_campaign=pr-badge&utm_content=badge)

[![Build Status](https://travis-ci.org/lob/lob-ruby.svg?branch=master)](https://travis-ci.org/lob/lob-ruby) [![Gem Version](https://badge.fury.io/rb/lob.svg)](http://badge.fury.io/rb/lob) [![Dependency Status](https://gemnasium.com/lob/lob-ruby.svg)](https://gemnasium.com/lob/lob-ruby) [![Coverage Status](https://coveralls.io/repos/lob/lob-ruby/badge.svg?branch=master)](https://coveralls.io/r/lob/lob-ruby?branch=master) [![Downloads](http://ruby-gem-downloads-badge.herokuapp.com/lob?color=green&type=total)](https://rubygems.org/gems/lob)

Ruby wrapper for the [Lob.com](http://lob.com) API. See full Lob.com documentation [here](https://lob.com/docs/ruby). This gem gives you an ActiveRecord-style syntax to use the Lob.com API.

Supports Ruby 1.9.3 and greater.

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

- [Simple Print Service](https://lob.com/services/sps)
- [Simple Postcard Service](https://lob.com/services/postcards)
- [Simple Check Service](https://lob.com/services/postcards)
- [Simple Area Mail](https://lob.com/services/sam)
- [Address Verification](https://lob.com/verification/address)

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

#### Caution: Pass zero-prefixed zip codes as strings

When using zip codes with zero-prefixes, always quote them. For example when specifying `02125`, pass it as a string `"02125"`, instead of an integer.

The Ruby interpreter assumes it's not of base-10 and tries to convert it to base-10 number. So that might result in an entirely different zip-code than intended.

## Examples

We've provided various examples for you to try out [here](https://github.com/lob/lob-ruby/tree/master/examples).

## API Documentation

- [Introduction](https://lob.com/docs/ruby#introduction)
- [Versioning](https://lob.com/docs/ruby#version)
- [Image Prepping](https://lob.com/docs/ruby#prepping)
- **Simple Print Service**
  - [Jobs](https://lob.com/docs/ruby#jobs)
    - [Create a Job](https://lob.com/docs/ruby#jobs_create)
    - [Retrieve a Job](https://lob.com/docs/ruby#jobs_retrieve)
    - [List all Jobs](https://lob.com/docs/ruby#jobs_list)
  - [Addresses](https://lob.com/docs/ruby#addresses)
    - [Create an Address](https://lob.com/docs/ruby#addresses_create)
    - [Retrieve an Address](https://lob.com/docs/ruby#addresses_retrieve)
    - [Delete an Address](https://lob.com/docs/ruby#addresses_delete)
    - [List all Addresses](https://lob.com/docs/ruby#addresses_list)
  - [Objects](https://lob.com/docs/ruby#objects)
    - [Create an Object](https://lob.com/docs/ruby#objects_create)
    - [Retrieve an Object](https://lob.com/docs/ruby#objects_retrieve)
    - [Delete an Object](https://lob.com/docs/ruby#objects_delete)
    - [List all Objects](https://lob.com/docs/ruby#objects_list)
  - [Settings](https://lob.com/docs/ruby#settings)
    - [Retrieve a Setting](https://lob.com/docs/ruby#settings_retrieve)
    - [List all Settings](https://lob.com/docs/ruby#settings_list)
  - [Services](https://lob.com/docs/ruby#services)
    - [List all Services](https://lob.com/docs/ruby#services_list)
- **Simple Postcard Service**
  - [Postcards](https://lob.com/docs/ruby#postcards)
    - [Create a Postcard](https://lob.com/docs/ruby#postcards_create)
    - [Retrieve a Postcard](https://lob.com/docs/ruby#postcards_retrieve)
    - [List all Postcards](https://lob.com/docs/ruby#postcards_list)
- **Simple Check Service**
  - [Checks](https://lob.com/docs/ruby#checks)
    - [Create a Check](https://lob.com/docs/ruby#checks_create)
    - [Retrieve a Check](https://lob.com/docs/ruby#checks_retrieve)
    - [List all Checks](https://lob.com/docs/ruby#checks_list)
  - [Bank Accounts](https://lob.com/docs/ruby#bank-accounts)
    - [Create a Bank Account](https://lob.com/docs/ruby#bankaccounts_create)
    - [Retrieve a Bank Account](https://lob.com/docs/ruby#bankaccounts_retrieve)
    - [List all Bank Accounts](https://lob.com/docs/ruby#bankaccounts_list)
    - [Verify a Bank Account](https://lob.com/docs/ruby#bankaccounts_verify)
    - [Delete a Bank Account](https://lob.com/docs/ruby#bankaccounts_delete)
- **Simple Area Mail**
  - [Areas](https://lob.com/docs/ruby#areas)
    - [Create an Area Mailing](https://lob.com/docs/ruby#areas_create)
    - [Retrieve an Area Mailing](https://lob.com/docs/ruby#areas_retrieve)
    - [List all Area Mailings](https://lob.com/docs/ruby#areas_list)
  - [Routes](https://lob.com/docs/ruby#routes)
    - [Retrieve a Zip Code](https://lob.com/docs/ruby#routes_retrieve)
    - [List all Zip Codes](https://lob.com/docs/ruby#routes_list)
- **Simple Address Verification**
  - [Verify](https://lob.com/docs/ruby#verify)
    - [Verify an Address](https://lob.com/docs/ruby#verify_create)
- **Resources**
  - [Countries](https://lob.com/docs/ruby#countries)
    - [List all Countries](https://lob.com/docs/ruby#countries_list)
  - [States](https://lob.com/docs/ruby#states)
    - [List all States](https://lob.com/docs/ruby#states_list)
- **Appendix**
  - [SPS Templates](https://lob.com/docs/ruby#sps-templates)
  - [Custom Fonts with HTML](https://lob.com/docs/ruby#html-fonts)
  - [Postcard HTML Examples](https://lob.com/docs/ruby#postcard-examples)
  - [Area HTML Examples](https://lob.com/docs/ruby#area-examples)
  - [Letter HTML Examples](https://lob.com/docs/ruby#letter-examples)

## Contributing

Make sure you have Ruby 2.0 installed. Copy and paste the following commands in your projects directory.

    git clone https://github.com/lob/lob-ruby.git
    cd lob-ruby
    bundle install

### Contributing Instructions

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Make sure the tests pass
6. Open up coverage/index.html in your browser and add tests if required
7. Create new Pull Request

## Testing

To run the tests, download the required sample files by running the following command:

    bundle exec rake dev:setup

Tests are written using MiniTest, a testing library that comes with Ruby stdlib. The remote responses are tested using [vcr](https://github.com/vcr/vcr).

You'll need to pass in your Lob.com API as the environment variable `LOB_API_KEY`, to run the tests. Be sure to use your Test API key, and not the Live one.

Here's how you can run the tests:

    LOB_API_KEY=your_test_api_key bundle exec rake test

When you make changes to failed tests, then clear out the vcr cassettes to re-record the http requests. You can clear out all the cassettes by running `rm -rf spec/vcr_cassettes`.

You can also configure, TravisCI for your fork of the repository and it'll run the tests for you, when you push.

=======================

Copyright &copy; 2013 Lob.com

Released under the MIT License, which can be found in the repository in `LICENSE.txt`.
