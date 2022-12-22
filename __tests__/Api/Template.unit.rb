# Template.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "TemplatesApi" do

    it "can be instantiated" do
        templateApiMock = double("ApiClient")
        templateApi = TemplatesApi.new(templateApiMock)

        expect(templateApi).not_to be_nil
        expect(templateApi).to be_a_kind_of(TemplatesApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateWritable = TemplateWritable.new

            allow(templateApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = templateApi.create(TemplateWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new template" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateWritable = TemplateWritable.new
            fakeTemplate = Template.new

            fakeTemplate.id = "tmpl_fakeId"
            allow(templateApi).to receive(:create) { fakeTemplate }
            response = templateApi.create(TemplateWritable)

            expect(response).to eq(fakeTemplate)
            expect(response.id).to eq(fakeTemplate.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateWritable = TemplateWritable.new

            allow(templateApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = templateApi.get("tmpl_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an template" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateWritable = TemplateWritable.new
            fakeTemplate = Template.new

            fakeTemplate.id = "tmpl_fakeId"
            allow(templateApi).to receive(:get) { fakeTemplate }
            response = templateApi.get(fakeTemplate.id)

            expect(response).to eq(fakeTemplate)
            expect(response.id).to eq(fakeTemplate.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateWritable = TemplateWritable.new

            allow(templateApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = templateApi.list()
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
            it "lists templates #{which_param && ("with " + which_param + " param")}" do
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

                templateApiMock = double("ApiClient")
                templateApi = TemplatesApi.new(templateApiMock)
                templateWritable = TemplateWritable.new
                fakeTemplates = Array.new(2) { Template.new }

                fakeTemplates[0].id = "tmpl_fakeId"
                allow(templateApi).to receive(:list) { fakeTemplates }
                response = templateApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeTemplates)
                expect(response[0].id).to eq(fakeTemplates[0].id)
            end
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)

            allow(templateApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = templateApi.delete("tmpl_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a template" do
            templateApiMock = double("ApiClient")
            templateApi = TemplatesApi.new(templateApiMock)
            templateDeletion = TemplateDeletion.new

            templateDeletion.deleted = true
            allow(templateApi).to receive(:delete) { templateDeletion }
            response = templateApi.delete("tmpl_fakeId")

            expect(response).to eq(templateDeletion)
            expect(response.deleted).to eq(true)
        end
    end
end