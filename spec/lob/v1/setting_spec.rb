require "spec_helper"

describe Lob::V1::Setting do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list settings" do
      VCR.use_cassette('list_settings') do
        result = subject.settings.list
        result.length.must_be :>, 0
        /Document/ =~ result.to_s
        /Poster/   =~ result.to_s
        /Card/     =~ result.to_s
      end
    end
  end


  describe "find" do
    it "should find a setting" do
      VCR.use_cassette('find_setting') do
        list_result = subject.settings.list
        result = subject.settings.find(list_result.first["id"])
        result["description"].must_equal(list_result.first["description"])
      end
    end
  end
end
