# Check.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))
require 'uri'

RSpec.describe "ChecksApi" do
    it "can be instantiated" do
        checkApi = ChecksApi.new()

        expect(checkApi).not_to be_nil
        expect(checkApi).to be_a_kind_of(ChecksApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @checkApi = ChecksApi.new(api)
            bankAccountApi = BankAccountsApi.new(api)

            addr1 = AddressDomestic.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            addr2 = AddressDomestic.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000"
            })

            bankWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankVerify = BankAccountVerify.new({
                amounts: [11, 35]
            })

            bankAcc = bankAccountApi.create(bankWritable)
            bankAcc = bankAccountApi.verify(bankAcc.id, bankVerify)
            @bankAccId = bankAcc.id

            @checkEditable = CheckEditable.new({
                to: addr1,
                message: "Ruby Integration Test Check",
                bank_account: @bankAccId,
                from: addr2,
                amount: 100.0,
                use_type: 'marketing'
            })
        end

        it "creates a new check" do
            createdCheck = @checkApi.create(@checkEditable)
            expect(createdCheck.id).to be

            # delete it in the end
            @checkApi.cancel(createdCheck.id)
        end

        it "handles errors returned by the api" do
            checkEditable = CheckEditable.new()
            begin
                response = @checkApi.create(checkEditable)
            rescue => err
                expect(err.message.include? "to is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            checkApi = ChecksApi.new(badapi)

            begin
                response = checkApi.create(@checkEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end

        after(:all) do
            api = TestFixtures.api_client_with_test_key()
            bankAccountApi = BankAccountsApi.new(api)
            bankAccountApi.delete(@bankAccId)
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @checkApi = ChecksApi.new(api)

            bankAccountApi = BankAccountsApi.new(api)

            addr1 = AddressDomestic.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            addr2 = AddressDomestic.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000"
            })

            bankWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankVerify = BankAccountVerify.new({
                amounts: [11, 35]
            })

            bankAcc = bankAccountApi.create(bankWritable)
            bankAcc = bankAccountApi.verify(bankAcc.id, bankVerify)
            bankAccId = bankAcc.id

            checkEditable = CheckEditable.new({
                to: addr1,
                message: "Ruby Integration Test Check",
                bank_account: bankAccId,
                from: addr2,
                amount: 100.0
            })

            response = @checkApi.create(checkEditable)
            @checkId = response.id

            bankAccountApi.delete(bankAccId)
        end

        it "retrieves a check" do
            response = @checkApi.get(@checkId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@checkId)
        end

        after(:all) do
            @checkApi.cancel(@checkId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @checkApi = ChecksApi.new(api)

            bankAccountApi = BankAccountsApi.new(api)

            addr1 = AddressDomestic.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            addr2 = AddressDomestic.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000"
            })

            bankWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankVerify = BankAccountVerify.new({
                amounts: [11, 35]
            })

            bankAcc = bankAccountApi.create(bankWritable)
            bankAcc = bankAccountApi.verify(bankAcc.id, bankVerify)
            bankAccId = bankAcc.id

            checkEditable = CheckEditable.new({
                to: addr1,
                message: "Ruby Integration Test Check",
                bank_account: bankAccId,
                from: addr2,
                amount: 100.0
            })

            response1 = @checkApi.create(checkEditable)
            response2 = @checkApi.create(checkEditable)
            response3 = @checkApi.create(checkEditable)

            @check1Id = response1.id
            @check2Id = response2.id
            @check3Id = response3.id

            bankAccountApi.delete(bankAccId)
        end

        it "lists checks with limit, before, and after params" do
            response = @checkApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_chk_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @checkApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_chk_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @checkApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil
        end

        [
            [nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil, nil, nil, nil, nil, nil],
            ["date_created", nil, { "gt" => "2020-01-01" }, nil, nil, nil, nil, nil, nil],
            ["metadata", nil, nil, '{ "name": "Harry" }', nil, nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, true, nil, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, { "gt" => "2020-01-01" }, nil, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, { "date_created": "asc" }],
        ].each do |which_param, include_param, date_created, metadata, scheduled, send_date, mail_type, sort_by|
            it "lists checks #{which_param && ("with " + which_param + " param")}" do
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

                if scheduled then
                    args[:"scheduled"] = scheduled
                end

                if send_date then
                    args[:"send_date"] = send_date
                end

                if mail_type then
                    args[:"mail_type"] = mail_type
                end

                if sort_by then
                    args[:"sort_by"] = sort_by
                end

                response = @checkApi.list(args)

                expect(response.data.length()).to be >= 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @checkApi.cancel(@check1Id)
            @checkApi.cancel(@check2Id)
            @checkApi.cancel(@check3Id)
        end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @checkApi = ChecksApi.new(api)

            bankAccountApi = BankAccountsApi.new(api)

            addr1 = AddressDomestic.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            addr2 = AddressDomestic.new({
                name: "FESTER",
                address_line1: "001 CEMETERY LN",
                address_line2: "SUITE 666",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000"
            })

            bankWritable = BankAccountWritable.new({
                routing_number: "322271627",
                account_number: "123456789",
                signatory: "Sigourney Lobster",
                account_type: BankTypeEnum::INDIVIDUAL
            })

            bankVerify = BankAccountVerify.new({
                amounts: [11, 35]
            })

            bankAcc = bankAccountApi.create(bankWritable)
            bankAcc = bankAccountApi.verify(bankAcc.id, bankVerify)
            bankAccId = bankAcc.id

            checkEditable = CheckEditable.new({
                to: addr1,
                message: "Ruby Integration Test Check",
                bank_account: bankAccId,
                from: addr2,
                amount: 100.0
            })

            response = @checkApi.create(checkEditable)
            @checkId = response.id

            bankAccountApi.delete(bankAccId)
        end

        it "deletes a check" do
            response = @checkApi.cancel(@checkId)

            expect(response.id).to eq(@checkId)
            expect(response.deleted).to eq(true)
        end
    end
end