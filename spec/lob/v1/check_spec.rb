require "spec_helper"

describe Lob::V1::Check do

  before :each do

    @sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      address_city:    "Mountain View",
      address_state:   "CA",
      address_country: "US",
      address_zip:     94085
    }

    @sample_bank_account_params = {
      routing_number: "122100024",
      account_number: "123456789",
      account_type: "company",
      signatory: "John Doe"
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list checks" do
      assert subject.checks.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create a check with bank account id" do
      new_address = subject.addresses.create @sample_address_params

      new_bank_account = subject.bank_accounts.create(@sample_bank_account_params)

      subject.bank_accounts.verify(new_bank_account["id"], amounts: [1, 2])

      result = subject.checks.create(
        bank_account: new_bank_account["id"],
        to: new_address["id"],
        from: new_address["id"],
        amount: "2000.12"
      )

      result["amount"].to_s.must_equal("2000.12")
    end
  end


  describe "find" do
    it "should find a check" do
      new_address = subject.addresses.create @sample_address_params

      new_bank_account = subject.bank_accounts.create(@sample_bank_account_params)

      subject.bank_accounts.verify(new_bank_account["id"], amounts: [1, 2])

      new_check = subject.checks.create(
        bank_account: new_bank_account["id"],
        to: new_address["id"],
        from: new_address["id"],
        amount: 2000
      )

      result = subject.checks.find(new_check["id"])
      result["id"].must_equal(new_check["id"])
    end
  end


  describe "destroy" do
    it "should destroy a check" do
      new_address = subject.addresses.create @sample_address_params

      new_bank_account = subject.bank_accounts.create(@sample_bank_account_params)

      subject.bank_accounts.verify(new_bank_account["id"], amounts: [1, 2])

      new_check = subject.checks.create(
        bank_account: new_bank_account["id"],
        to: new_address["id"],
        from: new_address["id"],
        amount: 2000
      )

      result = subject.checks.destroy(new_check["id"])
      result["id"].must_equal(new_check["id"])
      result["deleted"].must_equal(true)
    end
  end

end
