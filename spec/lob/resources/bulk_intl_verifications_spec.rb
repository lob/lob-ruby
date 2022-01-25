require "spec_helper"

describe Lob::Resources::BulkIntlVerifications do

  before :each do
    @sample_params = {
      addresses: [
        {
          primary_line: "123 Test St",
          city: "HEARST",
          state: "ONTARIO",
          postal_code: "P0L1N0",
          country: "CA"
        },
        {
          primary_line: "123 Test St",
          city: "HEARST",
          state: "ONTARIO",
          postal_code: "P0L1N0",
          country: "CA"
        }
      ]
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "verify" do
    it "should verify an international address" do
      result = subject.bulk_intl_verifications.verify @sample_params
      addresses = result["addresses"]
      address = addresses.first
      address["recipient"].must_equal("TEST KEYS DO NOT VERIFY ADDRESSES")
      address = addresses[1]
      address["recipient"].must_equal("TEST KEYS DO NOT VERIFY ADDRESSES")
    end
  end

end
