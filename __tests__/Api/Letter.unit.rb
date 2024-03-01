# Letter.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "LettersApi" do

    it "can be instantiated" do
        letterApiMock = double("ApiClient")
        letterApi = LettersApi.new(letterApiMock)

        expect(letterApi).not_to be_nil
        expect(letterApi).to be_a_kind_of(LettersApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new

            allow(letterApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = letterApi.create(letterEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new letter" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new
            fakeLetter = Letter.new

            fakeLetter.id = "ltr_fakeId"
            allow(letterApi).to receive(:create) { fakeLetter }
            response = letterApi.create(letterEditable)

            expect(response).to eq(fakeLetter)
            expect(response.id).to eq(fakeLetter.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new

            allow(letterApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = letterApi.get("ltr_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an letter" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new
            fakeLetter = Letter.new

            fakeLetter.id = "ltr_fakeId"
            allow(letterApi).to receive(:get) { fakeLetter }
            response = letterApi.get(fakeLetter.id)

            expect(response).to eq(fakeLetter)
            expect(response.id).to eq(fakeLetter.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new

            allow(letterApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = letterApi.list()
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
            ["color", nil, nil, nil, nil, nil, nil, true, nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, nil, nil, nil, true, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, SortByDateModified.new(date_modified: "asc")],
        ].each do |which_param, limit, before, after, include_param, date_created, metadata, color, scheduled, send_date, mail_type, sort_by|
            it "lists letters #{which_param && ("with " + which_param + " param")}" do
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

                if color then
                    args["color"] = color
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

                letterApiMock = double("ApiClient")
                letterApi = LettersApi.new(letterApiMock)
                letterEditable = LetterEditable.new
                fakeLetters = Array.new(2) { Letter.new }

                fakeLetters[0].id = "ltr_fakeId"
                allow(letterApi).to receive(:list) { fakeLetters }
                response = letterApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeLetters)
                expect(response[0].id).to eq(fakeLetters[0].id)
            end
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            letterEditable = LetterEditable.new

            allow(letterApi).to receive(:cancel).and_raise("exception thrown in delete test")
            begin
                response = letterApi.cancel(letterEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a letter" do
            letterApiMock = double("ApiClient")
            letterApi = LettersApi.new(letterApiMock)
            fakeLetterDeletion = LetterDeletion.new

            fakeLetterDeletion.deleted = true
            allow(letterApi).to receive(:cancel) { fakeLetterDeletion }
            response = letterApi.cancel("ltr_fakeId")

            expect(response).to eq(fakeLetterDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end