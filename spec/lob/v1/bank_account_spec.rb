require "spec_helper"

describe Lob::V1::BankAccount do

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
    it "should list bank accounts" do
      VCR.use_cassette('list_bank_accounts') do

        new_bank_account = subject.bank_accounts.create(
          routing_number: @sample_bank_account_params[:routing_number],
          bank_address: @sample_address_params.clone,
          account_number: @sample_bank_account_params[:account_number],
          account_address: @sample_address_params.clone
        )

        list_result = subject.bank_accounts.list
        assert /#{new_bank_account["id"]}/i =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create a bank account with address_id" do
      VCR.use_cassette('create_bank_account_with_address_id') do
        new_address = subject.addresses.create @sample_address_params

        result = subject.bank_accounts.create(
          account_address: @sample_bank_account_params[:routing_number],
          bank_address: new_address["id"],
          account_number: @sample_bank_account_params[:account_number],
          account_address: new_address["id"]
        )

        result["account_number"].must_equal(@sample_bank_account_params[:account_number])
      end
    end


    it "should create a bank account with address params" do
      VCR.use_cassette('create_bank_account_with_address_params') do

        result = subject.bank_accounts.create(
          account_address: @sample_bank_account_params[:routing_number],
          bank_address: @sample_address_params.clone,
          account_number: @sample_bank_account_params[:account_number],
          account_address: @sample_address_params.clone
        )

        result["account_number"].must_equal(@sample_bank_account_params[:account_number])
      end
    end
  end


  describe "find" do
    it "should find a bank account" do
      VCR.use_cassette('find_bank_account') do
        new_address = subject.addresses.create @sample_address_params

        new_bank_account = subject.bank_accounts.create(
          account_address: @sample_bank_account_params[:routing_number],
          bank_address: new_address["id"],
          account_number: @sample_bank_account_params[:account_number],
          account_address: new_address["id"]
        )

        result  = subject.bank_accounts.find(new_bank_account["id"])
        result["id"].must_equal(new_bank_account["id"])
      end
    end
  end

end
