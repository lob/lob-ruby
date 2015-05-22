require "spec_helper"

describe Lob::V1::Country do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list countries" do
      result = subject.countries.list
      result.length.must_be :>, 0
    end
  end
end
