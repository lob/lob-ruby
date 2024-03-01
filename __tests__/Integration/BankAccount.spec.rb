# BankAccount.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))
require 'uri'

RSpec.describe "BankAccountsApi" do
    it "can be instantiated" do
        bankAccountApi = BankAccountsApi.new()

        expect(bankAccountApi).not_to be_nil
        expect(bankAccountApi).to be_a_kind_of(BankAccountsApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @bankAccountApi = BankAccountsApi.new(api)

            @bankAccountWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })
        end

        it "creates a new bank account" do
            createdBankAccount = @bankAccountApi.create(@bankAccountWritable)
            expect(createdBankAccount.id).not_to be_nil

            # delete it in the end
            @bankAccountApi.delete(createdBankAccount.id)
        end

        it "handles errors returned by the api" do
            bankAccountWritable = BankAccountWritable.new()
            begin
                response = @bankAccountApi.create(bankAccountWritable)
            rescue => err
                expect(err.message.include? "routing_number is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            bankAccountApi = BankAccountsApi.new(badapi)

            begin
                response = bankAccountApi.create(@bankAccountWritable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Verify" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @bankAccountApi = BankAccountsApi.new(api)

            bankAccountWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            response = @bankAccountApi.create(bankAccountWritable)
            @bankAccountId = response.id
        end

        it "verifies a bank account" do
            bankVerify = BankAccountVerify.new({ 'amounts': [11, 35] })
            response = @bankAccountApi.verify(@bankAccountId, bankVerify)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@bankAccountId)
        end

        it "handles errors returned by the api" do
            bankVerify = BankAccountVerify.new({ 'amounts': [11, 35] })
            begin
                response = @bankAccountApi.verify("bank_fakeId", bankVerify)
            rescue => err
                expect(err.message.include? "bank account not found").to be(true)
            end
        end

        after(:all) do
            @bankAccountApi.delete(@bankAccountId)
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @bankAccountApi = BankAccountsApi.new(api)

            bankAccountWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            response = @bankAccountApi.create(bankAccountWritable)
            @bankAccountId = response.id
        end

        it "retrieves a bank account" do
            response = @bankAccountApi.get(@bankAccountId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@bankAccountId)
        end

        after(:all) do
            @bankAccountApi.delete(@bankAccountId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @bankAccountApi = BankAccountsApi.new(api)

            bankAccountWritable1 = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankAccountWritable2 = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankAccountWritable3 = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            response1 = @bankAccountApi.create(bankAccountWritable1)
            response2 = @bankAccountApi.create(bankAccountWritable2)
            response3 = @bankAccountApi.create(bankAccountWritable3)

            @bankAccount1Id = response1.id
            @bankAccount2Id = response2.id
            @bankAccount3Id = response3.id
        end

        it "lists bank accounts with limit, before, and after params" do
            response = @bankAccountApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_bank_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @bankAccountApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_bank_id)

            uri    = URI.parse(response.previous_url)
            params = CGI.parse(uri.query)

            response = @bankAccountApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil

        end

        [
            [nil, nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil, nil],
            ["date_created", nil, { "gt" => "2020-01-01" }, nil],
            ["metadata", nil, nil, '{ "name": "Harry" }'],
        ].each do |which_param, include_param, date_created, metadata|
            skip "lists bank accounts #{which_param && ("with " + which_param + " param")}" do
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

                response = @bankAccountApi.list(args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @bankAccountApi.delete(@bankAccount1Id)
            @bankAccountApi.delete(@bankAccount2Id)
            @bankAccountApi.delete(@bankAccount3Id)
        end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @bankAccountApi = BankAccountsApi.new(api)

            bankAccountWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            response = @bankAccountApi.create(bankAccountWritable)
            @bankAccountId = response.id
        end

        it "deletes a bank account" do
            response = @bankAccountApi.delete(@bankAccountId)

            expect(response.id).to eq(@bankAccountId)
            expect(response.deleted).to eq(true)
        end
    end
end