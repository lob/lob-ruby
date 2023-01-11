# CardOrder.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "CardOrdersApi" do
    it "can be instantiated" do
        cardOrderApi = CardOrdersApi.new()

        expect(cardOrderApi).not_to be_nil
        expect(cardOrderApi).to be_a_kind_of(CardOrdersApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardOrderApi = CardOrdersApi.new(api)
            @cardApi = CardsApi.new(api)

            cardEditable = CardEditable.new({
                front: TestFixtures.FILE_LOCATION,
                back: TestFixtures.FILE_LOCATION,
                size: "2.125x3.375"
            })

            @cardId = @cardApi.create(cardEditable).id
            puts @cardId

            @cardOrderEditable = CardOrderEditable.new({
                quantity: 10000
            })
        end

        it "creates a new card order" do
            createdCardOrder = @cardOrderApi.create(@cardId, @cardOrderEditable)
            expect(createdCardOrder.id).not_to be_nil
        end

        it "handles errors returned by the api" do
            cardOrderEditable = CardOrderEditable.new()
            begin
                response = @cardOrderApi.create(@cardId, cardOrderEditable)
            rescue => err
                expect(err.message.include? "quantity is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            cardOrderApi = CardOrdersApi.new(badapi)

            begin
                response = cardOrderApi.create(@cardId, @cardOrderEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end

        after(:all) do
          api = TestFixtures.api_client_with_test_key()
          cardApi = CardsApi.new(api)
          cardApi.delete(@cardId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @cardOrderApi = CardOrdersApi.new(api)
            @cardApi = CardsApi.new(api)

            cardEditable = CardEditable.new({
                front: TestFixtures.FILE_LOCATION,
                back: TestFixtures.FILE_LOCATION,
                size: "2.125x3.375"
            })

            @cardId = @cardApi.create(cardEditable).id

            @cardOrderEditable = CardOrderEditable.new({
                quantity: 10002
            })
            @cardOrderApi.create(@cardId, @cardOrderEditable)
            @cardOrderApi.create(@cardId, @cardOrderEditable)
            @cardOrderApi.create(@cardId, @cardOrderEditable)
        end

        [
            [nil, nil, nil],
            ["limit", 2, nil],
            ["offset", nil, 1],
        ].each do |which_param, limit, offset|
            it "lists card orders #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if limit then
                    args[:"limit"] = limit
                end

                if offset then
                    args[:"offset"] = offset
                end

                response = @cardOrderApi.get(@cardId, args)

                expect(response.data.length()).to be > 0

                if limit then
                    expect(response.data.length()).to be == limit
                end
            end
        end

        after(:all) do
            @cardApi.delete(@cardId)
        end
    end
end