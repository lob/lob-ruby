# Postcard.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))
require 'uri'

RSpec.describe "Postcards Api" do
    it "can be instantiated" do
        postcardApi = PostcardsApi.new()

        expect(postcardApi).not_to be_nil
        expect(postcardApi).to be_a_kind_of(PostcardsApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @postcardApi = PostcardsApi.new(api)

            @addressEditable1 = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @addressEditable2 = AddressEditable.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD ",
                address_state: "NJ",
                address_zip: "07000",
            })

            @dummyPostcard = PostcardEditable.new({
                to: @addressEditable1,
                from: @addressEditable2,
                front: TestFixtures.FILE_LOCATION_4x6,
                back: TestFixtures.FILE_LOCATION_4x6,
                
              });
        end

        it "creates a new postcard" do
            createdPostcard = @postcardApi.create(@dummyPostcard)
            expect(createdPostcard.id).not_to be_nil

            # cancel it in the end
            @postcardApi.cancel(createdPostcard.id)
        end

        it "handles errors returned by the api" do
            postcardEditable = PostcardEditable.new()
            begin
                response = @postcardApi.create(postcardEditable)
            rescue => err
                expect(err.message.include? "to is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            postcardApi = PostcardsApi.new(badapi)

            begin
                response = postcardApi.create(@dummyPostcard)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end


    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @postcardApi = PostcardsApi.new(api)

            @addressEditable1 = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @addressEditable2 = AddressEditable.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD ",
                address_state: "NJ",
                address_zip: "07000",
            })

            @dummyPostcard = PostcardEditable.new({
                to: @addressEditable1,
                from: @addressEditable2,
                front: TestFixtures.FILE_LOCATION_4x6,
                back: TestFixtures.FILE_LOCATION_4x6,
                
              });

            response = @postcardApi.create(@dummyPostcard)
            @postcardId = response.id
        end

        it "retrieves a postcard" do
            response = @postcardApi.get(@postcardId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@postcardId)
        end

        after(:all) do
            @postcardApi.cancel(@postcardId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @postcardApi = PostcardsApi.new(api)
        end

        it "lists postcards with limit, before, and after params" do
            response = @postcardApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_ltr_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @postcardApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_ltr_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @postcardApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil
        end

        [
            [nil, nil],
            ["include", Array.new(1, "total_count")],
        ].each do |which_param, include_param|
            it "lists postcards #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if include_param then
                    args[:"include"] = include_param
                end

                response = @postcardApi.list(args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end
    end

    describe "cancel" do
      before(:all) do
          api = TestFixtures.api_client_with_test_key()
          @postcardApi = PostcardsApi.new(api)

          @addressEditable1 = AddressEditable.new({
            name: "Thing T. Thing",
            address_line1: "1313 CEMETERY LN",
            address_city: "WESTFIELD",
            address_state: "NJ",
            address_zip: "07000",
        })

        @addressEditable2 = AddressEditable.new({
            name: "FESTER",
            address_line1: "001 CEMETERY LN",
            address_line2: "SUITE 666",
            address_city: "WESTFIELD ",
            address_state: "NJ",
            address_zip: "07000",
        })

        @dummyPostcard = PostcardEditable.new({
            to: @addressEditable1,
            from: @addressEditable2,
            front: TestFixtures.FILE_LOCATION_4x6,
            back: TestFixtures.FILE_LOCATION_4x6,
            
          });

          response = @postcardApi.create(@dummyPostcard)
          @postcardId = response.id
      end

      it "deletes a card" do
          response = @postcardApi.cancel(@postcardId)

          expect(response.id).to eq(@postcardId)
          expect(response.deleted).to eq(true)
      end
    end
end