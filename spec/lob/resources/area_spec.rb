require "spec_helper"

describe Lob::Resources::Area do
  before :each do
    @sample_area_params = {
      description: "Test Area",
      front: "https://s3-us-west-2.amazonaws.com/lob-assets/areafront.pdf",
      back: "https://s3-us-west-2.amazonaws.com/lob-assets/areaback.pdf",
      routes: ["94158-C001", "94107-C031"],
    }
  end

  subject { Lob(api_key: API_KEY) }

  describe "list" do
    it "should list areas" do
      assert subject.areas.list["object"] == "list"
    end
  end

  describe "create" do
    it "should create an area object" do
      result = subject.areas.create @sample_area_params

      result["object"].must_equal("area")
    end

    it "should create an area object with optionals params" do
      @sample_area_params[:target_type] = "all"

      result = subject.areas.create @sample_area_params

      result["description"].must_equal @sample_area_params[:description]
    end

    it "should create an area object with a single route" do
      @sample_area_params[:routes] = "94158-C001"
      result = subject.areas.create @sample_area_params

      result["object"].must_equal("area")
    end

    it "should create an area object with zip_codes" do
      @sample_area_params[:routes] = ["94158"];
      result = subject.areas.create @sample_area_params

      result["object"].must_equal("area")
    end
  end

  describe "find" do
    it "should find an area" do
      new_area = subject.areas.create @sample_area_params

      result = subject.areas.find new_area["id"]
      result["object"].must_equal("area")
    end
  end
end
