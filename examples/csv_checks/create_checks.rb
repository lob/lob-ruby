$:.unshift File.expand_path("../../lib", File.dirname(__FILE__))
require 'lob'
require 'csv'
require 'pp'

# Initialize Lob object
lob = Lob::Client.new(api_key: 'YOUR_API_KEY_HERE')

# Create a bank account
bank_account = lob.bank_accounts.create(
  routing_number: "322271627",
  account_number: "123456789",
  account_type: "company",
  signatory: "John Doe"
)

puts bank_account

# Verify bank account
lob.bank_accounts.verify(bank_account['id'], amounts: [23, 12])

# Parse the CSV and create the checks
CSV.foreach(File.expand_path('../input.csv', __FILE__)) do |row|
  check = lob.checks.create(
    description: 'CSV Test',
    bank_account: bank_account["id"],
    to: {
      name: row[0],
      address_line1: row[1],
      address_line2: row[2],
      address_city: row[3],
      address_state: row[4],
      address_zip: row[5],
      address_country: row[6]
    },
    from: {
      name: 'Lob',
      address_line1: '123 Main Street',
      address_city: 'San Francisco',
      address_state: 'CA',
      address_zip: '94185',
      address_country: 'US'
    },
    amount: row[7],
    memo: "For travel reimbursement"
  )
  pp check['url']
end
