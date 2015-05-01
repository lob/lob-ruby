$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# HTML to send to the server
html = %{
<html>
<head>
<title>Lob.com Sample 4x6 Postcard Front</title>
<style>
  *, *:before, *:after {
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
  }

  @font-face {
    font-family: 'Loved by the King';
    font-style: normal;
    font-weight: 400;
    src: url('https://s3-us-west-2.amazonaws.com/lob-assets/LovedbytheKing.ttf') format('truetype');
  }

  body {
    width: 6.25in;
    height: 4.25in;
    margin: 0;
    padding: 0;
    /* If using an image, the background image should have dimensions of 1875x1275 pixels. */
    background-image: url(https://s3-us-west-2.amazonaws.com/lob-assets/beach.jpg);
    background-size: 6.25in 4.25in;
    background-repeat: no-repeat;
  }

  .text {
    margin: 50px;
    width: 400px;
    font-family: 'Loved by the King';
    font-size: 50px;
    font-weight: 700;
    color: white;
    text-shadow: 3px 3px black;
  }
</style>
</head>

<body>
  <h1 class="text">Hello {{name}}!</h1>
  <p class="text">Join us for the {{event}}!</p>
</body>

</html>
}

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
  description: "Beach Postcard",
  to: to_address["id"],
  from: from_address["id"],
  metadata: { campaign: "Summer 2015 Beach" },
  data: { name: "Albert", event: "Summer 2015 Beach-athon" },
  front: html,
  message: "Please RSVP as soon as possible to reserve your lounge chair."
)
