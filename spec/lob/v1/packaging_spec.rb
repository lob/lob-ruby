require "spec_helper"

describe Lob::V1::Packaging do

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }

  describe "list" do
    it "should list packagings" do
      VCR.use_cassette('list_packagings') do
        result = subject.packagings.list
        result.length.must_be :>, 0
      end
    end
  end

end
