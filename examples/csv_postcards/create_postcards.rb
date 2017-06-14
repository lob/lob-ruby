$:.unshift File.expand_path("../../lib", File.dirname(__FILE__))
require 'lob'
require 'csv'

# Initialize Lob object
lob = Lob::Client.new(api_key: 'test_799ff27291c166d10ba191902ad02fb059c')

# Load the HTML from postcard_front.html and postcard_back.html.
front_html = File.open(File.expand_path('../postcard_front.html', __FILE__)).read
back_html = File.open(File.expand_path('../postcard_back.html', __FILE__)).read

# Parse the CSV and create the postcards.
CSV.foreach(File.expand_path('../input.csv', __FILE__)) do |row|
  postcard = lob.postcards.create(
    description: 'CSV Test',
    to: {
      name: row[5],
      address_line1: row[6],
      address_line2: row[7],
      address_city: row[8],
      address_state: row[9],
      address_zip: row[10],
      address_country: row[11]
    },
    from: {
      name: 'Lob',
      address_line1: '123 Main Street',
      address_city: 'San Francisco',
      address_state: 'CA',
      address_zip: '94185',
      address_country: 'US'
    },
    size: "6x11",
    front: front_html,
    back: back_html,
    merge_variables: {
      background_image: row[1],
      background_color: row[2],
      name: row[0],
      car: row[3],
      mileage: row[4]
    }
  )
  puts postcard['url']
end
