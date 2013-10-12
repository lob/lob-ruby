require "spec_helper"

describe Lob::V1::Country do

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }

  describe "list" do
    it "should list countries" do
      VCR.use_cassette('list_countries') do
        result = subject.countries.list
        result.length.must_be :>, 0
      end
    end
  end

end
