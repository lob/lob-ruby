require "spec_helper"

describe Lob::V1::Object do

  before :each do
    @sample_params = {
      name:    "TestObject",
    }
    @test_setting_id = 201
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }


  describe "list" do
    it "should list objects" do
      VCR.use_cassette('list_objects') do
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          name: @sample_params[:name],
          file: "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        )

        list_result = subject.objects.list
        assert /#{new_object["name"]}/ =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create an object with file url" do
      VCR.use_cassette('create_object_with_url') do
        settings_list = subject.settings.list
        result = subject.objects.create(
          name: @sample_params[:name],
          file: "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        )

        result["name"].must_equal(@sample_params[:name])
      end
    end

    it "should create an object with file" do
      VCR.use_cassette('create_object_with_file') do
        settings_list = subject.settings.list
        result = subject.objects.create(
          name: @sample_params[:name],
          file: File.new(File.expand_path("../../../samples/test.pdf", __FILE__), "rb"),
          setting_id: @test_setting_id
        )

        result["name"].must_equal(@sample_params[:name])
      end
    end
  end


  describe "find" do
    it "should find an object" do
      VCR.use_cassette('find_object') do
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          name: @sample_params[:name],
          file: "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        )

        find_result = subject.objects.find(new_object["id"])
        find_result["name"].must_equal(@sample_params[:name])
      end
    end
  end


  describe "destroy" do
    it "should delete an object" do
      VCR.use_cassette('delete_object') do
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          name: @sample_params[:name],
          file: "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        )

        delete_result = subject.objects.destroy(new_object["id"])
        assert /has been deleted/ =~ delete_result["message"]
      end
    end
  end

end
