# Lob::ReverseGeocodeLookupsApi

All URIs are relative to *https://api.lob.com/v1*

| Method | HTTP request | Description |
| ------ | ------------ | ----------- |
| [**reverse_geocode_lookup**](ReverseGeocodeLookupsApi.md#reverse_geocode_lookup) | **POST** /us_reverse_geocode_lookups | lookup |


## reverse_geocode_lookup

> <ReverseGeocode> reverse_geocode_lookup(location, opts)

lookup

Reverse geocode a valid US location with a live API key.

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

api_instance = Lob::ReverseGeocodeLookupsApi.new
location = Lob::Location.new({latitude: 3.56, longitude: 3.56}) # Location | 
opts = {
  size: 56 # Integer | Determines the number of locations returned. Possible values are between 1 and 50 and any number higher will be rounded down to 50. Default size is a list of 5 reverse geocoded locations.
}

begin
  # lookup
  result = api_instance.lookup(location, opts)
  p result
rescue Lob::ApiError => e
  puts "Error when calling ReverseGeocodeLookupsApi->lookup: #{e}"
end
```

#### Using the reverse_geocode_lookup_with_http_info variant

This returns an Array which contains the response data, status code and headers.

> <Array(<ReverseGeocode>, Integer, Hash)> reverse_geocode_lookup_with_http_info(location, opts)

```ruby
begin
  # lookup
  data, status_code, headers = api_instance.reverse_geocode_lookup_with_http_info(location, opts)
  p status_code # => 2xx
  p headers # => { ... }
  p data # => <ReverseGeocode>
rescue Lob::ApiError => e
  puts "Error when calling ReverseGeocodeLookupsApi->reverse_geocode_lookup_with_http_info: #{e}"
end
```

### Parameters

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **location** | [**Location**](Location.md) |  |  |
| **size** | **Integer** | Determines the number of locations returned. Possible values are between 1 and 50 and any number higher will be rounded down to 50. Default size is a list of 5 reverse geocoded locations. | [optional][default to 5] |

### Return type

[**ReverseGeocode**](ReverseGeocode.md)

### Authorization

[basicAuth](../README.md#basicAuth)

### HTTP request headers

- **Content-Type**: application/json, application/x-www-form-urlencoded, multipart/form-data
- **Accept**: application/json

