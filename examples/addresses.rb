$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# create an address
puts @lob.addresses.create(
  name: "John Doe",
  address_line1: "104, Printing Boulevard",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)
