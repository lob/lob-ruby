# ReverseGeocodeLookup.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "ReverseGeocodeLookupsApi" do

    it "can be instantiated" do
        reverseGeocodeLookupApiMock = double("ApiClient")
        reverseGeocodeLookupApi = ReverseGeocodeLookupsApi.new(reverseGeocodeLookupApiMock)

        expect(reverseGeocodeLookupApi).not_to be_nil
        expect(reverseGeocodeLookupApi).to be_a_kind_of(ReverseGeocodeLookupsApi)
    end

    describe "Lookup" do
        it "handles errors returned by the api" do
            reverseGeocodeLookupApiMock = double("ApiClient")
            reverseGeocodeLookupApi = ReverseGeocodeLookupsApi.new(reverseGeocodeLookupApiMock)
            location = Location.new

            allow(reverseGeocodeLookupApi).to receive(:lookup).and_raise("exception thrown in lookup test")
            begin
                response = reverseGeocodeLookupApi.lookup(location)
            rescue => err
                expect(err.message).to eq("exception thrown in lookup test")
            end
        end

        it "lookup an address" do
            reverseGeocodeLookupApiMock = double("ApiClient")
            reverseGeocodeLookupApi = ReverseGeocodeLookupsApi.new(reverseGeocodeLookupApiMock)
            location = Location.new
            reverseGeocode = ReverseGeocode.new
            reverseGeocode.id = "us_reverse_geocode_fakeId"

            allow(reverseGeocodeLookupApi).to receive(:lookup) { reverseGeocode }
            response = reverseGeocodeLookupApi.lookup(location, { size: 6 })

            expect(response.id).to eq("us_reverse_geocode_fakeId")
        end
    end
end