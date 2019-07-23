require "spec_helper"

describe Lob::Resources::Group do

  before :each do
    @sample_params = {
      description: "Unsubscribe group",
      metadata: {
        test: 'stuff'
      }
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list groups" do
      assert subject.groups.list["object"] == "list"
    end
  end


  describe "create" do
    it "should create a group" do
      result = subject.groups.create @sample_params

      result["description"].must_equal(@sample_params[:description])
    end
  end


  describe "find" do
    it "should find a group" do
      new_group = subject.groups.create @sample_params

      find_result = subject.groups.find(new_group["id"])
      find_result["description"].must_equal(@sample_params[:description])
    end
  end


  describe "destroy" do
    it "should delete a group" do
      new_group = subject.groups.create @sample_params

      delete_result = subject.groups.destroy(new_group["id"])
      assert_equal(new_group["id"], delete_result["id"])
    end
  end
end
