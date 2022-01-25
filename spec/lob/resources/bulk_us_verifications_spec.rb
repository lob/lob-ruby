require "spec_helper"

describe Lob::Resources::BulkUSVerifications do

  before :each do
    @sample_params = {
      addresses: [
        {
          recipient: "LOB.COM",
          primary_line: "185 BERRY ST STE 6600",
          city: "SAN FRANCISCO",
          state: "CA",
          zip_code: "94107"
        },
        {
          recipient: "Harry Zhou",
          primary_line: "325 BERRY ST",
          city: "SAN FRANCISCO",
          state: "CA",
          zip_code: "94107"
        }
      ]
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "verify" do
    it "should verify a US address" do
      result = subject.bulk_us_verifications.verify @sample_params
      addresses = result["addresses"]
      address = addresses.first
      address["recipient"].must_equal("TEST KEYS DO NOT VERIFY ADDRESSES")
      address = addresses[1]
      address["recipient"].must_equal("TEST KEYS DO NOT VERIFY ADDRESSES")


    end

    it "should allow 'case' in query params" do
      result = subject.bulk_us_verifications.verify @sample_params, {case: "proper"}
      addresses = result["addresses"]
      address = addresses.first
      address["recipient"].must_equal("Test Keys Do Not Verify Addresses")
      address = addresses[1]
      address["recipient"].must_equal("Test Keys Do Not Verify Addresses")

    end
  end

end
