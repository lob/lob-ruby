# BillingGroup.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))
require 'api/billing_groups_api'
require 'models/billing_group'
require 'models/billing_group_editable'


RSpec.describe "BillingGroupsApi" do

    it "can be instantiated" do
        billingGroupApiMock = double("ApiClient")
        billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)

        expect(billingGroupApi).not_to be_nil
        expect(billingGroupApi).to be_a_kind_of(BillingGroupsApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupEditable = BillingGroupEditable.new

            allow(billingGroupApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = billingGroupApi.create(billingGroupEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new billing group" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupEditable = BillingGroupEditable.new
            fakeBillingGroup = BillingGroup.new

            fakeBillingGroup.id = "bg_fakeId"
            allow(billingGroupApi).to receive(:create) { fakeBillingGroup }
            response = billingGroupApi.create(billingGroupEditable)

            expect(response).to eq(fakeBillingGroup)
            expect(response.id).to eq(fakeBillingGroup.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupEditable = BillingGroupEditable.new

            allow(billingGroupApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = billingGroupApi.get("bg_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an billing group" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupEditable = BillingGroupEditable.new
            fakeBillingGroup = BillingGroup.new

            fakeBillingGroup.id = "bg_fakeId"
            allow(billingGroupApi).to receive(:get) { fakeBillingGroup }
            response = billingGroupApi.get(fakeBillingGroup.id)

            expect(response).to eq(fakeBillingGroup)
            expect(response.id).to eq(fakeBillingGroup.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupEditable = BillingGroupEditable.new

            allow(billingGroupApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = billingGroupApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        [
            [nil, nil, nil, nil, nil, nil, nil],
            ["limit", 2, nil, nil, nil, nil, nil],
            ["offset", nil, 1, nil, nil, nil, nil],
            ["include", nil, nil, Array.new(1, "total_count"), nil, nil, nil],
            ["date_created", nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil, nil],
            ["date_modified", nil, nil, nil, nil, { gt: "2020-01-01", lt: "2020-01-31T12" }, nil],
            ["sort_by", nil, nil, nil, nil, nil, SortByDateModified.new(date_modified: "asc")],
        ].each do |which_param, limit, offset, include_param, date_created, date_modified, sort_by_date_modified|
            it "lists billing groups #{which_param && ("with " + which_param + " param")}" do
                args = {}
                if limit then
                    args["limit"] = limit
                end

                if offset then
                    args["offset"] = offset
                end

                if include_param then
                    args["include"] = include_param
                end

                if date_created then
                    args["date_created"] = date_created
                end

                if date_modified then
                    args["date_modified"] = date_modified
                end

                if sort_by_date_modified then
                    args["sort_by"] = sort_by_date_modified
                end

                billingGroupApiMock = double("ApiClient")
                billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
                billingGroupEditable = BillingGroupEditable.new
                fakeBillingGroups = Array.new(2) { BillingGroup.new }

                fakeBillingGroups[0].id = "bg_fakeId"
                allow(billingGroupApi).to receive(:list) { fakeBillingGroups }
                response = billingGroupApi.list(args)

                expect(response.length()).to eq(2)
                expect(response).to eq(fakeBillingGroups)
                expect(response[0].id).to eq(fakeBillingGroups[0].id)
            end
        end
    end

    describe "Update" do
        it "handles errors returned by the api" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)

            allow(billingGroupApi).to receive(:update).and_raise("exception thrown in update test")
            begin
                response = billingGroupApi.update("bg_fakeId", nil)
            rescue => err
                expect(err.message).to eq("exception thrown in update test")
            end
        end

        it "updates an billing group" do
            billingGroupApiMock = double("ApiClient")
            billingGroupApi = BillingGroupsApi.new(billingGroupApiMock)
            billingGroupUpdatable = BillingGroupEditable.new
            fakeBillingGroup = BillingGroup.new

            fakeBillingGroup.id = "bg_fakeId"
            allow(billingGroupApi).to receive(:update) { fakeBillingGroup }
            response = billingGroupApi.update(fakeBillingGroup.id, billingGroupUpdatable)

            expect(response).to eq(fakeBillingGroup)
            expect(response.id).to eq(fakeBillingGroup.id)
        end
    end
end