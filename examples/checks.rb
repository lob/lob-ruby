$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'
require 'pp'

# initialize Lob object
lob = Lob::Client.new(api_key: 'YOUR_API_KEY')

# create an address
to_address = lob.addresses.create(
  name: "John Doe",
  address_line1: "104 Printing Boulevard",
  address_city: "Boston",
  address_state: "MA",
  address_country: "US",
  address_zip: "12345"
)

# create a from address
from_address = lob.addresses.create(
  name: "Jane Doe",
  address_line1: "123 Hello Ave",
  address_city: "Providence",
  address_state: "RI",
  address_country: "US",
  address_zip: "02912"
)

# create a bank account
bank_account = lob.bank_accounts.create(
  routing_number: "322271627",
  account_number: "123456789",
  account_type: "company",
  signatory: "John Doe"
)

pp bank_account
lob.bank_accounts.verify(bank_account['id'], amounts: [23, 12])

# send a $100 check using an already created bank and address
pp lob.checks.create(
  description: "Test Check",
  check_number: "10000",
  bank_account: bank_account["id"],
  to: to_address["id"],
  from: from_address["id"],
  amount: 100,
  memo: "This is my first Check",
  message: "This check is for laundry"
)
