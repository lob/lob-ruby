require 'spec_helper'

describe Lob::LobError do

  describe "#to_s" do
    it "should return a string with the status code and message" do
      error = Lob::LobError.new("hello", 404)
      error.to_s.must_equal("(Status 404) hello")
    end

    it "should returna a message without the status code if not provided" do
      error = Lob::LobError.new("hello")
      error.to_s.must_equal("hello")
    end
  end

end
