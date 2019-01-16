$:.unshift File.expand_path("../../lib", File.dirname(__FILE__))

require 'csv'
require 'lob'

# Initialize Lob object
lob = Lob::Client.new(api_key: 'YOUR_API_KEY_HERE')

output = File.open(File.expand_path('../output.csv', __FILE__), 'w')

output.puts ['primary_line', 'secondary_line', 'urbanization', 'last_line', 'deliverability'].join(',')

# Parse the input file and verify the addresses
File.open(File.expand_path('../input.csv', __FILE__)).each_line do |line|
  address_components = line.split(',')

  verified_address = lob.us_verifications.verify(
    primary_line: address_components[0],
    secondary_line: address_components[1],
    urbanization: address_components[2],
    city: address_components[3],
    state: address_components[4],
    zip_code: address_components[5]
  )

  output.puts [
    verified_address['primary_line'],
    verified_address['secondary_line'],
    verified_address['urbanization'],
    verified_address['last_line'],
    verified_address['deliverability']
  ].join(',')

end

output.close
