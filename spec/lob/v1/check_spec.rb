require "spec_helper"

describe Lob::V1::Check do

  before :each do
    @sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      city:    "Mountain View",
      state:   "CA",
      country: "US",
      zip:     94085
    }

    @sample_bank_account_params = {
      routing_number: "123456789",
      account_number: "123456789"
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }

  describe "list" do
    it "should list checks" do
      VCR.use_cassette('list_checks') do
        new_address = subject.addresses.create @sample_address_params

        new_bank_account = subject.bank_accounts.create(
          routing_number: @sample_bank_account_params[:routing_number],
          bank_address: @sample_address_params,
          account_number: @sample_bank_account_params[:account_number],
          account_address: @sample_address_params
        )

        new_check = subject.checks.create(
          new_bank_account["id"], @sample_address_params, 2000
        )

        list_result = subject.checks.list
        assert /#{new_check["id"]}/i =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create a check with bank account id" do
      VCR.use_cassette('create_check_with_bank_account_id') do
        new_address = subject.addresses.create @sample_address_params

        new_bank_account = subject.bank_accounts.create(
          routing_number: @sample_bank_account_params[:routing_number],
          bank_address: @sample_address_params,
          account_number: @sample_bank_account_params[:account_number],
          account_address: @sample_address_params
        )

        result = subject.checks.create(
          new_bank_account["id"], new_address["id"], "2000"
        )

        result["amount"].to_s.must_equal("2000.00")
      end
    end
  end


  describe "find" do
    it "should find a check" do
      VCR.use_cassette('find_check') do
        new_address = subject.addresses.create @sample_address_params

        new_bank_account = subject.bank_accounts.create(
          routing_number: @sample_bank_account_params[:routing_number],
          bank_address: @sample_address_params,
          account_number: @sample_bank_account_params[:account_number],
          account_address: @sample_address_params
        )

        new_check = subject.checks.create(
          new_bank_account["id"], new_address["id"], 2000
        )

        result = subject.checks.find(new_check["id"])
        result["id"].must_equal(new_check["id"])
      end
    end
  end

end
