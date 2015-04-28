require "spec_helper"

describe Lob::V1::State do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list states" do
      VCR.use_cassette('list_states') do
        result = subject.states.list
        result.length.must_be :>, 0
      end
    end
  end
end
