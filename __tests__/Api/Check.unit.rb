# Check.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "ChecksApi" do

    it "can be instantiated" do
        checkApiMock = double("ApiClient")
        checkApi = ChecksApi.new(checkApiMock)

        expect(checkApi).not_to be_nil
        expect(checkApi).to be_a_kind_of(ChecksApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkEditable = CheckEditable.new

            allow(checkApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = checkApi.create(checkEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new check" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkEditable = CheckEditable.new
            fakeCheck = Check.new

            fakeCheck.id = "chk_fakeId"
            allow(checkApi).to receive(:create) { fakeCheck }
            response = checkApi.create(checkEditable)

            expect(response).to eq(fakeCheck)
            expect(response.id).to eq(fakeCheck.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkEditable = CheckEditable.new

            allow(checkApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = checkApi.get("chk_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an check" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkEditable = CheckEditable.new
            fakeCheck = Check.new

            fakeCheck.id = "chk_fakeId"
            allow(checkApi).to receive(:get) { fakeCheck }
            response = checkApi.get(fakeCheck.id)

            expect(response).to eq(fakeCheck)
            expect(response.id).to eq(fakeCheck.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkEditable = CheckEditable.new

            allow(checkApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = checkApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["before", nil, "before", nil, nil, nil, nil, nil, nil, nil, nil],
            ["after", nil, nil, "after", nil, nil, nil, nil, nil, nil, nil],
            ["include", nil, nil, nil, Array.new(1, "total_count"), nil, nil, nil, nil, nil, nil],
            ["date_created", nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil, nil, nil, nil],
            ["metadata", nil, nil, nil, nil, nil, { fakeMetadata: "fakemetadata" }, nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, nil, nil, true, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, nil, nil, SortByDateModified.new(date_modified: "asc")],
        ].each do |which_param, limit, before, after, include_param, date_created, metadata, scheduled, send_date, mail_type, sort_by|
            it "lists checks #{which_param && ("with " + which_param + " param")}" do
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

                checkApiMock = double("ApiClient")
                checkApi = ChecksApi.new(checkApiMock)
                checkEditable = CheckEditable.new
                fakeChecks = Array.new(2) { Check.new }

                fakeChecks[0].id = "chk_fakeId"
                allow(checkApi).to receive(:list) { fakeChecks }
                response = checkApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeChecks)
                expect(response[0].id).to eq(fakeChecks[0].id)
            end
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)

            allow(checkApi).to receive(:cancel).and_raise("exception thrown in delete test")
            begin
                response = checkApi.cancel("chk_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a check" do
            checkApiMock = double("ApiClient")
            checkApi = ChecksApi.new(checkApiMock)
            checkDeletion = CheckDeletion.new

            checkDeletion.deleted = true
            allow(checkApi).to receive(:cancel) { checkDeletion }
            response = checkApi.cancel("chk_fakeId")

            expect(response).to eq(checkDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end