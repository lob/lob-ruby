require "spec_helper"

describe Lob::Resources::USVerifications do

  before :each do
    @sample_params = {
      recipient: "LOB.COM",
      primary_line: "185 BERRY ST STE 6600",
      city: "SAN FRANCISCO",
      state: "CA",
      zip_code: "94107"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "verify" do
    it "should verify a US address" do
      result = subject.us_verifications.verify @sample_params

      result["recipient"].must_equal(@sample_params[:recipient])
      result["primary_line"].must_equal(@sample_params[:primary_line])
      result["last_line"].must_equal("SAN FRANCISCO CA 94107-1728")
    end
  end

end
