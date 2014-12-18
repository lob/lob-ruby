require "spec_helper"

describe Lob::V1::Service do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list services" do
      VCR.use_cassette('list_services') do
        result = subject.services.list
        result.length.must_be :>, 0
      end
    end
  end

end
