require "spec_helper"

describe Lob::Resources::IntlVerifications do

  before :each do
    @sample_params = {
      primary_line: "123 Test St",
      city: "HEARST",
      state: "ONTARIO",
      postal_code: "P0L1N0",
      country: "CA"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "verify" do
    it "should verify an international address" do
      result = subject.intl_verifications.verify @sample_params

      result["recipient"].must_equal("TEST KEYS DO NOT VERIFY ADDRESSES")
    end
  end

end
