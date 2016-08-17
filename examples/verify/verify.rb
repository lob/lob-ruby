$:.unshift File.expand_path("../../lib", File.dirname(__FILE__))

require 'csv'
require 'lob'

# Be sure to install the StreetAddress gem.
require 'street_address'

# Initialize Lob object
Lob.api_key = 'test_799ff27291c166d10ba191902ad02fb059c'
@lob = Lob.load

output = File.open(File.expand_path('../output.csv', __FILE__), 'w')

output.puts ['address_line1', 'address_city', 'address_state', 'address_zip', 'address_country'].join(',')

# Parse the input file and verify the addresses
File.open(File.expand_path('../input.txt', __FILE__)).each_line do |line|
  parsed_address = StreetAddress::US.parse(line)

  verified_address = @lob.addresses.verify(
    address_line1: parsed_address.to_s(:line1),
    address_city: parsed_address.city,
    address_state: parsed_address.state,
    address_country: 'US'
  )['address']

  output.puts [
    verified_address['address_line1'],
    verified_address['address_city'],
    verified_address['address_state'],
    verified_address['address_zip'],
    verified_address['address_country']
  ].join(',')

end

output.close
