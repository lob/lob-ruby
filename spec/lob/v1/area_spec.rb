require "spec_helper"

describe Lob::V1::Area do
  before :each do
    @sample_area_params = {
      front: "https://s3-us-west-2.amazonaws.com/lob-assets/areafront.pdf",
      back: "https://s3-us-west-2.amazonaws.com/lob-assets/areaback.pdf",
      routes: ["94158-C001", "94107-C031"],
    }
  end

  subject { Lob(api_key: ENV["LOB_API_KEY"]) }

  describe "list" do
    it "should list areas" do
      VCR.use_cassette('list_areas') do
        @sample_area_params[:name] = "Test Area"
        new_area = subject.areas.create @sample_area_params

        list_result = subject.areas.list

        assert /#{new_area["name"]}/ =~ list_result.to_s
      end
    end
  end

  describe "create" do
    it "should create an area object" do
      VCR.use_cassette('create_area_object') do
        result = subject.areas.create @sample_area_params

        result["object"].must_equal("area")
      end
    end

    it "should create an area object with optionals params" do
      VCR.use_cassette('create_area_object_with_optional_params') do
        @sample_area_params[:name] = "123456789"
        @sample_area_params[:target_type] = "all"
        @sample_area_params[:full_bleed] = "1"

        result = subject.areas.create @sample_area_params

        result["name"].must_equal @sample_area_params[:name]
        result["target_type"].must_equal @sample_area_params[:target_type]
        # TODO this should be added when Lob API is updated
        # result["full_bleed"].must_equal(@sample_area_params[:full_bleed])
      end
    end

    it "should create an area object with a single route" do
      VCR.use_cassette('create_area_object_with_single_route') do
        @sample_area_params[:routes] = "94158-C001"
        result = subject.areas.create @sample_area_params

        result["object"].must_equal("area")
      end
    end

    it "should create an area object with zip_codes" do
      VCR.use_cassette('create_area_object_with_zip') do
        @sample_area_params[:routes] = ["94158"];
        result = subject.areas.create @sample_area_params

        result["object"].must_equal("area")
      end
    end
  end

  describe "find" do
    it "should find an area" do
      VCR.use_cassette('find_area') do
        @sample_area_params[:name] = "Test Area"
        new_area = subject.areas.create @sample_area_params

        result = subject.areas.find new_area["id"]
        result["name"].must_equal @sample_area_params[:name]
      end
    end
  end
end
