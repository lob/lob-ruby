# TemplateVersion.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "TemplateVersionsApi" do
    it "can be instantiated" do
        templateVersionApi = TemplateVersionsApi.new()

        expect(templateVersionApi).not_to be_nil
        expect(templateVersionApi).to be_a_kind_of(TemplateVersionsApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateVersionApi = TemplateVersionsApi.new(api)
            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            createdTemplate = @templateApi.create(templateWritable)
            @tmplId = createdTemplate.id

            @templateVersionWritable = TemplateVersionWritable.new({
              description: "Ruby Integration Test Template Version 1",
              html: "<html>Updated HTML for Ruby Integration Test template version 1</html>"
            })
        end

        it "creates a new template version" do
            createdTemplateVersion = @templateVersionApi.create(@tmplId, @templateVersionWritable)
            expect(createdTemplateVersion.id).not_to be_nil

            # delete it in the end
            @templateVersionApi.delete(@tmplId, createdTemplateVersion.id)
            @templateApi.delete(@tmplId)
        end

        it "handles errors returned by the api" do
            templateVersionWritable = TemplateVersionWritable.new()
            begin
                response = @templateVersionApi.create(@tmplId, templateVersionWritable)
            rescue => err
                expect(err.message.include? "html is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = OpenapiClient::Configuration.default
            config.username = "fake key"
            badapi = OpenapiClient::ApiClient.new(config)

            templateVersionApi = TemplateVersionsApi.new(badapi)

            begin
                response = templateVersionApi.create(@tmplId, @templateVersionWritable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateVersionApi = TemplateVersionsApi.new(api)

            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            createdTemplate = @templateApi.create(templateWritable)
            @tmplId = createdTemplate.id

            templateVersionWritable = TemplateVersionWritable.new({
              description: "Ruby Integration Test Template Version 1",
              html: "<html>Updated HTML for Ruby Integration Test template version 1</html>"
            })

            response = @templateVersionApi.create(@tmplId, templateVersionWritable)
            @vrsnId = response.id
        end

        it "retrieves a template version" do
            response = @templateVersionApi.get(@tmplId, @vrsnId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@vrsnId)
        end

        after(:all) do
            @templateVersionApi.delete(@tmplId, @vrsnId)
            @templateApi.delete(@tmplId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateVersionApi = TemplateVersionsApi.new(api)

            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            createdTemplate = @templateApi.create(templateWritable)
            @tmplId = createdTemplate.id

            templateVersionWritable1 = TemplateVersionWritable.new({
                description: "Ruby Integration Test Template Version 1",
                html: "<html>Updated HTML for Ruby Integration Test template version 1</html>"
            })

            templateVersionWritable2 = TemplateVersionWritable.new({
                description: "Ruby Integration Test Template Version 2",
                html: "<html>Updated HTML for Ruby Integration Test template version 2</html>"
            })

            templateVersionWritable3 = TemplateVersionWritable.new({
                description: "Ruby Integration Test Template Version 3",
                html: "<html>Updated HTML for Ruby Integration Test template version 3</html>"
            })

            response1 = @templateVersionApi.create(@tmplId, templateVersionWritable1)
            response2 = @templateVersionApi.create(@tmplId, templateVersionWritable2)
            response3 = @templateVersionApi.create(@tmplId, templateVersionWritable3)

            @vrsnId1 = response1.id
            @vrsnId2 = response2.id
            @vrsnId3 = response3.id
        end

        it "lists templates with limit, before, and after params" do
            response = @templateVersionApi.list(@tmplId, { :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_tmpl_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @templateVersionApi.list(@tmplId, { :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_tmpl_id)

            uri    = URI.parse(response.previous_url)
            params = CGI.parse(uri.query)

            response = @templateVersionApi.list(@tmplId, { :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).to eq(first_tmpl_id)

        end

        [
            [nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil],
            ["date_created", nil, { "gt" => "2020-01-01" }],
        ].each do |which_param, include_param, date_created|
            it "lists templates #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if include_param then
                    args[:"include"] = include_param
                end

                if date_created then
                    args[:"date_created"] = date_created
                end

                response = @templateVersionApi.list(@tmplId, args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @templateVersionApi.delete(@tmplId, @vrsnId1)
            @templateVersionApi.delete(@tmplId, @vrsnId2)
            @templateVersionApi.delete(@tmplId, @vrsnId3)
            @templateApi.delete(@tmplId)
        end
    end

    describe "Update" do
      before(:all) do
          api = TestFixtures.api_client_with_test_key()
          @templateVersionApi = TemplateVersionsApi.new(api)

          @templateApi = TemplatesApi.new(api)

          templateWritable = TemplateWritable.new({
              description: "Ruby Integration Test",
              html: "<html>Updated HTML for Ruby Integration Test</html>"
          })

          createdTemplate = @templateApi.create(templateWritable)
          @tmplId = createdTemplate.id

          templateVersionWritable = TemplateVersionWritable.new({
              description: "Ruby Integration Test",
              html: "<html>Updated HTML for Ruby Integration Test</html>"
          })

          response = @templateVersionApi.create(@tmplId, templateVersionWritable)
          @vrsnId = response.id
      end

      it "updates a template version" do
        updatableTemplateVersion = TemplateVersionUpdatable.new({
            description: "Updated template version for Ruby Integration Test"
        })

        updatedTemplateVersion = @templateVersionApi.update(@tmplId, @vrsnId, updatableTemplateVersion)
        expect(updatedTemplateVersion.id).not_to be_nil
        expect(updatedTemplateVersion.description).to eq("Updated template version for Ruby Integration Test")

        # delete it in the end
        @templateVersionApi.delete(@tmplId, @vrsnId)
        @templateApi.delete(@tmplId)
      end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @templateVersionApi = TemplateVersionsApi.new(api)

            @templateApi = TemplatesApi.new(api)

            templateWritable = TemplateWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            createdTemplate = @templateApi.create(templateWritable)
            @tmplId = createdTemplate.id

            templateVersionWritable = TemplateVersionWritable.new({
                description: "Ruby Integration Test",
                html: "<html>Updated HTML for Ruby Integration Test</html>"
            })

            response = @templateVersionApi.create(@tmplId, templateVersionWritable)
            @vrsnId = response.id
        end

        it "deletes a template version" do
            response = @templateVersionApi.delete(@tmplId, @vrsnId)

            expect(response.id).to eq(@vrsnId)
            expect(response.deleted).to eq(true)
        end

        after(:all) do
            api = TestFixtures.api_client_with_test_key()
            templateApi = TemplatesApi.new(api)
            templateApi.delete(@tmplId)
        end
    end
end