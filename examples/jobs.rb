$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'open-uri'
require 'prawn'
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

POINTS_PER_INCH = 72 # 72 PostScript Points per Inch

pdf = Prawn::Document.new(:page_size => [4.25 * POINTS_PER_INCH, 6.25 * POINTS_PER_INCH])
pdf.image open('https://s3-us-west-2.amazonaws.com/lob-assets/printing_icon.png'), :position => :center
pdf.text 'Print with Lob!', :align => :center, :size => 32

pdf.render_file 'sample.pdf'

object = @lob.objects.create(
  description: 'Test Object',
  file: File.new('sample.pdf'),
  setting: 201
)

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


# send the object you created
puts @lob.jobs.create(
  description: "Michigan Logo to Harry",
  to: to_address["id"],
  from: from_address["id"],
  objects: object["id"]
)
