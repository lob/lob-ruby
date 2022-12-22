# UsAutocompletion.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "ReverseGeocodeLookupsApi" do
    it "can be instantiated" do
        reverseGeocodeLookupsApi = ReverseGeocodeLookupsApi.new()

        expect(reverseGeocodeLookupsApi).not_to be_nil
        expect(reverseGeocodeLookupsApi).to be_a_kind_of(ReverseGeocodeLookupsApi)
    end

    describe "Lookup" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @reverseGeocodeLookupsApi = ReverseGeocodeLookupsApi.new(api)

            @testCoordinates = Location.new({
                latitude: 37.777456,
                longitude: -122.393039,
              });
        end

        it "looks up given input" do
            response = @reverseGeocodeLookupsApi.lookup(@testCoordinates)
            expect(response.addresses.length()).to be > 0
        end
    end
end