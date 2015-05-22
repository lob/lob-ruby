require "spec_helper"

describe Lob::V1::Service do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list services" do
      assert subject.services.list["object"] == "list"
    end
  end

end
