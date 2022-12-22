# Card.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "CardsApi" do

    it "can be instantiated" do
        cardApiMock = double("ApiClient")
        cardApi = CardsApi.new(cardApiMock)

        expect(cardApi).not_to be_nil
        expect(cardApi).to be_a_kind_of(CardsApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardEditable = CardEditable.new

            allow(cardApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = cardApi.create(cardEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new card" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardEditable = CardEditable.new
            fakeCard = Card.new

            fakeCard.id = "card_fakeId"
            allow(cardApi).to receive(:create) { fakeCard }
            response = cardApi.create(cardEditable)

            expect(response).to eq(fakeCard)
            expect(response.id).to eq(fakeCard.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardEditable = CardEditable.new

            allow(cardApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = cardApi.get("card_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an card" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardEditable = CardEditable.new
            fakeCard = Card.new

            fakeCard.id = "card_fakeId"
            allow(cardApi).to receive(:get) { fakeCard }
            response = cardApi.get(fakeCard.id)

            expect(response).to eq(fakeCard)
            expect(response.id).to eq(fakeCard.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardEditable = CardEditable.new

            allow(cardApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = cardApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil],
            ["before", nil, "before", nil, nil],
            ["after", nil, nil, "after", nil],
            ["include", nil, nil, nil, Array.new(1, "total_count")]
        ].each do |which_param, limit, before, after, include_param|
            it "lists cards #{which_param && ("with " + which_param + " param")}" do
                args = {}
                if limit then
                    args["limit"] = limit
                end

                if before then
                    args["before"] = before
                end

                if after then
                    args["after"] = after
                end

                if include_param then
                    args["include"] = include_param
                end

                cardApiMock = double("ApiClient")
                cardApi = CardsApi.new(cardApiMock)
                cardEditable = CardEditable.new
                fakeCards = Array.new(2) { Card.new }

                fakeCards[0].id = "card_fakeId"
                allow(cardApi).to receive(:list) { fakeCards }
                response = cardApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeCards)
                expect(response[0].id).to eq(fakeCards[0].id)
            end
        end
    end

    describe "Update" do
        it "handles errors returned by the api" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)

            allow(cardApi).to receive(:update).and_raise("exception thrown in update test")
            begin
                response = cardApi.update("card_fakeId", nil)
            rescue => err
                expect(err.message).to eq("exception thrown in update test")
            end
        end

        it "updates an card" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardUpdatable = CardEditable.new
            fakeCard = Card.new

            fakeCard.id = "card_fakeId"
            allow(cardApi).to receive(:update) { fakeCard }
            response = cardApi.update(fakeCard.id, cardUpdatable)

            expect(response).to eq(fakeCard)
            expect(response.id).to eq(fakeCard.id)
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)

            allow(cardApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = cardApi.delete("card_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a card" do
            cardApiMock = double("ApiClient")
            cardApi = CardsApi.new(cardApiMock)
            cardDeletion = CardDeletion.new

            cardDeletion.deleted = true
            allow(cardApi).to receive(:delete) { cardDeletion }
            response = cardApi.delete("card_fakeId")

            expect(response).to eq(cardDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end