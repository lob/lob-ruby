# lob-ruby

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

TODO

### Initialization and configuration

### Addresses

### Jobs

### Objects

### Packagings

### Postcards

### Services

### Settings



## Developing

Make sure you have Ruby 2.0 installed. Copy and paste the following commands in your projects directory.

    git clone https://github.com/lob/lob-ruby.git
    cd lob
    bundle install

You are powered up and ready to roll ~!

## Running the test-suite

Tests are written using MiniTest, a testing library that comes with Ruby stdlib. The remote responses are tested using [vcr](https://github.com/vcr/vcr).

You'll need to pass in your Lob.com API as the environment variable `LOB_API_KEY`, to run the tests. Be sure to use your Test API key, and not the Live one.

Here's how you can run the tests:

    LOB_API_KEY=your_test_api_key bundle exec rake test


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
