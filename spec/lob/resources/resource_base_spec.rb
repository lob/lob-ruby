require "spec_helper"

describe Lob::Resources::ResourceBase do

  before :each do
    @api_key = API_KEY
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

  it "should accept an idempotency_key" do
    sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      address_city:    "Mountain View",
      address_state:   "CA",
      address_country: "US",
      address_zip:     94085
    }

    sample_postcard_params = {
      description:    "TestPostcard",
      message: "Sample postcard message"
    }

    new_address = subject.addresses.create sample_address_params

    idempotency_key = "Test_Idempotency_key"

    new_postcard = subject.postcards.create({
      description: sample_postcard_params[:description],
      to: new_address["id"],
      message: sample_postcard_params[:message],
      front: "https://lob.com/postcardfront.pdf"
    }, {
      "Idempotency-Key" => idempotency_key
    })

    new_postcard_dup = subject.postcards.create({
      description: sample_postcard_params[:description],
      to: new_address["id"],
      message: sample_postcard_params[:message],
      front: "https://lob.com/postcardfront.pdf"
    }, {
      "Idempotency-Key" => idempotency_key
    })

    new_postcard["id"].must_equal(new_postcard_dup["id"])
  end

end
