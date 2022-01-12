require "spec_helper"

describe Lob::Resources::Card do

  before :each do
    @sample_params = {
      description: "Test card",
      front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf",
      back: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf",
      size: "2.125x3.375",
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list addresses" do
      assert subject.card.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create an address" do
      result = subject.card.create @sample_params

      result["name"].must_equal(@sample_params[:name])
    end
  end


  describe "find" do
    it "should find an address" do
      new_card = subject.card.create @sample_params

      find_result = subject.card.find(new_card["id"])
      find_result["description"].must_equal(@sample_params[:description])
    end
  end


  describe "destroy" do
    it "should delete an address" do
      new_card = subject.card.create @sample_params

      delete_result = subject.card.destroy(new_card["id"])
      assert_equal(new_card["id"], delete_result["id"])
    end
  end
end
