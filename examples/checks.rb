$:.unshift File.expand_path("../lib", File.dirname(__FILE__))
require 'lob'

# initialize Lob object
Lob.api_key = 'test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc'
@lob = Lob.load

# send a $1000 check using an already created bank and address
puts @lob.checks.create(
  name: 'Test Check',
  check_number: '10000',
  bank_account: 'bank_3e64d9904356b20',
  to: 'adr_0e418aa8d1eb41fb',
  amount: 100,
  memo: 'This is my first Check',
  message: 'This check is for laundry'
)
