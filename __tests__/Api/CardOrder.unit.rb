# CardOrder.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "CardOrdersApi" do

    it "can be instantiated" do
        cardOrderApiMock = double("ApiClient")
        cardOrderApi = CardOrdersApi.new(cardOrderApiMock)

        expect(cardOrderApi).not_to be_nil
        expect(cardOrderApi).to be_a_kind_of(CardOrdersApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            cardOrderApiMock = double("ApiClient")
            cardOrderApi = CardOrdersApi.new(cardOrderApiMock)
            cardOrderEditable = CardOrderEditable.new

            allow(cardOrderApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = cardOrderApi.create("card_fakeId", cardOrderEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new card order" do
            cardOrderApiMock = double("ApiClient")
            cardOrderApi = CardOrdersApi.new(cardOrderApiMock)
            cardOrderEditable = CardOrderEditable.new
            fakeCardOrder = CardOrder.new

            fakeCardOrder.id = "co_fakeId"
            allow(cardOrderApi).to receive(:create) { fakeCardOrder }
            response = cardOrderApi.create("card_fakeId", cardOrderEditable)

            expect(response).to eq(fakeCardOrder)
            expect(response.id).to eq(fakeCardOrder.id)
        end
    end

    describe "Retrieve" do
        it "handles errors returned by the api" do
            cardOrderApiMock = double("ApiClient")
            cardOrderApi = CardOrdersApi.new(cardOrderApiMock)
            cardOrderEditable = CardOrderEditable.new

            allow(cardOrderApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = cardOrderApi.get(nil)
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil],
            ["limit", 2, nil],
            ["offset", nil, 1]
        ].each do |which_param, limit, offset|
            it "lists card orders #{which_param && ("with " + which_param + " param")}" do
                args = {}
                if limit then
                    args["limit"] = limit
                end

                if offset then
                    args["offset"] = offset
                end

                cardOrderApiMock = double("ApiClient")
                cardOrderApi = CardOrdersApi.new(cardOrderApiMock)
                cardOrderEditable = CardOrderEditable.new
                fakeCardOrders = Array.new(2) { CardOrder.new }

                fakeCardOrders[0].id = "co_fakeId"
                allow(cardOrderApi).to receive(:get) { fakeCardOrders }
                response = cardOrderApi.get("card_fakeId", args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeCardOrders)
                expect(response[0].id).to eq(fakeCardOrders[0].id)
            end
        end
    end
end