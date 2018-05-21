require "spec_helper"

describe Lob::Resources::USAutocompletions do

  before :each do
    @sample_params = {
      address_prefix: "185 BER",
      city: "SAN FRANCISCO",
      state: "CA"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "autocomplete" do
    it "should return a list of address suggestions" do
      result = subject.us_autocompletions.autocomplete @sample_params

      result["suggestions"][0]["primary_line"].must_equal("TEST KEYS DO NOT AUTOCOMPLETE US ADDRESSES")
      result["suggestions"][0]["city"].must_equal("SET `address_prefix` to '1 suggestion' TO SIMULATE AN AUTOCOMPLETION")
    end
  end

end
