require "spec_helper"

describe Lob::Resources::SelfMailer do

  before :each do
    @sample_address_params = {
      name: "TestAddress",
      email: "test@test.com",
      address_line1: "123 Test Street",
      address_line2: "Unit 199",
      address_city: "Mountain View",
      address_state: "CA",
      address_country: "US",
      address_zip: 94085
    }

    @sample_self_mailer_params = {
      description: "Test Self Mailer",
      outside: "<h1>Sample Self Mailer Outside</h1>",
      inside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf",
    }
  end

  subject { Lob::Client.new(api_key: API_KEY) }

  describe "list" do
    it "should list self mailers" do
      self_mailers = subject.self_mailers.list()
      assert self_mailers["object"] == "list"
    end
  end


  describe "create" do
    it "should create a self mailer with address_id" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: @sample_self_mailer_params[:outside],
        inside: @sample_self_mailer_params[:inside],
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end

    it "should create a self mailer with to address params" do
      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: @sample_address_params,
        outside: @sample_self_mailer_params[:outside],
        inside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf"
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end

    it "should create a self mailer with from address params" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        from: @sample_address_params,
        outside: @sample_self_mailer_params[:outside],
        inside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf"
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end

    it "should create a self mailer with front and back as urls" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_outside.pdf",
        inside:  "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf"
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end


    it "should create a self mailer with front and back as PDFs" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: File.new(File.expand_path("../../../samples/sfm-6x18-outside.pdf", __FILE__)),
        inside: File.new(File.expand_path("../../../samples/sfm-6x18-inside.pdf", __FILE__))
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end

    it "should create a self mailer with front and back as 12x9 PDFs" do
      new_address = subject.addresses.create @sample_address_params

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        size: "12x9_bifold",
        outside: File.new(File.expand_path("../../../samples/sfm-12x9-outside.pdf", __FILE__)),
        inside: File.new(File.expand_path("../../../samples/sfm-12x9-inside.pdf", __FILE__))
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
    end


    it "should create a self mailer with a merge variable list" do
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

      result = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf",
        inside: "<html>{{#list}} {{name}} {{/list}}</html>",
        merge_variables: merge_variables
      )

      result["description"].must_equal(@sample_self_mailer_params[:description])
      result["merge_variables"]["list"][0]["name"].must_equal("Larissa")
      result["merge_variables"]["list"][1]["name"].must_equal("Larry")
    end
  end


  describe "find" do
    it "should find a self mailer" do
      new_address = subject.addresses.create @sample_address_params

      new_self_mailer = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: @sample_self_mailer_params[:outside],
        inside: @sample_self_mailer_params[:inside]
      )

      result  = subject.self_mailers.find(new_self_mailer["id"])
      result["description"].must_equal(@sample_self_mailer_params[:description])
    end
  end


  describe "destroy" do
    it "should destroy a self mailer" do
      new_address = subject.addresses.create @sample_address_params

      new_self_mailer = subject.self_mailers.create(
        description: @sample_self_mailer_params[:description],
        to: new_address["id"],
        outside: @sample_self_mailer_params[:outside],
        inside: @sample_self_mailer_params[:inside]
      )

      result = subject.self_mailers.destroy(new_self_mailer["id"])
      result["id"].must_equal(new_self_mailer["id"])
      result["deleted"].must_equal(true)
    end
  end

end
