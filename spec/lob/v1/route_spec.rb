require "spec_helper"

describe Lob::V1::Route do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do

    it "should list routes" do
      zip_code = "94158"
      routes = subject.routes.list(zip_codes: zip_code)
      routes["data"][0]["zip_code"].must_equal(zip_code)
    end

    it "should accept a single ZIP code as input" do
      zip_code = "94158"
      routes = subject.routes.list(zip_code)
      routes["zip_code"].must_equal(zip_code)
    end

  end

end
