# SelfMailer.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))
require 'uri'

RSpec.describe "SelfMailersApi" do
    it "can be instantiated" do
        selfMailerApi = SelfMailersApi.new()

        expect(selfMailerApi).not_to be_nil
        expect(selfMailerApi).to be_a_kind_of(SelfMailersApi)
    end

    describe "Create" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @selfMailerApi = SelfMailersApi.new(api)

            addr = AddressEditable.new({
                name: "THING T. THING",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
                address_country: CountryExtended::US
            })

            @selfMailerEditable = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })
        end

        it "creates a new self mailer" do
            createdSelfMailer = @selfMailerApi.create(@selfMailerEditable)
            expect(createdSelfMailer.id).not_to be_nil

            # delete it in the end
            @selfMailerApi.delete(createdSelfMailer.id)
        end

        it "handles errors returned by the api" do
            selfMailerEditable = SelfMailerEditable.new()
            begin
                response = @selfMailerApi.create(selfMailerEditable)
            rescue => err
                expect(err.message.include? "to is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            selfMailerApi = SelfMailersApi.new(badapi)

            begin
                response = selfMailerApi.create(@selfMailerEditable)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end

    describe "Get" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @selfMailerApi = SelfMailersApi.new(api)

            addr = AddressEditable.new({
                name: "THING T. THING",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
                address_country: CountryExtended::US
            })

            selfMailerEditable = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })

            response = @selfMailerApi.create(selfMailerEditable)
            @selfMailerId = response.id
        end

        it "retrieves a self mailer" do
            response = @selfMailerApi.get(@selfMailerId)

            expect(response).not_to be_nil()
            expect(response.id).to eq(@selfMailerId)
        end

        after(:all) do
            @selfMailerApi.delete(@selfMailerId)
        end
    end

    describe "List" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @selfMailerApi = SelfMailersApi.new(api)

            addr = AddressEditable.new({
                name: "THING T. THING",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
                address_country: CountryExtended::US
            })

            selfMailerEditable1 = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })

            selfMailerEditable2 = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })

            selfMailerEditable3 = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })

            response1 = @selfMailerApi.create(selfMailerEditable1)
            response2 = @selfMailerApi.create(selfMailerEditable2)
            response3 = @selfMailerApi.create(selfMailerEditable3)

            @selfMailer1Id = response1.id
            @selfMailer2Id = response2.id
            @selfMailer3Id = response3.id
        end

        it "lists self mailers with limit, before, and after params" do
            response = @selfMailerApi.list({ :"limit" => 2 })

            expect(response.data.length()).to be == 2
            first_sfm_id = response.data[0].id

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @selfMailerApi.list({ :"limit" => 2, :"after" => params["after"][0] })

            expect(response.data[0].id).not_to eq(first_sfm_id)

            uri    = URI.parse(response.next_url)
            params = CGI.parse(uri.query)

            response = @selfMailerApi.list({ :"limit" => 2, :"before" => params["before"][0] })
            expect(response.data[0].id).not_to be_nil

        end

        [
            [nil, nil, nil, nil, nil, nil, nil, nil, nil],
            ["include", Array.new(1, "total_count"), nil, nil, nil, nil, nil, nil, nil],
            ["date_created", nil, { "gt" => "2020-01-01" }, nil, nil, nil, nil, nil, nil],
            ["metadata", nil, nil, '{ "name": "Harry" }', nil, nil, nil, nil, nil],
            ["size", nil, nil, nil, [SelfMailerSize::N6X18_BIFOLD], nil, nil, nil, nil],
            ["scheduled", nil, nil, nil, nil, true, nil, nil, nil],
            ["send_date", nil, nil, nil, nil, nil, { "gt" => "2020-01-01" }, nil, nil],
            ["mail_type", nil, nil, nil, nil, nil, nil, MailType::FIRST_CLASS, nil],
            ["sort_by", nil, nil, nil, nil, nil, nil, nil, { "date_created": "asc" }]
        ].each do |which_param, include_param, date_created, metadata, size, scheduled, send_date, mail_type, sort_by|
            it "lists self mailers #{which_param && ("with " + which_param + " param")}" do
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

                if size then
                    args[:"size"] = size
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

                response = @selfMailerApi.list(args)

                if metadata then
                    expect(response.data.length()).to be(1)
                else
                    expect(response.data.length()).to be > 0
                end

                if include_param
                    expect(response.total_count).to be
                end
            end
        end

        after(:all) do
            @selfMailerApi.delete(@selfMailer1Id)
            @selfMailerApi.delete(@selfMailer2Id)
            @selfMailerApi.delete(@selfMailer3Id)
        end
    end

    describe "Delete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @selfMailerApi = SelfMailersApi.new(api)

            addr = AddressEditable.new({
                name: "THING T. THING",
                address_line1: "1313 CEMETERY LN",
                address_city: "WESTFIELD",
                address_state: "NJ",
                address_zip: "07000",
                address_country: CountryExtended::US
            })

            selfMailerEditable = SelfMailerEditable.new({
                to: addr,
                inside: TestFixtures.FILE_LOCATION_6X18,
                outside: TestFixtures.FILE_LOCATION_6X18,
                use_type: SfmUseType::MARKETING
            })

            response = @selfMailerApi.create(selfMailerEditable)
            @selfMailerId = response.id
        end

        it "deletes a self mailer" do
            response = @selfMailerApi.delete(@selfMailerId)

            expect(response.id).to eq(@selfMailerId)
            expect(response.deleted).to eq(true)
        end
    end
end