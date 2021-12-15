## [**5.4.3**](https://github.com/lob/lob-ruby/releases/tag/v5.4.3) (2021-12-15)
- [**199**](https://github.com/lob/lob-ruby/pull/199) Refactor ResourceBase to make the options sent to rest-client more configurable
## [**5.4.1**](https://github.com/lob/lob-ruby/releases/tag/v5.4.1) (2021-09-28)
- [**193**](https://github.com/lob/lob-ruby/pull/193) Minor patches
## [**5.4.0**](https://github.com/lob/lob-ruby/releases/tag/v5.4.0) (2021-09-21)
- [**191**](https://github.com/lob/lob-ruby/pull/191) Add support for reverse geocoding endpoint
## [**5.3.0**](https://github.com/lob/lob-ruby/releases/tag/v5.3.0) (2021-08-25)
- [**190**](https://github.com/lob/lob-ruby/pull/190) Adds support for bulk AV endpoints
## [**5.2.0**](https://github.com/lob/lob-ruby/releases/tag/v5.2.0) (2021-05-03)
- [**188**](https://github.com/lob/lob-ruby/pull/188) Adds support for Self Mailers
## 5.1.2 (2021-02-18)

##### Chores and Bug Fixes

- [**185**](https://github.com/lob/lob-ruby/pull/185) Bumps rake to 12.3.3, adds Ruby 2.7, update example asset links, other cleanup.
## 5.1.1 (2020-05-21)

##### Chores

* **intl-verification:**  update international verifications test mode fix ([#179](https://github.com/lob/lob-ruby/pull/179)) ([4ab7e7e2](https://github.com/lob/lob-ruby/commit/4ab7e7e2852706c37b00bd8f2df58207897bc0a3))

##### Bug Fixes

* **merge-variables:**  convert to json ([fa93885f](https://github.com/lob/lob-ruby/commit/fa93885f2aab4537e100b82d8a9f53cdec042f2e))

## [**5.1.0**](https://github.com/lob/lob-ruby/releases/tag/v5.1.0)
- [**176**](https://github.com/lob/lob-ruby/pull/176) Adds support for Group Members (beta feature)
- [**175**](https://github.com/lob/lob-ruby/pull/175) Adds support for Groups (beta feature)
- [**174**](https://github.com/lob/lob-ruby/pull/174) Add Ruby 2.5-6, remove API keys, other cleanup
- [**173**](https://github.com/lob/lob-ruby/pull/173) Update example asset links

## 5.0.0

Version 5.0.0 introduces a breaking change. It removes support for the area mail resources (`Areas` and `Routes`).

* Removes `Lob.areas`.
* Removes `Lob.routes`.

## [**4.3.0**](https://github.com/lob/lob-ruby/releases/tag/v4.3.0)
- [**171**](https://github.com/lob/lob-ruby/pull/171) add USAutocompletions
- [**170**](https://github.com/lob/lob-ruby/pull/170) Fix test name

## [**4.2.0**](https://github.com/lob/lob-ruby/releases/tag/v4.2.0)
- [**169**](https://github.com/lob/lob-ruby/pull/169) Support 'case' param for us_verifications
- [**168**](https://github.com/lob/lob-ruby/pull/168) tweak wording around handling numbers with leading zeros
- [**167**](https://github.com/lob/lob-ruby/pull/167) remove duplicate test
- [**166**](https://github.com/lob/lob-ruby/pull/166) Fix commented check amount in checks.rb example

## [**4.1.2**](https://github.com/lob/lob-ruby/releases/tag/v4.1.2)
- [**#165**] (https://github.com/lob/lob-ruby/pull/165) Remove states and countries API resources. Also remove the ability to use postcard.message.

## [**4.1.1**](https://github.com/lob/lob-ruby/releases/tag/v4.1.1)
- [**#160**] (https://github.com/lob/lob-ruby/pull/160) adds capability to pass in idempotency headers

## [**4.1.0**](https://github.com/lob/lob-ruby/releases/tag/v4.1.0)
- [**#158**] (https://github.com/lob/lob-ruby/pull/158) add US Zip Lookups API endpoint to wrapper

## 4.0.0

Version 4.0.0 introduces a breaking change. It requires a minimum API version of `2017-05-17`, which introduces new US and International Verification APIs.

* Removes `Lob.addresses.verify()`. Please use `Lob.us_verifications.verify()` and `Lob.intl_verifications.verify() instead.

## 3.0.0

Version 3.0.0 introduces several breaking changes. It requires a minimum API version of `2015-04-11`.

* Ruby 1.9.3 is no longer supported. lob-ruby now supports Ruby versions at or above 2.0.0.
* Jobs and Objects resources have been deprecated from the gem.
* Resources have been moved from `Lob::V1` to the `Lob::Resources` namespace and have been refactored to contain the HTTP request/response logic..
* Configuration for the Lob Client has been changed. `Lob()`, `Lob.load`, and `Lob.configure` have all been deprecated and replaced with a single method of configuration: `Lob::Client.new(api_key: "your-api-key")`.

## [**2.5.1**](https://github.com/lob/lob-ruby/releases/tag/v2.5.1)
- [**#145**] (https://github.com/lob/lob-ruby/pull/145) More lenient rest-client version restriction

## [**2.5.0**](https://github.com/lob/lob-ruby/releases/tag/v2.5.0)
- [**#140**] (https://github.com/lob/lob-ruby/pull/140) Adds access to response and headers

## [**2.4.0**](https://github.com/lob/lob-ruby/releases/tag/v2.4.0)
- [**#136**] (https://github.com/lob/lob-ruby/pull/136) Adds find to routes

## [**2.3.0**](https://github.com/lob/lob-ruby/releases/tag/v2.3.0)
- [**#130**] (https://github.com/lob/lob-ruby/pull/130) Removed services endpoint support

## [**2.2.0**](https://github.com/lob/lob-ruby/releases/tag/v2.2.0)
- [**#129**] (https://github.com/lob/lob-ruby/pull/129) Adds support for API version 2015-11-06

## [**2.1.2**](https://github.com/lob/lob-ruby/releases/tag/v2.1.2)
- [**#127**] (https://github.com/lob/lob-ruby/pull/127) Ensure JSON.parse is never passes nil

## [**2.1.1**](https://github.com/lob/lob-ruby/releases/tag/v2.1.1)
- [**#124**] (https://github.com/lob/lob-ruby/pull/124) routes#find accepts single ZIP code

## [**2.1.0**](https://github.com/lob/lob-ruby/releases/tag/v2.1.0)
- [**#119**] (https://github.com/lob/lob-ruby/pull/119) better error messages

## [**2.0.1**](https://github.com/lob/lob-ruby/releases/tag/v2.0.1)
- [**#118**] (https://github.com/lob/lob-ruby/pull/118) removed prawn and fixed examples

## 2.0.0

Version 2.0.0 introduces several breaking changes. It requires a minimum API version of `2015-04-11`.

* The lob-ruby gem no longer converts `city`, `state`, etc. parameters into `address_city`, `address_state`, etc. This change was made to be more consistent with the API and other Lob wrappers, and to prevent confusion.
* The wrapper now returns the raw JSON from the API in all `list` endpoints rather than just the `data` field in the response. This will allow access to additional fields like `count` and `offset`.
* The `packagings` endpoint is not longer supporter in the API, and therefore has been taken out of lob-ruby.

In addition to these breaking changes, the test suite was cleaned up by removing the unnecessary VCR gem and committing sample upload files to the repository rather than downloading them in rake task.

## [**1.13.0**](https://github.com/lob/lob-ruby/releases/tag/v1.13.0)
- [**#112**] (https://github.com/lob/lob-ruby/pull/112) removes Rack dependency

## [**1.12.0**](https://github.com/lob/lob-ruby/releases/tag/v1.12.0)
- [**#110**] (https://github.com/lob/lob-ruby/pull/110) fixes metadata filter

## [**1.10.0**](https://github.com/lob/lob-ruby/releases/tag/v1.10.0)
- [**#100**] (https://github.com/lob/lob-ruby/pull/100) adds support for Simple Letter Service

## [**1.9.2**](https://github.com/lob/lob-ruby/releases/tag/v1.9.2)
- [**#94**] (https://github.com/lob/lob-ruby/pull/94) added bank account verify support

## [**1.9.1**](https://github.com/lob/lob-ruby/releases/tag/v1.9.1)
- [**#92**] (https://github.com/lob/lob-ruby/pull/92) don't fix prawn version

## [**1.9**](https://github.com/lob/lob-ruby/releases/tag/v1.9.0)
- [**#88**] (https://github.com/lob/lob-ruby/pull/88) default prawn to 1.3.0 for ruby 1.9.3
- [**#91**] (https://github.com/lob/lob-ruby/pull/91) reduce strictness of rest-client version

## [**1.8**](https://github.com/lob/lob-ruby/releases/tag/v1.8)
- [**#69**] (https://github.com/lob/lob-ruby/pull/69) fixed spelling in documentation
- [**#71**] (https://github.com/lob/lob-ruby/pull/71) fixed syntax in documentation
- [**#73**] (https://github.com/lob/lob-ruby/pull/73) fixed failing tests
- [**#74**] (https://github.com/lob/lob-ruby/pull/74) added support for setting api_version
- [**#75**] (https://github.com/lob/lob-ruby/pull/75) added version module
- [**#76**] (https://github.com/lob/lob-ruby/pull/76) better error handling


## [**1.7**](https://github.com/lob/lob-ruby/releases/tag/v1.7)
- [**#64**] (https://github.com/lob/lob-ruby/pull/64) changed asset URLs to use lob-assets bucket
