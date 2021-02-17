require "spec_helper"

describe Lob::Resources::Postcard do

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

    @sample_postcard_params = {
      description:    "TestPostcard",
      back: "<h1>Sample postcard back</h1>"
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list postcards" do
      assert subject.postcards.list({ include: ['total_count'] })["object"] == "list"
    end
  end


  describe "create" do
    it "should create a postcard with address_id" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        back: @sample_postcard_params[:back],
        front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_front.pdf"
      )

      result["description"].must_equal(@sample_postcard_params[:description])
    end

    it "should create a postcard with to address params" do
      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: @sample_address_params,
        back: @sample_postcard_params[:back],
        front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_front.pdf"
      )

      result["description"].must_equal(@sample_postcard_params[:description])
    end

    it "should create a postcard with from address params" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        from: @sample_address_params,
        back: @sample_postcard_params[:back],
        front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_front.pdf"
      )

      result["description"].must_equal(@sample_postcard_params[:description])
    end

    it "should create a postcard with front and back as urls" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_front.pdf",
        back:  "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_back.pdf"
      )

      result["description"].must_equal(@sample_postcard_params[:description])
    end


    it "should create a postcard with front and back as PDFs" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        front: File.new(File.expand_path("../../../samples/postcardfront.pdf", __FILE__)),
        back: File.new(File.expand_path("../../../samples/postcardback.pdf", __FILE__))
      )

      result["description"].must_equal(@sample_postcard_params[:description])
    end

    it "should create a postcard with a merge variable list" do
      new_address = subject.addresses.create @sample_address_params
      merge_variables = {
        list: [
          {
            name: "Larissa"
          },
          {
            name: "Larry"
          }
        ]
      }

      result = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        back: "<html>{{#list}} {{name}} {{/list}}</html>",
        front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/pc_4x6_front.pdf",
        merge_variables: merge_variables
      )

      result["description"].must_equal(@sample_postcard_params[:description])
      result["merge_variables"]["list"][0]["name"].must_equal("Larissa")
      result["merge_variables"]["list"][1]["name"].must_equal("Larry")
    end
  end


  describe "find" do
    it "should find a postcard" do
      new_address = subject.addresses.create @sample_address_params

      new_postcard = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        front: File.new(File.expand_path("../../../samples/postcardfront.pdf", __FILE__)),
        back: File.new(File.expand_path("../../../samples/postcardback.pdf", __FILE__))
      )

      result  = subject.postcards.find(new_postcard["id"])
      result["description"].must_equal(@sample_postcard_params[:description])
    end
  end


  describe "destroy" do
    it "should destroy a postcard" do
      new_address = subject.addresses.create @sample_address_params

      new_postcard = subject.postcards.create(
        description: @sample_postcard_params[:description],
        to: new_address["id"],
        front: File.new(File.expand_path("../../../samples/postcardfront.pdf", __FILE__)),
        back: File.new(File.expand_path("../../../samples/postcardback.pdf", __FILE__))
      )

      result = subject.postcards.destroy(new_postcard["id"])
      result["id"].must_equal(new_postcard["id"])
      result["deleted"].must_equal(true)
    end
  end

end
