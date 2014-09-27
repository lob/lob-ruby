$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# create an address
to_address = @lob.addresses.create(
  name: "John Doe",
  address_line1: "104 Printing Boulevard",
  city: "Boston",
  state: "MA",
  country: "US",
  zip: 12345
)

# create a bank account
bank_account = @lob.bank_accounts.create(
  routing_number: "322271627",
  account_number: "123456789",
  bank_address: {
    name: "Bank Address",
    address_line1: "120 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  },
  account_address: {
    name: "Account Address",
    address_line1: "120 6th Ave",
    city: "Boston",
    state: "MA",
    country: "US",
    zip: 12345
  }
)

# send a $1000 check using an already created bank and address
puts @lob.checks.create(
  name: "Test Check",
  check_number: "10000",
  bank_account: bank_account["id"],
  to: to_address["id"],
  amount: 100,
  memo: "This is my first Check",
  message: "This check is for laundry"
)
