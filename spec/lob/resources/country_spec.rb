require "spec_helper"

describe Lob::Resources::Country do

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list countries" do
      assert subject.countries.list["object"] == "list"
    end
  end
end
