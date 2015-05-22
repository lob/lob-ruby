require "spec_helper"

describe Lob::V1::Country do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list countries" do
      assert subject.countries.list["object"] == "list"
    end
  end
end
