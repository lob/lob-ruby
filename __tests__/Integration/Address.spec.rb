# Address.unit.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'api/addresses_api'
require 'models/address'
require 'models/address_editable'

RSpec.describe "AddressesApi" do
    # it "can be instantiated" do
    #     addressApi = AddressesApi.new()

    #     expect(addressApi).not_to be_nil
    #     expect(addressApi).to be_a_kind_of(AddressesApi)
    # end

    describe "Create" do
        before(:all) do
            @api = TestFixtures.api_client_with_test_key()
        end
    
        it "creates a new address" do
            

            templateVersionCreate = TemplateVersionWritable.new({ 
                description: "Second Version",
                html: "<html>Second HTML for {{name}}</html>",
              });
              
              templateVersionApi = TemplateVersionsApi.new(@api)
              
              begin
                createdTemplateVersion = templateVersionApi.create("tmpl_a74a409e437c08f", templateVersionCreate)
              rescue => err
                p err.message
              end
        end

    #     it "handles errors returned by the api" do
    #         addressApi = AddressesApi.new(@api)
    #         addressEditable = AddressEditable.new()
    #         begin
    #             response = addressApi.create(addressEditable)
    #         rescue => err
    #             expect(err.message.include? "address_line1 is required").to be(true)
    #         end
    #     end

    #     it "does not allow creation with invalid key" do
    #         config = OpenapiClient::Configuration.default
    #         config.username = "fake key"
    #         badapi = OpenapiClient::ApiClient.new(config)

    #         addressApi = AddressesApi.new(badapi)
    #         addressEditable = AddressEditable.new({
    #             name: "Thing T. Thing",
    #             address_line1: "1313 CEMETERY LN",
    #             address_city: "WESTFIELD",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         begin
    #             response = addressApi.create(addressEditable)
    #         rescue => err
    #             expect(err.message.include? "Your API key is not valid.").to be(true)
    #         end
    #     end
    # end

    # describe "Get" do
    #     before(:all) do
    #         @api = TestFixtures.api_client_with_test_key()

    #         @addressApi = AddressesApi.new(@api)
    #         addressEditable = AddressEditable.new({
    #             name: "Thing T. Thing",
    #             address_line1: "1313 CEMETERY LN",
    #             address_city: "WESTFIELD",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         response = @addressApi.create(addressEditable)
    #         @addressId = response.id
    #     end

    #     it "retrieves an address" do
    #         response = @addressApi.get(@addressId)

    #         expect(response).not_to be_nil()
    #         expect(response.id).to eq(@addressId)
    #     end
    # end

    # describe "List" do
    #     before(:all) do
    #         @api = TestFixtures.api_client_with_test_key()
    #         @addressApi = AddressesApi.new(@api)

    #         addressEditable1 = AddressEditable.new({
    #             name: "Thing T. Thing",
    #             address_line1: "1313 CEMETERY LN",
    #             address_city: "WESTFIELD",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         addressEditable2 = AddressEditable.new({
    #             name: "FESTER",
    #             address_line1: "001 CEMETERY LN",
    #             address_line2: "SUITE 666",
    #             address_city: "WESTFIELD ",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         addressEditable3 = AddressEditable.new({
    #             name: "MORTICIA ADDAMS",
    #             address_line1: "1212 CEMETERY LANE",
    #             address_city: "WESTFIELD",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         response1 = @addressApi.create(addressEditable1)
    #         response2 = @addressApi.create(addressEditable2)
    #         response3 = @addressApi.create(addressEditable3)

    #         @address1Id = response1.id
    #         @address2Id = response2.id
    #         @address3Id = response3.id
    #     end

    #     it "lists addresses" do
    #         response = @addressApi.list()

    #         expect(response.data.length()).to be > 0
    #     end

    #     it "lists addresses with after param" do
    #         response = @addressApi.list()
    #         responseAfter = @addressApi.list(after: response.getNextPageToken())
    #         expect(responseAfter.data.length()).to be > 0
    #     end

    #     it "lists addresses with before param" do
    #         response = @addressApi.list()
    #         responseAfter = @addressApi.list(before: response.getNextPageToken())
    #         expect(responseAfter.data.length()).to be > 0
    #     end

    #     it "lists addresses with a limit parameter" do
    #         response = @addressApi.list(limit: 2)

    #         expect(response.data.length()).to be(2)
    #     end
    # end

    # describe "Delete" do
    #     before(:all) do
    #         @api = TestFixtures.api_client_with_test_key()

    #         @addressApi = AddressesApi.new(@api)
    #         addressEditable = AddressEditable.new({
    #             name: "Thing T. Thing",
    #             address_line1: "1313 CEMETERY LN",
    #             address_city: "WESTFIELD",
    #             address_state: "NJ",
    #             address_zip: "07000",
    #         })

    #         response = @addressApi.create(addressEditable)
    #         @addressId = response.id
    #     end

    #     it "deletes an address" do
    #         response = @addressApi.delete(@addressId)

    #         expect(response.id).to eq(@addressId)
    #         expect(response.deleted).to eq(true)
    #     end
    end
  end