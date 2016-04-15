require "spec_helper"

describe Lob do

  after do
    Lob.api_key = nil
    Lob.api_version = nil
  end

  it "should return the resource object for the valid version" do
    Lob(api_key: "test", api_version: "2014-11-25").must_be_kind_of(Lob::V1::Resource)
  end

  it "should *not* raise an error if API key has been on module and not passed as option" do
    Lob.api_key = "test"
    Lob().wont_be_nil
  end

  it "should pass the API key to the resource for the version" do
    Lob(api_key: "test").options[:api_key].must_equal "test"
  end

  it "should raise an error if no API key is supplied" do
    assert_raises ArgumentError do
      Lob()
    end
  end

  it "should allow detailed configuration" do
    Lob.configure do |config|
      config.api_key = "test"
      config.api_version = "2014-11-24"
      config.protocol = "https"
      config.api_host = "api.lob.com"
    end

    Lob.api_key.must_equal "test"
    Lob.api_version.must_equal "2014-11-24"
    Lob.protocol.must_equal "https"
    Lob.api_host.must_equal "api.lob.com"
  end

  it "should work with Lob.load" do
    Lob.load(api_key: "test").options[:api_key].must_equal "test"

    Lob.api_key = "test"
    Lob.load.wont_be_nil

    Lob.load(api_key: "test").must_be_kind_of(Lob::V1::Resource)
  end

  it "should handle API errors gracefully" do
    lob = Lob.load(api_key: ENV["LOB_API_KEY"])
    assert_raises Lob::InvalidRequestError do
      lob.objects.create(name: "Test", file: "https://lob.com/test.pdf", bad_param: "bad_value")
    end
  end

  it "should work when no api_version is provided" do
    lob = Lob.load(api_key: ENV["LOB_API_KEY"])
    Lob.api_version = nil
    lob.addresses.list
    Lob.api_version = "2014-11-24"
  end

  it "should include the raw response" do
    lob = Lob.load(api_key: ENV["LOB_API_KEY"])
    result = lob.addresses.list
    assert result._response.headers.include?(:content_type)
  end

  it "should include response headers for errors" do
    lob = Lob.load(api_key: ENV["LOB_API_KEY"])
    begin
      lob.objects.create(name: "Test", file: "https://lob.com/test.pdf", bad_param: "bad_value")
    rescue Lob::InvalidRequestError => e
      assert e._response.headers.include?(:content_type)
    end
  end

end
