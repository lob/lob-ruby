# IntlAutcompletion.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "IntlAutocompletionsApi" do

    it "can be instantiated" do
        intlAutocompletionApiMock = double("ApiClient")
        intlAutocompletionApi = IntlAutocompletionsApi.new(intlAutocompletionApiMock)

        expect(intlAutocompletionApi).not_to be_nil
        expect(intlAutocompletionApi).to be_a_kind_of(IntlAutocompletionsApi)
    end

    describe "Autocomplete" do
        it "handles errors returned by the api" do
            intlAutocompletionApiMock = double("ApiClient")
            intlAutocompletionApi = IntlAutocompletionsApi.new(intlAutocompletionApiMock)
            intlAutocompletionsWritable = IntlAutocompletionsWritable.new

            allow(intlAutocompletionApi).to receive(:autocomplete).and_raise("exception thrown in autocomplete test")
            begin
                response = intlAutocompletionApi.autocomplete(intlAutocompletionsWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in autocomplete test")
            end
        end

        it "autocomplete an address" do
            intlAutocompletionApiMock = double("ApiClient")
            intlAutocompletionApi = IntlAutocompletionsApi.new(intlAutocompletionApiMock)
            intlAutocompletionsWritable = IntlAutocompletionsWritable.new
            intlAutocompletions = IntlAutocompletions.new
            intlAutocompletions.suggestions = Array.new(1, IntlSuggestions.new)

            allow(intlAutocompletionApi).to receive(:autocomplete) { intlAutocompletions }
            response = intlAutocompletionApi.autocomplete(intlAutocompletionsWritable)

            expect(response.suggestions.length()).to eq(1)
        end
    end
end