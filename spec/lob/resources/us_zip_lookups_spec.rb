require "spec_helper"

describe Lob::Resources::USZipLookups do

  before :each do
    @sample_params = {
      zip_code: "94107"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "lookup" do
    it "should lookup a US zip code" do
      result = subject.us_zip_lookups.lookup @sample_params

      result["zip_code"].must_equal(@sample_params[:zip_code])
      result["zip_code_type"].must_equal("standard")
      result["cities"].length.must_equal(1)
    end
  end

end
