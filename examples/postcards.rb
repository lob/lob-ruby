$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# create a postcard with in-line addresses
puts @lob.postcards.create(
  name: "John Joe",
  to: {
    name: "ToAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  from: {
    name: "FromAddress",
    address_line1: "120, 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  front: "https://www.lob.com/postcardfront.pdf",
  back: File.new("../spec/samples/postcardback.pdf")
)

# create a postcard with stored addresses

to_address = @lob.addresses.create(
  name: "ToAddress",
  address_line1: "120, 6th Ave",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

from_address = @lob.addresses.create(
  name: "FromAddress",
  address_line1: "120, 6th Ave",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

puts @lob.postcards.create(
  name: "John Joe",
  to: to_address["id"],
  from: from_address["id"],
  front: "https://www.lob.com/postcardfront.pdf",
  back: File.new("../spec/samples/postcardback.pdf")
)
