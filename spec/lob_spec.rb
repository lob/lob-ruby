require "spec_helper"

describe Lob do

  it "should return the client object for the valid version" do
    lob = Lob::Client.new(api_key: "test", api_version: "2014-11-25")
    lob.must_be_kind_of(Lob::Client)
    assert lob.config[:api_version] == "2014-11-25"
  end

  it "should pass the API key to the resource for the version" do
    Lob::Client.new(api_key: "test").config[:api_key].must_equal "test"
  end

  it "should raise an error if no API key is supplied" do
    assert_raises ArgumentError do
      Lob::Client.new()
    end
  end

  it "should handle API errors gracefully" do
    lob = Lob::Client.new(api_key: API_KEY)
    assert_raises Lob::InvalidRequestError do
      lob.postcards.create(name: "Test", file: "https://lob.com/test.pdf", bad_param: "bad_value")
    end
  end

  it "should work when no api_version is provided" do
    lob = Lob::Client.new(api_key: API_KEY)
    lob.addresses.list
  end

  it "should include the raw response" do
    lob = Lob::Client.new(api_key: API_KEY)
    result = lob.addresses.list
    assert result._response.headers.include?(:content_type)
  end

  it "should include response headers for errors" do
    lob = Lob::Client.new(api_key: API_KEY)
    begin
      lob.postcards.create(bad_param: "bad_value")
    rescue Lob::InvalidRequestError => e
      assert e._response.headers.include?(:content_type)
    end
  end

end
