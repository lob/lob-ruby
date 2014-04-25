require "spec_helper"

describe Lob::V1::Address do
  let(:sample_params2) {
    {
      name:    "Russell Smith",
      email:   "test@test.com",
      address_line1: "673 Brannan",
      city:    "San Francisco",
      state:   "CA",
      country: "US",
      zip:     94107
    }
  }

  let(:sample_params) {
    {
      name:    "Test",
      email:   "test@test.com",
      address_line1: "220 WILLIAM T MORRISSEY BLVD",
      city:    "Boston",
      state:   "MA",
      country: "US",
      zip:     02125
    }
  }

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }

  describe "verify" do
    it "should verify an address" do
      assert_raises(Lob::Error) do
        VCR.use_cassette('verify_address2') do
          result = subject.addresses.verify(
            address_line1: sample_params2[:address_line1],
            city:  sample_params2[:city],
            state: sample_params2[:state],
            zip:   sample_params2[:zip]
          )

          result["address"]["address_country"].must_equal("United States")
        end
      end
    end

    it "should verify an address" do
      VCR.use_cassette('verify_address') do
        result = subject.addresses.verify(
          address_line1: sample_params[:address_line1],
          city:  sample_params[:city],
          state: sample_params[:state],
          zip:   sample_params[:zip]
        )

        result["address"]["address_country"].must_equal("United States")
      end
    end
  end


  describe "list" do
    it "should list addresses" do
      VCR.use_cassette('list_addresses') do
        new_address = subject.addresses.create sample_params

        list_result = subject.addresses.list
        assert /#{new_address["name"]}/i =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create an address" do
      VCR.use_cassette('create_address') do
        result = subject.addresses.create sample_params
        assert /#{result["name"]}/i =~ sample_params[:name]
      end
    end
  end


  describe "find" do
    it "should find an address" do
      VCR.use_cassette('find_address') do
        new_address = subject.addresses.create sample_params

        find_result = subject.addresses.find(new_address["id"])
        assert /#{find_result["name"]}/i =~ sample_params[:name]
      end
    end
  end


  describe "destroy" do
    it "should delete an address" do
      VCR.use_cassette('delete_address') do
        new_address = subject.addresses.create sample_params

        delete_result = subject.addresses.destroy(new_address["id"])
        assert_equal(new_address["id"], delete_result["id"])
      end
    end
  end
end
