# Postcard.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "PostcardsApi" do

    it "can be instantiated" do
        postcardApiMock = double("ApiClient")
        postcardApi = PostcardsApi.new(postcardApiMock)

        expect(postcardApi).not_to be_nil
        expect(postcardApi).to be_a_kind_of(PostcardsApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new

            allow(postcardApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = postcardApi.create(postcardEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new postcard" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new
            fakePostcard = Postcard.new

            fakePostcard.id = "psc_fakeId"
            allow(postcardApi).to receive(:create) { fakePostcard }
            response = postcardApi.create(postcardEditable)

            expect(response).to eq(fakePostcard)
            expect(response.id).to eq(fakePostcard.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new

            allow(postcardApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = postcardApi.get("psc_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an postcard" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new
            fakePostcard = Postcard.new

            fakePostcard.id = "psc_fakeId"
            allow(postcardApi).to receive(:get) { fakePostcard }
            response = postcardApi.get(fakePostcard.id)

            expect(response).to eq(fakePostcard)
            expect(response.id).to eq(fakePostcard.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new

            allow(postcardApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = postcardApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["before", nil, "before", nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["after", nil, nil, "after", nil, nil, nil, nil, nil, nil, nil, nil],
            ["include", nil, nil, nil, Array.new(1, "total_count"), nil, nil, nil, nil, nil, nil, nil],
            ["date_created", nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil, nil, nil, nil, nil],
            ["metadata", nil, nil, nil, nil, nil, { fakeMetadata: "fakemetadata" }, nil, nil, nil, nil, nil],
            ["size", nil, nil, nil, nil, nil, nil, "6x11", nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, nil, nil, nil, true, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, SortByDateModified.new(date_modified: "asc")],
        ].each do |which_param, limit, before, after, include_param, date_created, metadata, size, scheduled, send_date, mail_type, sort_by|
            it "lists postcards #{which_param && ("with " + which_param + " param")}" do
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

                if date_created then
                    args["date_created"] = date_created
                end

                if metadata then
                    args["metadata"] = metadata
                end

                if size then
                    args["size"] = size
                end

                if scheduled then
                    args["scheduled"] = scheduled
                end

                if send_date then
                    args["send_date"] = send_date
                end

                if mail_type then
                    args["mail_type"] = mail_type
                end

                if sort_by then
                    args["sort_by"] = sort_by
                end

                postcardApiMock = double("ApiClient")
                postcardApi = PostcardsApi.new(postcardApiMock)
                postcardEditable = PostcardEditable.new
                fakePostcards = Array.new(2) { Postcard.new }

                fakePostcards[0].id = "psc_fakeId"
                allow(postcardApi).to receive(:list) { fakePostcards }
                response = postcardApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakePostcards)
                expect(response[0].id).to eq(fakePostcards[0].id)
            end
        end
    end

    describe "cancel" do
        it "handles errors returned by the api" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            postcardEditable = PostcardEditable.new

            allow(postcardApi).to receive(:cancel).and_raise("exception thrown in cancel test")
            begin
                response = postcardApi.cancel(postcardEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in cancel test")
            end
        end

        it "cancels a postcard" do
            postcardApiMock = double("ApiClient")
            postcardApi = PostcardsApi.new(postcardApiMock)
            fakePostcardDeletion = PostcardDeletion.new

            allow(postcardApi).to receive(:cancel) { fakePostcardDeletion }
            response = postcardApi.cancel("psc_fakeId")

            expect(response).to eq(fakePostcardDeletion)
        end
    end
end