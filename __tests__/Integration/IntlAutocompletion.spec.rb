# IntlAutocompletion.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "IntlAutocompletionsApi" do
    it "can be instantiated" do
        intlAutocompletionApi = IntlAutocompletionsApi.new()

        expect(intlAutocompletionApi).not_to be_nil
        expect(intlAutocompletionApi).to be_a_kind_of(IntlAutocompletionsApi)
    end

    describe "Autocomplete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @intlAutocompletionApi = IntlAutocompletionsApi.new(api)

            @validAddress = IntlAutocompletionsWritable.new({
                address_prefix: "370 W",
                city: "SUMMERSIDE",
                country: CountryExtended::CA
            })
        end

        it "Autocompletes intl address (with test key)" do
            autocompletedAddr = @intlAutocompletionApi.autocomplete(@validAddress)
            expect(autocompletedAddr.suggestions[0].primary_line).to eq("TEST KEYS DO NOT AUTOCOMPLETE INTL ADDRESSES")
        end

        it "handles errors returned by the api" do
            validAddress = IntlAutocompletionsWritable.new()
            begin
                response = @intlAutocompletionApi.autocomplete(validAddress)
            rescue => err
                expect(err.message.include? "address_prefix is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = OpenapiClient::Configuration.default
            config.username = "fake key"
            badapi = OpenapiClient::ApiClient.new(config)

            intlAutocompletionApi = IntlAutocompletionsApi.new(badapi)

            begin
                response = intlAutocompletionApi.autocomplete(@validAddress)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end
end