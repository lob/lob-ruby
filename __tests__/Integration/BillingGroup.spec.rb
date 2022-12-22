# BillingGroup.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "BillingGroupsApi" do
    it "can be instantiated" do
        billingGroupApi = BillingGroupsApi.new()

        expect(billingGroupApi).not_to be_nil
        expect(billingGroupApi).to be_a_kind_of(BillingGroupsApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @billingGroupApi = BillingGroupsApi.new(api)

            @billingGroupEditable = BillingGroupEditable.new({
                name: "Ruby Integration Test BG"
            })
        end

        it "creates a new billing group" do
            createdBillingGroup = @billingGroupApi.create(@billingGroupEditable)
            expect(createdBillingGroup.id).not_to be_nil
        end

        it "handles errors returned by the api" do
            billingGroupEditable = BillingGroupEditable.new()
            begin
                response = @billingGroupApi.create(billingGroupEditable)
            rescue => err
                expect(err.message.include? "name is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = OpenapiClient::Configuration.default
            config.username = "fake key"
            badapi = OpenapiClient::ApiClient.new(config)

            billingGroupApi = BillingGroupsApi.new(badapi)

            begin
                response = billingGroupApi.create(@billingGroupEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Update" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @billingGroupApi = BillingGroupsApi.new(api)

            billingGroupEditable = BillingGroupEditable.new({
                name: "Ruby Integration Test BG"
            })

            response = @billingGroupApi.create(billingGroupEditable)
            @billingGroupId = response.id
        end

        it "updates a billing group" do
            bgUpdatable = BillingGroupEditable.new({ name: "Updated Test Billing Group" })
            response = @billingGroupApi.update(@billingGroupId, bgUpdatable)

            expect(response.name).to eq("Updated Test Billing Group")
            expect(response.id).to eq(@billingGroupId)
        end

        it "handles errors returned by the api" do
            bgUpdatable = BillingGroupEditable.new({ name: "Updated Test Billing Group" })
            begin
                response = @billingGroupApi.update("bg_fakeId", bgUpdatable)
            rescue => err
                expect(err.message.include? "billing_group not found").to be(true)
            end
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @billingGroupApi = BillingGroupsApi.new(api)

            billingGroupEditable = BillingGroupEditable.new({
                name: "Ruby Integration Test BG"
            })

            response = @billingGroupApi.create(billingGroupEditable)
            @billingGroupId = response.id
        end

        it "retrieves a billing group" do
            response = @billingGroupApi.get(@billingGroupId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@billingGroupId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @billingGroupApi = BillingGroupsApi.new(api)
        end

        [
            [nil, nil, nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil, nil, nil],
            ["offset", nil, 1, nil, nil, nil, nil],
            ["include", nil, nil, Array.new(1, "total_count"), nil, nil, nil],
            ["date_created", nil, nil, nil, { "gt" => "2020-01-01" }, nil, nil],
            ["date_modified", nil, nil, nil, nil, { "gt" => "2020-01-01" }, nil],
            ["sort_by", nil, nil, nil, nil, nil, { "date_modified": "asc" }]
        ].each do |which_param, limit, offset, include_param, date_created, date_modified, sort_by|
            it "lists billing groups #{which_param && ("with " + which_param + " param")}" do
                args = {}

                if limit then
                    args[:"limit"] = limit
                end

                if offset then
                    args[:"offset"] = offset
                end

                if include_param then
                    args[:"include"] = include_param
                end

                if date_created then
                    args[:"date_created"] = date_created
                end

                if date_modified then
                    args[:"date_modified"] = date_modified
                end

                if sort_by then
                    args[:"sort_by"] = sort_by
                end

                response = @billingGroupApi.list(args)

                expect(response.data.length()).to be > 0

                if limit then
                    expect(response.data.length()).to be == limit
                end

                # seems to be broken
                # if include_param
                #     expect(response.total_count).to be
                # end
            end
        end
    end
end