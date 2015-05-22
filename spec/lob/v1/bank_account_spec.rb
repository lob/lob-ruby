require "spec_helper"

describe Lob::V1::BankAccount do

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
      account_number: "123456789"
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list bank accounts" do
      assert subject.bank_accounts.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create a bank account with address_id" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        bank_address: new_address["id"],
        account_number: @sample_bank_account_params[:account_number],
        account_address: new_address["id"],
        signatory: "John Doe"
      )

      result["account_number"].must_equal(@sample_bank_account_params[:account_number])
    end


    it "should create a bank account with address params" do
      result = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        bank_address: @sample_address_params.clone,
        account_number: @sample_bank_account_params[:account_number],
        account_address: @sample_address_params.clone,
        signatory: "John Doe"
      )

      result["account_number"].must_equal(@sample_bank_account_params[:account_number])
    end
  end


  describe "find" do
    it "should find a bank account" do
      new_address = subject.addresses.create @sample_address_params

      new_bank_account = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        bank_address: new_address["id"],
        account_number: @sample_bank_account_params[:account_number],
        account_address: new_address["id"],
        signatory: "John Doe"
      )

      result  = subject.bank_accounts.find(new_bank_account["id"])
      result["id"].must_equal(new_bank_account["id"])
    end
  end

  describe "destroy" do
    it "should delete a bank_account" do
      new_bank_account = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        bank_address: @sample_address_params.clone,
        account_number: @sample_bank_account_params[:account_number],
        account_address: @sample_address_params.clone,
        signatory: "John Doe"
      )

      delete_result = subject.bank_accounts.destroy(new_bank_account["id"])
      assert_equal(new_bank_account["id"], delete_result["id"])
    end
  end

  describe "verify" do
    it "should verify a bank account" do
      new_bank_account = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        bank_address: @sample_address_params.clone,
        account_number: @sample_bank_account_params[:account_number],
        account_address: @sample_address_params.clone,
        signatory: "John Doe"
      )

      verify_result = subject.bank_accounts.verify(new_bank_account["id"], amounts: [12, 34])
      assert_equal(new_bank_account["id"], verify_result["id"])
    end
  end
end
