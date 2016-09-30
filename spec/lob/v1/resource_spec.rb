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

  it "should return areas resource" do
    subject.areas.must_be_kind_of(Lob::V1::Area)
  end

  it "should return addresses resource" do
    subject.addresses.must_be_kind_of(Lob::V1::Address)
  end

  it "should return bank accounts resource" do
    subject.bank_accounts.must_be_kind_of(Lob::V1::BankAccount)
  end

  it "should return checks resource" do
    subject.checks.must_be_kind_of(Lob::V1::Check)
  end

  it "should return countries resource" do
    subject.countries.must_be_kind_of(Lob::V1::Country)
  end

  it "should return letters resource" do
    subject.letters.must_be_kind_of(Lob::V1::Letter)
  end

  it "should return postcards resource" do
    subject.postcards.must_be_kind_of(Lob::V1::Postcard)
  end

  it "should return routes resource" do
    subject.routes.must_be_kind_of(Lob::V1::Route)
  end

  it "should return states resource" do
    subject.states.must_be_kind_of(Lob::V1::State)
  end

end
