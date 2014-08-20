$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# verify an address
puts @lob.addresses.verify(
  address_line1: "220 WILLIAM T MORRISSEY BLVD",
  city:    "Boston",
  state:   "MA",
  zip:     "02125"
)
