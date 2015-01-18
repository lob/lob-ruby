require "spec_helper"

describe Lob do

  after do
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
      VCR.use_cassette('bad_request') do
        lob.objects.create(name: "Test", file: "https://lob.com/test.pdf", bad_param: "bad_value")
      end
    end
  end

  it "should work when no api_version is provided" do
    lob = Lob.load(api_key: ENV["LOB_API_KEY"])
    Lob.api_version = nil
    VCR.use_cassette('no_api_version') do
      lob.addresses.list
    end
    Lob.api_version = "2014-11-24"
  end
end
