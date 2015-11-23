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
