require "spec_helper"

describe Lob::V1::Letter do

  before :each do
    @sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      city:    "Mountain View",
      state:   "CA",
      country: "US",
      zip:     94085
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }


  describe "list" do
    it "should list letter" do
      VCR.use_cassette('list_letters') do
        new_address = subject.addresses.create @sample_address_params

        new_letter = subject.letters.create(
          description: "TestLetter",
          color: true,
          file: "https://s3-us-west-2.amazonaws.com/lob-assets/100_101_doc.pdf",
          to: new_address["id"],
          from: new_address["id"]
        )

        list_result = subject.letters.list
        assert /#{new_letter["description"]}/ =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create a letter with address_id" do
      VCR.use_cassette('create_letter_with_address_id') do
        new_address = subject.addresses.create @sample_address_params

        new_letter = subject.letters.create(
          description: "TestLetter",
          color: true,
          file: "https://s3-us-west-2.amazonaws.com/lob-assets/100_101_doc.pdf",
          to: new_address["id"],
          from: @sample_address_params
        )

        new_letter["description"].must_equal("TestLetter")
      end
    end

    it "should create a letter with a local file" do
      VCR.use_cassette('create_letter_with_address_id') do
        new_address = subject.addresses.create @sample_address_params

        new_letter = subject.letters.create(
          description: "TestLetter",
          color: true,
          file: File.new(File.expand_path("../../../samples/8.5x11.pdf", __FILE__)),
          to: new_address["id"],
          from: @sample_address_params
        )

        new_letter["description"].must_equal("TestLetter")
      end
    end
  end


  describe "find" do
    it "should find a letter" do
      VCR.use_cassette('find_letter') do
        new_address = subject.addresses.create @sample_address_params

        new_letter = subject.letters.create(
          description: "TestLetter",
          color: true,
          file: "https://s3-us-west-2.amazonaws.com/lob-assets/100_101_doc.pdf",
          to: new_address["id"],
          from: new_address["id"]
        )

        result = subject.letters.find(new_letter["id"])
        assert /#{new_letter["description"]}/ =~ result.to_s
      end
    end
  end

end
