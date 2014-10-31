$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# create a to address
to_address = @lob.addresses.create(
  name: "ToAddress",
  address_line1: "120 6th Ave",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

# create a from address
from_address = @lob.addresses.create(
  name: "FromAddress",
  address_line1: "120 6th Ave",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

# send a postcard
puts @lob.postcards.create(
  name: "John Joe",
  to: to_address["id"],
  from: from_address["id"],
  front: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardfront.pdf",
  back: "https://s3-us-west-2.amazonaws.com/lob-assets/postcardback.pdf"
)
