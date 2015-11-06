require "spec_helper"

describe Lob::V1::BankAccount do

  before :each do
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

    it "should create a bank account" do
      result = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        account_number: @sample_bank_account_params[:account_number],
        signatory: "John Doe"
      )

      result["account_number"].must_equal(@sample_bank_account_params[:account_number])
    end

  end


  describe "find" do
    it "should find a bank account" do
      new_bank_account = subject.bank_accounts.create(
        routing_number: @sample_bank_account_params[:routing_number],
        account_number: @sample_bank_account_params[:account_number],
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
        account_number: @sample_bank_account_params[:account_number],
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
        account_number: @sample_bank_account_params[:account_number],
        signatory: "John Doe"
      )

      verify_result = subject.bank_accounts.verify(new_bank_account["id"], amounts: [12, 34])
      assert_equal(new_bank_account["id"], verify_result["id"])
    end
  end
end
