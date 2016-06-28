require "spec_helper"

describe Lob::V1::Letter do

  before :each do
    @sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      address_city:    "Mountain View",
      address_state:   "CA",
      address_country: "US",
      address_zip:     94085
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list letter" do
      assert subject.letters.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create a letter with address_id" do
      new_address = subject.addresses.create @sample_address_params

      new_letter = subject.letters.create(
        description: "TestLetter",
        color: true,
        file: "https://s3-us-west-2.amazonaws.com/lob-assets/letter-goblue.pdf",
        to: new_address["id"],
        from: @sample_address_params
      )

      new_letter["description"].must_equal("TestLetter")
    end

    it "should create a letter with a local file" do
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


  describe "find" do
    it "should find a letter" do
      new_address = subject.addresses.create @sample_address_params

      new_letter = subject.letters.create(
        description: "TestLetter",
        color: true,
        file: "https://s3-us-west-2.amazonaws.com/lob-assets/letter-goblue.pdf",
        to: new_address["id"],
        from: new_address["id"]
      )

      result = subject.letters.find(new_letter["id"])
      assert /#{new_letter["description"]}/ =~ result.to_s
    end
  end


  describe "find" do
    it "should find a letter" do
      new_address = subject.addresses.create @sample_address_params

      new_letter = subject.letters.create(
        description: "TestLetter",
        color: true,
        file: "https://s3-us-west-2.amazonaws.com/lob-assets/letter-goblue.pdf",
        to: new_address["id"],
        from: new_address["id"]
      )

      result = subject.letters.find(new_letter["id"])
      assert /#{new_letter["description"]}/ =~ result.to_s
    end
  end


  describe "destroy" do
    it "should destroy a letter" do
      new_address = subject.addresses.create @sample_address_params

      new_letter = subject.letters.create(
        description: "TestLetter",
        color: true,
        file: "https://s3-us-west-2.amazonaws.com/lob-assets/letter-goblue.pdf",
        to: new_address["id"],
        from: new_address["id"]
      )

      result = subject.letters.destroy(new_letter["id"])
      result["id"].must_equal(new_letter["id"])
      result["deleted"].must_equal(true)
    end
  end

end
