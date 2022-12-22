# Address.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'api/addresses_api'
require 'models/address'
require 'models/address_editable'


RSpec.describe "AddressesApi" do

    it "can be instantiated" do
        addressApiMock = double("ApiClient")
        addressApi = AddressesApi.new(addressApiMock)

        expect(addressApi).not_to be_nil
        expect(addressApi).to be_a_kind_of(AddressesApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new

            allow(addressApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = addressApi.create(addressEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new address" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddress = Address.new

            fakeAddress.id = "adr_fakeid"
            allow(addressApi).to receive(:create) { fakeAddress }
            response = addressApi.create(addressEditable)

            expect(response).to eq(fakeAddress)
            expect(response.id).to eq(fakeAddress.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)

            allow(addressApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = addressApi.get("adr_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an address" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            fakeAddress = Address.new

            fakeAddress.id = "adr_fakeid"
            allow(addressApi).to receive(:get) { fakeAddress }
            response = addressApi.get(fakeAddress.id)

            expect(response).to eq(fakeAddress)
            expect(response.id).to eq(fakeAddress.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new

            allow(addressApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = addressApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "lists addresses" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list()

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end

        it "lists addresses with a limit parameter" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list(limit: 10)

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end

        it "lists addresses with a before parameter" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list(before: 'before')

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end

        it "lists addresses with a after parameter" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list(after: 'after')

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end

        it "lists addresses with a date created parameter" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            DATE_FILTER  = { gt: "2020-01-01", lt: "2020-01-31T12" };
            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list(date_created: DATE_FILTER)

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end

        it "lists addresses with a metadata parameter" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new
            fakeAddresses = Array.new(2) { Address.new }

            METADATA  = { fakeMetadata: "fakemetadata" }
            fakeAddresses[0].id = "adr_fakeid"
            allow(addressApi).to receive(:list) { fakeAddresses }
            response = addressApi.list(metadata: METADATA)

            expect(response.length()).to eq(2)
            expect(response).to eq(fakeAddresses)
            expect(response[0].id).to eq(fakeAddresses[0].id)
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            addressEditable = AddressEditable.new

            allow(addressApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = addressApi.delete(addressEditable)
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes an address" do
            addressApiMock = double("ApiClient")
            addressApi = AddressesApi.new(addressApiMock)
            fakeAddressDeletion = AddressDeletion.new

            fakeAddressDeletion.deleted = true
            allow(addressApi).to receive(:delete) { fakeAddressDeletion }
            response = addressApi.delete("adr_fakeId")

            expect(response).to eq(fakeAddressDeletion)
            expect(response.deleted).to eq(true)
        end
    end
  end