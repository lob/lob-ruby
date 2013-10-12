require "spec_helper"

describe Lob::V1::Job do

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

    @sample_job_params    = { name: "TestJob" }
    @sample_object_params = { name: "TestObject" }
    @test_setting_id = 201
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"], api_version: "v1") }


  describe "list" do
    it "should list jobs" do
      VCR.use_cassette('list_jobs') do
        new_address = subject.addresses.create @sample_address_params
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/test.pdf",
          @test_setting_id
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
          "https://www.lob.com/test.pdf",
          @test_setting_id
        )

        result = subject.jobs.create(@sample_job_params[:name], new_address["id"], new_object["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end


    it "should be able to create multiple jobs" do
      VCR.use_cassette('create_multiple_jobs') do
        new_address = subject.addresses.create @sample_address_params

        settings_list = subject.settings.list

        new_object_params = {
          name:      @sample_object_params[:name],
          file:      "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        }

        another_object_params = {
          name:      "Another #{@sample_object_params[:name]}",
          file:      "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
        }

        result = subject.jobs.create(
          @sample_job_params[:name],
          new_address["id"],
          [new_object_params, another_object_params]
        )

        result["name"].must_equal(@sample_job_params[:name])
      end
    end


    it "should create a job with address params" do
      VCR.use_cassette('create_job_with_address_params') do
        settings_list = subject.settings.list
        new_object = subject.objects.create(
          @sample_object_params[:name],
          "https://www.lob.com/test.pdf",
          @test_setting_id
        )

        result = subject.jobs.create(@sample_job_params[:name], @sample_address_params, new_object["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end


    it "should create a job with object params" do
      VCR.use_cassette('create_job_with_object_params') do
        new_address = subject.addresses.create @sample_address_params
        settings_list = subject.settings.list
        new_object_params = {
          name:      @sample_object_params[:name],
          file:      "https://www.lob.com/test.pdf",
          setting_id: @test_setting_id
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
          "https://www.lob.com/test.pdf",
          @test_setting_id
        )

        new_job = subject.jobs.create(@sample_job_params[:name], new_address["id"], new_object["id"])

        result  = subject.jobs.find(new_job["id"])
        result["name"].must_equal(@sample_job_params[:name])
      end
    end
  end

end
