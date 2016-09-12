require "spec_helper"

describe Lob::V1::Job do

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

    @sample_job_params    = { description: "TestJob" }
    @sample_object_params = { description: "TestObject" }
    @test_setting_id = 201
  end

  subject { Lob(api_key: API_KEY) }

  describe "list" do
    it "should list jobs" do
      assert subject.jobs.list["object"] == "list"
    end
  end

  describe "create" do
    it "should create a job with address_id" do
      new_address = subject.addresses.create @sample_address_params

      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_object_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      result = subject.jobs.create(
        description: @sample_job_params[:description],
        from: new_address["id"],
        to: new_address["id"],
        objects: new_object["id"]
      )
      result["description"].must_equal(@sample_job_params[:description])
    end

    it "should be able to create multiple jobs" do
      new_address = subject.addresses.create @sample_address_params

      settings_list = subject.settings.list

      new_object_params = {
        description: @sample_object_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: 500
      }

      another_object_params = {
        description: "Another #{@sample_object_params[:description]}",
        file: "https://lob.com/postcardfront.pdf",
        setting: 500
      }

      result = subject.jobs.create(
        description: @sample_job_params[:description],
        from: new_address["id"],
        to: new_address["id"],
        objects: [new_object_params, another_object_params]
      )

      result["description"].must_equal(@sample_job_params[:description])
    end

    it "should be able to create jobs from a mix of remote and local files" do
      new_address = subject.addresses.create @sample_address_params

      new_object_params = {
        description: @sample_object_params[:description],
        file: File.new(File.expand_path("../../../samples/postcardfront.pdf", __FILE__)),
        setting: 500
      }

      another_object_params = {
        description: "Another #{@sample_object_params[:description]}",
        file: "https://lob.com/postcardfront.pdf",
        setting: 500
      }

      result = subject.jobs.create(
        description: @sample_job_params[:description],
        from: new_address["id"],
        to: new_address["id"],
        objects: [new_object_params, another_object_params]
      )

      result["description"].must_equal(@sample_job_params[:description])
    end

    it "should create a job with address params" do
      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_object_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      result = subject.jobs.create(
        description: @sample_job_params[:description],
        from: @sample_address_params,
        to: @sample_address_params,
        objects: new_object["id"]
      )
      result["description"].must_equal(@sample_job_params[:description])
    end

    it "should create a job with object params" do
      new_address = subject.addresses.create @sample_address_params
      settings_list = subject.settings.list
      new_object_params = {
        description: @sample_object_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      }

      result = subject.jobs.create(
        description: @sample_job_params[:description],
        from: new_address["id"],
        to: new_address["id"],
        objects: new_object_params
      )
      result["description"].must_equal(@sample_job_params[:description])
    end
  end

  describe "find" do
    it "should find a job" do
      new_address = subject.addresses.create @sample_address_params

      settings_list = subject.settings.list
      new_object = subject.objects.create(
        description: @sample_object_params[:description],
        file: "https://lob.com/postcardfront.pdf",
        setting: @test_setting_id
      )

      new_job = subject.jobs.create(
        description: @sample_job_params[:description],
        from: new_address["id"],
        to: new_address["id"],
        objects: new_object["id"]
      )

      result = subject.jobs.find(new_job["id"])
      result["description"].must_equal(@sample_job_params[:description])
    end
  end

end
