require "spec_helper"

describe Lob::Resources::USReverseGeocodeLookups do

  before :each do
    @sample_params = {
      latitude: 37.777456,
      longitude: -122.393039
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "lookup" do
    it "should reverse geocode a valid US location" do
      result = subject.us_reverse_geocode_lookups.lookup @sample_params
      puts result["addresses"][0]["components"]["zip_code"].class
      result["addresses"].length.must_equal(5)
    end
  end

end