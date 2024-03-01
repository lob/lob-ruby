# UsAutocompletion.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "UsAutocompletionsApi" do
    it "can be instantiated" do
        usAutocompletionApi = UsAutocompletionsApi.new()

        expect(usAutocompletionApi).not_to be_nil
        expect(usAutocompletionApi).to be_a_kind_of(UsAutocompletionsApi)
    end

    describe "Autocomplete" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @usAutocompletionApi = UsAutocompletionsApi.new(api)

            @validAddress = UsAutocompletionsWritable.new({
                address_prefix: "1 suggestion",
                city: "SAN FRANCISCO",
            })
        end

        it "Autocompletes US address (with test key)" do
            autocompletedAddr = @usAutocompletionApi.autocomplete(@validAddress)
            puts autocompletedAddr.suggestions[0].primary_line
            expect(autocompletedAddr.suggestions[0].primary_line).to eq("1 TELEGRAPH HILL BLVD")
        end

        it "handles errors returned by the api" do
            validAddress = UsAutocompletionsWritable.new()
            begin
                response = @usAutocompletionApi.autocomplete(validAddress)
            rescue => err
                expect(err.message.include? "address_prefix is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            usAutocompletionApi = UsAutocompletionsApi.new(badapi)

            begin
                response = usAutocompletionApi.autocomplete(@validAddress)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end
end