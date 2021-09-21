$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'
require 'pp'

# initialize Lob object
lob = Lob::Client.new(api_key: 'YOUR_API_KEY')

# create a to address
to_address = lob.addresses.create(
  name: "ToAddress",
  address_line1: "120 6th Ave",
  address_city: "Boston",
  address_state: "MA",
  address_country: "US",
  address_zip: 12345
)

# create a from address
from_address = lob.addresses.create(
  name: "FromAddress",
  address_line1: "120 6th Ave",
  address_city: "Boston",
  address_state: "MA",
  address_country: "US",
  address_zip: 12345
)


# send a self mailer
pp lob.self_mailers.create(
  description: "Beach Postcard",
  to: to_address["id"],
  from: from_address["id"],
  metadata: { campaign: "Summer 2021 Beach" },
  merge_variables: { name: "Albert" },
  outside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_outside.pdf",
  inside: "<h1>Hi {{name}}, please RSVP as soon as possible to reserve your lounge chair.</h1>"
)
