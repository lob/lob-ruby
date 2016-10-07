require "spec_helper"

describe Lob::Resources::ResourceBase do

  before :each do
    @api_key = "test"
  end

  subject { Lob::Client.new(api_key: @api_key) }

  describe "when Lob is initialized" do
    it "should have API key in config" do
      subject.config[:api_key].must_equal @api_key
    end
  end

  it "should return areas resource" do
    subject.areas.must_be_kind_of(Lob::Resources::Area)
  end

  it "should return addresses resource" do
    subject.addresses.must_be_kind_of(Lob::Resources::Address)
  end

  it "should return bank accounts resource" do
    subject.bank_accounts.must_be_kind_of(Lob::Resources::BankAccount)
  end

  it "should return checks resource" do
    subject.checks.must_be_kind_of(Lob::Resources::Check)
  end

  it "should return countries resource" do
    subject.countries.must_be_kind_of(Lob::Resources::Country)
  end

  it "should return letters resource" do
    subject.letters.must_be_kind_of(Lob::Resources::Letter)
  end

  it "should return postcards resource" do
    subject.postcards.must_be_kind_of(Lob::Resources::Postcard)
  end

  it "should return routes resource" do
    subject.routes.must_be_kind_of(Lob::Resources::Route)
  end

  it "should return states resource" do
    subject.states.must_be_kind_of(Lob::Resources::State)
  end

end
