$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# find the setting_id for the object you want to create
settings = @lob.settings.list
setting_index = settings.find_index { |setting| setting["type"] === "documents" }
setting_id = settings[setting_index]["id"]

# create a file object to user laterA
michigan_logo = @lob.objects.create(
  name: "Michigan Logo Document",
)


@lob.jobs.create(
  name: "Michigan Logo to Harry",
  from: {
    name:    "Leore Avidar",
    email:  "test@test.com",
    address_line1: "123 Test Street",
    address_line2: "Unit 199",
    city:    "Mountain View",
    state:  "CA",
    country: "US",
    zip:    94085
  },
  to: {
    name:    "Harry Avidar",
    email:  "test@test.com",
    address_line1: "123 Test Street",
    address_line2: "Unit 199",
    city:    "Mountain View",
    state:  "CA",
    country: "US",
    zip:    94085
  },
  objects: {
    name: "Michigan Logo",
    file: "https://www.lob.com/goblue.pdf",
    setting_id: setting_id
  }
)
