require "spec_helper"

describe Lob::V1::Object do

  before :each do
    @sample_params = {
      description: "TestObject",
    }
    @test_setting_id = 201
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list objects" do
      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      list_result = subject.objects.list
      assert /#{new_object["description"]}/ =~ list_result.to_s
    end
  end

  describe "create" do
    it "should create an object with file url" do
      settings_list = subject.settings.list
      result = subject.objects.create(
        description: @sample_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      result["description"].must_equal(@sample_params[:description])
    end

    it "should create an object with file" do
      settings_list = subject.settings.list
      result = subject.objects.create(
        description: @sample_params[:description],
        file: File.new(File.expand_path("../../../samples/postcardfront.pdf", __FILE__), "rb"),
        setting: @test_setting_id
      )

      result["description"].must_equal(@sample_params[:description])
    end
  end

  describe "find" do
    it "should find an object" do
      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      find_result = subject.objects.find(new_object["id"])
      find_result["description"].must_equal(@sample_params[:description])
    end
  end

  describe "destroy" do
    it "should delete an object" do
      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      delete_result = subject.objects.destroy(new_object["id"])
      assert_equal(new_object["id"], delete_result["id"])
    end
  end

end
