require "spec_helper"

describe Lob::Resources::IntlVerifications do

  before :each do
    @sample_params = {
      address_line1: "123 Test St",
      address_city: "HEARST",
      address_state: "ONTARIO",
      address_zip: "P0L1N0",
      address_country: "CA"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "verify" do
    it "should return a 403 in test mode" do
      begin
        subject.intl_verifications.verify @sample_params
      rescue Lob::InvalidRequestError => e
        assert e.http_status == 403
        assert e._response.headers.include?(:content_type)
      end
    end
  end

end
