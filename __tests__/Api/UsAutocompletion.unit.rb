# IntlAutcompletion.unit.rb

$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "UsAutocompletionsApi" do

    it "can be instantiated" do
        usAutocompletionApiMock = double("ApiClient")
        usAutocompletionApi = OpenapiClient::UsAutocompletionsApi.new(usAutocompletionApiMock)

        expect(usAutocompletionApi).not_to be_nil
        expect(usAutocompletionApi).to be_a_kind_of(OpenapiClient::UsAutocompletionsApi)
    end

    describe "Autocomplete" do
        it "handles errors returned by the api" do
            usAutocompletionApiMock = double("ApiClient")
            usAutocompletionApi = OpenapiClient::UsAutocompletionsApi.new(usAutocompletionApiMock)
            usAutocompletionsWritable = OpenapiClient::UsAutocompletionsWritable.new

            allow(usAutocompletionApi).to receive(:autocomplete).and_raise("exception thrown in autocomplete test")
            begin
                response = usAutocompletionApi.autocomplete(usAutocompletionsWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in autocomplete test")
            end
        end

        it "autocomplete an address" do
            usAutocompletionApiMock = double("ApiClient")
            usAutocompletionApi = OpenapiClient::UsAutocompletionsApi.new(usAutocompletionApiMock)
            usAutocompletionsWritable = OpenapiClient::UsAutocompletionsWritable.new
            usAutocompletions = OpenapiClient::UsAutocompletions.new
            usAutocompletions.suggestions = Array.new(1, OpenapiClient::Suggestions.new)

            allow(usAutocompletionApi).to receive(:autocomplete) { usAutocompletions }
            response = usAutocompletionApi.autocomplete(usAutocompletionsWritable)

            expect(response.suggestions.length()).to eq(1)
        end
    end
end