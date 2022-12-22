# BankAccount.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'api/bank_accounts_api'
require 'models/bank_account'
require 'models/bank_account_writable'


RSpec.describe "BankAccountsApi" do

    it "can be instantiated" do
        bankAccountApiMock = double("ApiClient")
        bankAccountApi = BankAccountsApi.new(bankAccountApiMock)

        expect(bankAccountApi).not_to be_nil
        expect(bankAccountApi).to be_a_kind_of(BankAccountsApi)
    end

    describe "Create" do
        it "handles errors returned by the api" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new

            allow(bankAccountApi).to receive(:create).and_raise("exception thrown in create test")
            begin
                response = bankAccountApi.create(bankAccountWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in create test")
            end
        end

        it "creates a new bank account" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccount = BankAccount.new

            fakeBankAccount.id = "bank_fakeId"
            allow(bankAccountApi).to receive(:create) { fakeBankAccount }
            response = bankAccountApi.create(bankAccountWritable)

            expect(response).to eq(fakeBankAccount)
            expect(response.id).to eq(fakeBankAccount.id)
        end
    end

    describe "Get" do
        it "handles errors returned by the api" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new

            allow(bankAccountApi).to receive(:get).and_raise("exception thrown in get test")
            begin
                response = bankAccountApi.get("bank_fakeId")
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "retrieves an bank account" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccount = BankAccount.new

            fakeBankAccount.id = "bank_fakeId"
            allow(bankAccountApi).to receive(:get) { fakeBankAccount }
            response = bankAccountApi.get(fakeBankAccount.id)

            expect(response).to eq(fakeBankAccount)
            expect(response.id).to eq(fakeBankAccount.id)
        end
    end

    describe "List" do
        it "handles errors returned by the api" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new

            allow(bankAccountApi).to receive(:list).and_raise("exception thrown in get test")
            begin
                response = bankAccountApi.list()
            rescue => err
                expect(err.message).to eq("exception thrown in get test")
            end
        end

        it "lists bank accounts" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list()

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end

        it "lists bank accounts with a limit parameter" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list(limit: 10)

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end

        it "lists bank accounts with a before parameter" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list(before: 'before')

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end

        it "lists bank accounts with a after parameter" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list(after: 'after')

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end

        it "lists bank accounts with a date created parameter" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            DATE_FILTER  = { gt: "2020-01-01", lt: "2020-01-31T12" };
            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list(date_created: DATE_FILTER)

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end

        it "lists bank accounts with a metadata parameter" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccounts = Array.new(2) { BankAccount.new }

            METADATA  = { fakeMetadata: "fakemetadata" }
            fakeBankAccounts[0].id = "bank_fakeId"
            allow(bankAccountApi).to receive(:list) { fakeBankAccounts }
            response = bankAccountApi.list(metadata: METADATA)

            expect(response.length()).to eq(2)
            expect(bankAccountApi.list).to eq(fakeBankAccounts)
            expect(response[0].id).to eq(fakeBankAccounts[0].id)
        end
    end

    describe "Delete" do
        it "handles errors returned by the api" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new

            allow(bankAccountApi).to receive(:delete).and_raise("exception thrown in delete test")
            begin
                response = bankAccountApi.delete(bankAccountWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in delete test")
            end
        end

        it "deletes a bank account" do
            bankAccountApiMock = double("ApiClient")
            bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
            bankAccountWritable = BankAccountWritable.new
            fakeBankAccount = BankAccount.new

            fakeBankAccount.deleted = true
            allow(bankAccountApi).to receive(:delete) { fakeBankAccount }
            response = bankAccountApi.delete(bankAccountWritable)

            expect(response).to eq(fakeBankAccount)
            expect(response.deleted).to eq(true)
        end
    end

    describe "Verify" do
      it "handles errors returned by the api" do
          bankAccountApiMock = double("ApiClient")
          bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
          bankAccountVerify = BankAccountVerify.new

          allow(bankAccountApi).to receive(:verify).and_raise("exception thrown in verification test")
          begin
              response = bankAccountApi.verify("bank_fakeId", bankAccountVerify)
          rescue => err
              expect(err.message).to eq("exception thrown in verification test")
          end
      end

      it "verifies a bank account" do
          bankAccountApiMock = double("ApiClient")
          bankAccountApi = BankAccountsApi.new(bankAccountApiMock)
          bankAccountVerify = BankAccountVerify.new
          fakeBankAccount = BankAccount.new
          fakeBankAccount.verified = true
          fakeBankAccount.id = "bank_fakeId"

          allow(bankAccountApi).to receive(:verify) { fakeBankAccount }
          response = bankAccountApi.verify(fakeBankAccount.id, bankAccountVerify)

          expect(response).to eq(fakeBankAccount)
          expect(response.id).to eq(fakeBankAccount.id)
          expect(response.verified).to eq(fakeBankAccount.verified)
      end
    end
  end