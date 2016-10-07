require "spec_helper"

describe Lob::Resources::Address do

  before :each do
    @sample_params = {
      name: "John Doe",
      address_line1: "325 Berry Street",
      address_city: "San Francisco",
      address_state: "CA",
      address_country: "US",
      address_zip: 94158,
      metadata: {
        test: 'stuff'
      }
    }
  end

  subject { Lob(api_key: API_KEY) }

  describe "verify" do

    it "should verify an address" do
      result = subject.addresses.verify(
        address_line1: @sample_params[:address_line1],
        address_city:  @sample_params[:address_city],
        address_state: @sample_params[:address_state],
        address_zip:   @sample_params[:address_zip]
      )

      result["address"]["address_country"].must_equal("US")
    end
  end


  describe "list" do
    it "should list addresses" do
      assert subject.addresses.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create an address" do
      result = subject.addresses.create @sample_params

      result["name"].must_equal(@sample_params[:name])
    end
  end


  describe "find" do
    it "should find an address" do
      new_address = subject.addresses.create @sample_params

      find_result = subject.addresses.find(new_address["id"])
      find_result["name"].must_equal(@sample_params[:name])
    end
  end


  describe "destroy" do
    it "should delete an address" do
      new_address = subject.addresses.create @sample_params

      delete_result = subject.addresses.destroy(new_address["id"])
      assert_equal(new_address["id"], delete_result["id"])
    end
  end
end
