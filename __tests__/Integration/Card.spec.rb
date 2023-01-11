# Card.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "CardsApi" do
    it "can be instantiated" do
        cardApi = CardsApi.new()

        expect(cardApi).not_to be_nil
        expect(cardApi).to be_a_kind_of(CardsApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardApi = CardsApi.new(api)

            @cardEditable = CardEditable.new({
                front: TestFixtures.FILE_LOCATION,
                back: TestFixtures.FILE_LOCATION,
                size: "2.125x3.375"
            })
        end

        it "creates a new card" do
            createdCard = @cardApi.create(@cardEditable)
            expect(createdCard.id).not_to be_nil

            # delete it in the end
            @cardApi.delete(createdCard.id)
        end

        it "handles errors returned by the api" do
            cardEditable = CardEditable.new()
            begin
                response = @cardApi.create(cardEditable)
            rescue => err
                expect(err.message.include? "front is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            cardApi = CardsApi.new(badapi)

            begin
                response = cardApi.create(@cardEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Update" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardApi = CardsApi.new(api)

            cardEditable = CardEditable.new({
                front: TestFixtures.FILE_LOCATION,
                back: TestFixtures.FILE_LOCATION,
                size: "2.125x3.375"
            })

            response = @cardApi.create(cardEditable)
            @cardId = response.id
        end

        it "updates a card" do
            cardUpdatable = CardUpdatable.new({
                description: "Ruby Updated Integration Test Card"
            })
            response = @cardApi.update(@cardId, cardUpdatable)

            expect(response.description).to eq("Ruby Updated Integration Test Card")
            expect(response.id).to eq(@cardId)
        end

        it "handles errors returned by the api" do
            cardUpdatable = CardUpdatable.new({
                description: "Ruby Updated Integration Test Card"
            })

            begin
                response = @cardApi.update("card_fakeId", cardUpdatable)
            rescue => err
                expect(err.message.include? "card not found").to be(true)
            end
        end

        after(:all) do
            @cardApi.delete(@cardId)
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardApi = CardsApi.new(api)

            cardEditable = CardEditable.new({
                front: TestFixtures.FILE_LOCATION,
                back: TestFixtures.FILE_LOCATION,
                size: "2.125x3.375"
            })

            response = @cardApi.create(cardEditable)
            @cardId = response.id
        end

        it "retrieves a card" do
            response = @cardApi.get(@cardId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@cardId)
        end

        after(:all) do
            @cardApi.delete(@cardId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardApi = CardsApi.new(api)
        end

        it "lists cards with limit, before, and after params" do
            response = @cardApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_ltr_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @cardApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_ltr_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @cardApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil
        end

        [
            [nil, nil],
            ["include", Array.new(1, "total_count")],
        ].each do |which_param, include_param|
            it "lists cards #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if include_param then
                    args[:"include"] = include_param
                end

                response = @cardApi.list(args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end
    end

    describe "Delete" do
      before(:all) do
          api = TestFixtures.api_client_with_test_key()
          @cardApi = CardsApi.new(api)

          cardEditable = CardEditable.new({
              front: TestFixtures.FILE_LOCATION,
              back: TestFixtures.FILE_LOCATION,
              size: "2.125x3.375"
          })

          response = @cardApi.create(cardEditable)
          @cardId = response.id
      end

      it "deletes a card" do
          response = @cardApi.delete(@cardId)

          expect(response.id).to eq(@cardId)
          expect(response.deleted).to eq(true)
      end
    end
end