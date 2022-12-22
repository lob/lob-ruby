# Template.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "TemplatesApi" do
    it "can be instantiated" do
        templateApi = TemplatesApi.new()

        expect(templateApi).not_to be_nil
        expect(templateApi).to be_a_kind_of(TemplatesApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateApi = TemplatesApi.new(api)

            @templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })
        end

        it "creates a new template" do
            createdTemplate = @templateApi.create(@templateWritable)
            expect(createdTemplate.id).not_to be_nil

            # delete it in the end
            @templateApi.delete(createdTemplate.id)
        end

        it "handles errors returned by the api" do
            templateWritable = TemplateWritable.new()
            begin
                response = @templateApi.create(templateWritable)
            rescue => err
                expect(err.message.include? "html is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = OpenapiClient::Configuration.default
            config.username = "fake key"
            badapi = OpenapiClient::ApiClient.new(config)

            templateApi = TemplatesApi.new(badapi)

            begin
                response = templateApi.create(@templateWritable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            response = @templateApi.create(templateWritable)
            @templateId = response.id
        end

        it "retrieves a template" do
            response = @templateApi.get(@templateId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@templateId)
        end

        after(:all) do
            @templateApi.delete(@templateId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateApi = TemplatesApi.new(api)

            templateWritable1 = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            templateWritable2 = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            templateWritable3 = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            response1 = @templateApi.create(templateWritable1)
            response2 = @templateApi.create(templateWritable2)
            response3 = @templateApi.create(templateWritable3)

            @template1Id = response1.id
            @template2Id = response2.id
            @template3Id = response3.id
        end

        it "lists templates with limit, before, and after params" do
            response = @templateApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_tmpl_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @templateApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_tmpl_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @templateApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil

        end

        [
            [nil, nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil, nil],
            ["date_created", nil, { "gt" => "2020-01-01" }, nil],
            ["metadata", nil, nil, '{ "name": "Harry" }']
        ].each do |which_param, include_param, date_created, metadata|
            it "lists templates #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if include_param then
                    args[:"include"] = include_param
                end

                if date_created then
                    args[:"date_created"] = date_created
                end

                if metadata then
                    args[:"metadata"] = metadata
                end

                response = @templateApi.list(args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @templateApi.delete(@template1Id)
            @templateApi.delete(@template2Id)
            @templateApi.delete(@template3Id)
        end
    end

    describe "Update" do
      before(:all) do
          api = TestFixtures.api_client_with_test_key()
          @templateApi = TemplatesApi.new(api)

          templateWritable = TemplateWritable.new({
              description: "Ruby Integration Test",
              html: "<html>Updated HTML for Ruby Integration Test</html>"
          })

          response = @templateApi.create(templateWritable)
          @templateId = response.id
      end

      it "updates a template" do
        updatableTemplate = TemplateUpdate.new({
            description: "Updated template for Ruby Integration Test"
        })

        updatedTemplate = @templateApi.update(@templateId, updatableTemplate)
        expect(updatedTemplate.id).not_to be_nil
        expect(updatedTemplate.description).to eq("Updated template for Ruby Integration Test")

        # delete it in the end
        @templateApi.delete(@templateId)
      end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            response = @templateApi.create(templateWritable)
            @templateId = response.id
        end

        it "deletes a template" do
            response = @templateApi.delete(@templateId)

            expect(response.id).to eq(@templateId)
            expect(response.deleted).to eq(true)
        end
    end
end