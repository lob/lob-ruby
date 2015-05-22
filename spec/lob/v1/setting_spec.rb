require "spec_helper"

describe Lob::V1::Setting do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list settings" do
      assert subject.settings.list["object"] == "list"
    end
  end


  describe "find" do
    it "should find a setting" do
      list_result = subject.settings.list["data"]
      result = subject.settings.find(list_result.first["id"])
      result["description"].must_equal(list_result.first["description"])
    end
  end
end
