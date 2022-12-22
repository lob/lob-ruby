# Letter.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "LettersApi" do
    it "can be instantiated" do
        letterApi = LettersApi.new()

        expect(letterApi).not_to be_nil
        expect(letterApi).to be_a_kind_of(LettersApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @letterApi = LettersApi.new(api)

            @addressApi = AddressesApi.new(api)
            addressEditable = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @someAddr = @addressApi.create(addressEditable)

            @letterEditable = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })
        end

        it "creates a new letter" do
            createdLetter = @letterApi.create(@letterEditable)
            expect(createdLetter.id).to be

            # delete it in the end
            @letterApi.cancel(createdLetter.id)
        end

        it "handles errors returned by the api" do
            letterEditable = LetterEditable.new()
            begin
                response = @letterApi.create(letterEditable)
            rescue => err
                expect(err.message.include? "to is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = OpenapiClient::Configuration.default
            config.username = "fake key"
            badapi = OpenapiClient::ApiClient.new(config)

            letterApi = LettersApi.new(badapi)

            begin
                response = letterApi.create(@letterEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end

        after(:all) do
            api = TestFixtures.api_client_with_test_key()
            addressApi = AddressesApi.new(api)
            addressApi.delete(@someAddr.id)
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @letterApi = LettersApi.new(api)

            @addressApi = AddressesApi.new(api)
            addressEditable = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @someAddr = @addressApi.create(addressEditable)

            letterEditable = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })

            response = @letterApi.create(letterEditable)
            @letterId = response.id
        end

        it "retrieves a letter" do
            response = @letterApi.get(@letterId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@letterId)
        end

        after(:all) do
            @addressApi.delete(@someAddr.id)
            @letterApi.cancel(@letterId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @letterApi = LettersApi.new(api)

            @addressApi = AddressesApi.new(api)
            addressEditable = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @someAddr = @addressApi.create(addressEditable)

            letterEditable1 = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })

            letterEditable2 = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })

            letterEditable3 = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })

            response1 = @letterApi.create(letterEditable1)
            response2 = @letterApi.create(letterEditable2)
            response3 = @letterApi.create(letterEditable3)

            @letter1Id = response1.id
            @letter2Id = response2.id
            @letter3Id = response3.id
        end

        it "lists letters with limit, before, and after params" do
            response = @letterApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_ltr_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @letterApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_ltr_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @letterApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil
        end

        [
            [nil, nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil, nil, nil, nil, nil, nil, nil],
            ["date_created", nil, { "gt" => "2020-01-01" }, nil, nil, nil, nil, nil, nil, nil],
            ["metadata", nil, nil, '{ "name": "Harry" }', nil, nil, nil, nil, nil, nil],
            ["color", nil, nil, nil, true, nil, nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, true, nil, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, nil, { "gt" => "2020-01-01" }, nil, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, { "date_created": "asc" }],
        ].each do |which_param, include_param, date_created, metadata, color, scheduled, send_date, mail_type, sort_by|
            it "lists letters #{which_param && ("with " + which_param + " param")}" do
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

                if color then
                    args[:"color"] = color
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

                response = @letterApi.list(args)

                expect(response.data.length()).to be > 0

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @letterApi.cancel(@letter1Id)
            @letterApi.cancel(@letter2Id)
            @letterApi.cancel(@letter3Id)

            @addressApi.delete(@someAddr.id)
        end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @letterApi = LettersApi.new(api)

            @addressApi = AddressesApi.new(api)
            addressEditable = AddressEditable.new({
                name: "Thing T. Thing",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
            })

            @someAddr = @addressApi.create(addressEditable)

            letterEditable = LetterEditable.new({
                to: @someAddr.id,
                from: @someAddr.id,
                file: TestFixtures.FILE_LOCATION_8X11,
                color: true
            })

            response = @letterApi.create(letterEditable)
            @letterId = response.id
        end

        it "deletes a letter" do
            response = @letterApi.cancel(@letterId)

            expect(response.id).to eq(@letterId)
            expect(response.deleted).to eq(true)
        end

        after(:all) do
            @addressApi.delete(@someAddr.id)
        end
    end
end