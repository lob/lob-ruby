require "spec_helper"

describe Lob::Resources::Member do

  before :each do
    @sample_group_params = {
      description: "Unsubscribe group",
      metadata: {
        test: 'stuff'
      }
    }
    @sample_member_params = {
      recipient: {
        name: 'Sophie',
        address_line1: '185 Berry St',
        address_line2: '6100',
        address_city: 'San Francisco',
        address_state: 'CA',
        address_zip: '94107'
      },
      description: "Some Member",
      metadata: {
        test: 'stuff'
      }
    }
    @new_group = subject.groups.create @sample_group_params
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list members in a group" do
      assert subject.members.list(@new_group["id"])["object"] == "list"
    end
  end


  describe "create" do
    it "should create a member" do
      result = subject.members.create(@new_group["id"], @sample_member_params)

      result["description"].must_equal(@sample_member_params[:description])
    end
  end


  describe "find" do
    it "should find a member" do
      new_member = subject.members.create(@new_group["id"], @sample_member_params)
      
      find_result = subject.members.find(@new_group["id"], new_member["id"])
      find_result["description"].must_equal(@sample_member_params[:description])
    end
  end


  describe "destroy" do
    it "should delete a member" do
      new_member = subject.members.create(@new_group["id"], @sample_member_params)

      delete_result = subject.members.destroy(@new_group["id"], new_member["id"])
      assert_equal(new_member["id"], delete_result["id"])
    end
  end
end
