require "spec_helper"

describe Lob::Resources::Address do

  before :each do
    @sample_params = {
      name: "JOHN DOE",
      address_line1: "325 BERRY ST",
      address_city: "SAN FRANCISCO",
      address_state: "CA",
      address_country: "US",
      address_zip: 94158,
      metadata: {
        test: 'stuff'
      }
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

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
