# TemplateVersion.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "TemplateVersionsApi" do

    it "can be instantiated" do
        templateVersionApiMock = double("ApiClient")
        templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)

        expect(templateVersionApi).not_to be_nil
        expect(templateVersionApi).to be_a_kind_of(TemplateVersionsApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateVersionWritable = TemplateVersionWritable.new

            allow(templateVersionApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = templateVersionApi.create("tmpl_fakeId", templateVersionWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new template" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateVersionWritable = TemplateVersionWritable.new
            fakeTemplateVersion = TemplateVersion.new

            fakeTemplateVersion.id = "vrsn_fakeId"
            allow(templateVersionApi).to receive(:create) { fakeTemplateVersion }
            response = templateVersionApi.create("tmpl_fakeId", templateVersionWritable)

            expect(response).to eq(fakeTemplateVersion)
            expect(response.id).to eq(fakeTemplateVersion.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateVersionWritable = TemplateVersionWritable.new

            allow(templateVersionApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = templateVersionApi.get("tmpl_fakeId", "vrsn_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an template" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateVersionWritable = TemplateVersionWritable.new
            fakeTemplateVersion = TemplateVersion.new

            fakeTemplateVersion.id = "vrsn_fakeId"
            allow(templateVersionApi).to receive(:get) { fakeTemplateVersion }
            response = templateVersionApi.get("tmpl_fakeId", fakeTemplateVersion.id)

            expect(response).to eq(fakeTemplateVersion)
            expect(response.id).to eq(fakeTemplateVersion.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateVersionWritable = TemplateVersionWritable.new

            allow(templateVersionApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = templateVersionApi.list("tmpl_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil, nil, nil],
            ["before", nil, "before", nil, nil, nil, nil],
            ["after", nil, nil, "after", nil, nil, nil],
            ["include", nil, nil, nil, Array.new(1, "total_count"), nil, nil],
            ["date_created", nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil],
            ["metadata", nil, nil, nil, nil, nil, { fakeMetadata: "fakemetadata" }]
        ].each do |which_param, limit, before, after, include_param, date_created, metadata|
            it "lists template versions #{which_param && ("with " + which_param + " param")}" do
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

                templateVersionApiMock = double("ApiClient")
                templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
                templateVersionWritable = TemplateVersionWritable.new
                fakeTemplateVersionVersions = Array.new(2) { TemplateVersion.new }

                fakeTemplateVersionVersions[0].id = "vrsn_fakeId"
                allow(templateVersionApi).to receive(:list) { fakeTemplateVersionVersions }
                response = templateVersionApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeTemplateVersionVersions)
                expect(response[0].id).to eq(fakeTemplateVersionVersions[0].id)
            end
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)

            allow(templateVersionApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = templateVersionApi.delete("tmpl_fakeId", "vrsn_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a template" do
            templateVersionApiMock = double("ApiClient")
            templateVersionApi = TemplateVersionsApi.new(templateVersionApiMock)
            templateDeletion = TemplateVersionDeletion.new

            templateDeletion.deleted = true
            allow(templateVersionApi).to receive(:delete) { templateDeletion }
            response = templateVersionApi.delete("tmpl_fakeId", "vrsn_fakeId")

            expect(response).to eq(templateDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end