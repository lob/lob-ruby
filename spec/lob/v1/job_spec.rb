require "spec_helper"

describe Lob::V1::Job do

  before :all do
    @sample_address_params = {
      name:    "TestAddress",
      email:   "test@test.com",
      address: ["123 Test Street", "Unit 199"],
      city:    "Mountain View",
      state:   "CA",
      country: "USA",
      zip:     94085
    }

    @sample_raw_address_params = {
      name:    "TestAddress",
      address_line1:   "123 Test Street",
      address_city:    "Mountain View",
      address_state:   "CA",
      address_country: "USA",
      address_zip:     94085
    }

    @sample_job_params    = { name: "TestJob" }
    @sample_object_params = { name: "TestObject" }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }


  describe "list" do
    it "should list jobs" do
      VCR.use_cassette('list_jobs') do
        new_address = subject.addresses.create @sample_address_params
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/goblue.pdf",
          settings_list.first["id"]
        )

        new_job = subject.jobs.create(
          @sample_job_params[:name],
          new_address["id"],
          new_object["id"]
        )

        list_result = subject.jobs.list
        assert /#{new_job["name"]}/ =~ list_result.to_s
      end
    end
  end


  describe "create" do
    it "should create a job with address_id" do
      VCR.use_cassette('create_job_with_address_id') do
        new_address = subject.addresses.create @sample_address_params

        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/goblue.pdf",
          settings_list.first["id"]
        )

        result = subject.jobs.create(@sample_job_params[:name], new_address["id"], new_object["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end

    it "should create a job with address params" do
      VCR.use_cassette('create_job_with_address_params') do
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/goblue.pdf",
          settings_list.first["id"]
        )

        result = subject.jobs.create(@sample_job_params[:name], @sample_raw_address_params, new_object["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end


    it "should create a job with object params" do
      VCR.use_cassette('create_job_with_object_params') do
        new_address = subject.addresses.create @sample_address_params
        settings_list = subject.settings.list
        new_object_params = {
          name:      @sample_object_params[:name],
          file:      "https://www.lob.com/goblue.pdf",
          setting_id: settings_list.first["id"]
        }

        result = subject.jobs.create(@sample_job_params[:name], new_address["id"], new_object_params)
        result["name"].must_equal(@sample_job_params[:name])
      end
    end
  end


  describe "find" do
    it "should find a job" do
      VCR.use_cassette('find_job') do
        new_address = subject.addresses.create @sample_address_params

        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/goblue.pdf",
          settings_list.first["id"]
        )

        new_job = subject.jobs.create(@sample_job_params[:name], new_address["id"], new_object["id"])

        result  = subject.jobs.find(new_job["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end
  end

end
