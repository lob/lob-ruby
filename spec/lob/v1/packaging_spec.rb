require "spec_helper"

describe Lob::V1::Packaging do

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list packagings" do
      result = subject.packagings.list
      result.length.must_be :>, 0
    end
  end

end
