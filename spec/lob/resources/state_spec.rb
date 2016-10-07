require "spec_helper"

describe Lob::Resources::State do

  subject { Lob(api_key: API_KEY) }

  describe "list" do
    it "should list states" do
      assert subject.states.list["object"] == "list"
    end
  end
end
