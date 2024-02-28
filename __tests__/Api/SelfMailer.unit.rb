# SelfMailer.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "SelfMailersApi" do

    it "can be instantiated" do
        selfMailerApiMock = double("ApiClient")
        selfMailerApi = SelfMailersApi.new(selfMailerApiMock)

        expect(selfMailerApi).not_to be_nil
        expect(selfMailerApi).to be_a_kind_of(SelfMailersApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerEditable = SelfMailerEditable.new

            allow(selfMailerApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = selfMailerApi.create(selfMailerEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new self mailer" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerEditable = SelfMailerEditable.new
            fakeSelfMailer = SelfMailer.new

            fakeSelfMailer.id = "sfm_fakeId"
            allow(selfMailerApi).to receive(:create) { fakeSelfMailer }
            response = selfMailerApi.create(selfMailerEditable)

            expect(response).to eq(fakeSelfMailer)
            expect(response.id).to eq(fakeSelfMailer.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerEditable = SelfMailerEditable.new

            allow(selfMailerApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = selfMailerApi.get("sfm_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an self mailer" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerEditable = SelfMailerEditable.new
            fakeSelfMailer = SelfMailer.new

            fakeSelfMailer.id = "sfm_fakeId"
            allow(selfMailerApi).to receive(:get) { fakeSelfMailer }
            response = selfMailerApi.get(fakeSelfMailer.id)

            expect(response).to eq(fakeSelfMailer)
            expect(response.id).to eq(fakeSelfMailer.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerEditable = SelfMailerEditable.new

            allow(selfMailerApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = selfMailerApi.list()
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
            ["size", nil, nil, nil, nil, nil, nil, "11x9_bifold", nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, nil, nil, nil, true, nil, nil, nil],
            ["send_date", nil, nil,nil, nil, nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, nil, nil, nil, SortByDateModified.new(date_modified: "asc")],
        ].each do |which_param, limit, before, after, include_param, date_created, metadata, size, scheduled, send_date, mail_type, sort_by|
            it "lists selfMailers #{which_param && ("with " + which_param + " param")}" do
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

                selfMailerApiMock = double("ApiClient")
                selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
                selfMailerEditable = SelfMailerEditable.new
                fakeSelfMailers = Array.new(2) { SelfMailer.new }

                fakeSelfMailers[0].id = "sfm_fakeId"
                allow(selfMailerApi).to receive(:list) { fakeSelfMailers }
                response = selfMailerApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeSelfMailers)
                expect(response[0].id).to eq(fakeSelfMailers[0].id)
            end
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)

            allow(selfMailerApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = selfMailerApi.delete("sfm_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a self mailer" do
            selfMailerApiMock = double("ApiClient")
            selfMailerApi = SelfMailersApi.new(selfMailerApiMock)
            selfMailerDeletion = SelfMailerDeletion.new

            selfMailerDeletion.deleted = true
            allow(selfMailerApi).to receive(:delete) { selfMailerDeletion }
            response = selfMailerApi.delete("sfm_fakeId")

            expect(response).to eq(selfMailerDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end