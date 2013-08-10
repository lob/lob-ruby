require "spec_helper"

describe Lob::V1::Resource do

  before :each do
    @api_key = "test"
  end

  subject { Lob(api_key: @api_key) }

  describe "when Lob is initialized" do
    it "should receive and contain default options when Lob is initialized" do
      subject.options[:protocol].must_equal "https"
      subject.options[:api_host].must_equal "api.lob.com"
    end

    it "should have API key in options" do
      subject.options[:api_key].must_equal @api_key
    end
  end


  it "should return addresses resource" do
    subject.addresses.must_be_kind_of(Lob::V1::Address)
  end

  it "should return jobs resource" do
    subject.jobs.must_be_kind_of(Lob::V1::Job)
  end

  it "should return objects resource" do
    subject.objects.must_be_kind_of(Lob::V1::Object)
  end

  it "should return packagings resource" do
    subject.packagings.must_be_kind_of(Lob::V1::Packaging)
  end

  it "should return postcards resource" do
    subject.postcards.must_be_kind_of(Lob::V1::Postcard)
  end

  it "should return services resource" do
    subject.services.must_be_kind_of(Lob::V1::Service)
  end
  
  it "should return settings resource" do
    subject.settings.must_be_kind_of(Lob::V1::Setting)
  end
end
