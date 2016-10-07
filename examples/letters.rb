$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
lob = Lob::Client.new(api_key: 'test_799ff27291c166d10ba191902ad02fb059c')

html = %{
<html>
<head>
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

  .text {
    margin-left: 75px;
    padding-top: 250px;
    width: 400px;
    font-family: 'Loved by the King';
    font-size: 50px;
    font-weight: 700;
    color: black;
  }
</style>
</head>

<body>
  <p class="text">Hello {{name}}!<br/><br/>Join us for the {{event}}!</p>
</body>

</html>
}

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

# send the letter
puts lob.letters.create(
  description: "Test letter",
  to: to_address["id"],
  from: from_address["id"],
  file: html,
  data: { name: 'Albert', event: 'HTML Letter Conference'},
  metadata: { campaign: 'HTML 1.0' },
  color: false
)
