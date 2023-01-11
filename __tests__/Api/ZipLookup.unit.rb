# ZipLookup.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "ZipLookupsApi" do

    it "can be instantiated" do
        zipLookupApiMock = double("ApiClient")
        zipLookupApi = ZipLookupsApi.new(zipLookupApiMock)

        expect(zipLookupApi).not_to be_nil
        expect(zipLookupApi).to be_a_kind_of(ZipLookupsApi)
    end

    describe "Lookup" do
        it "handles errors returned by the api" do
            zipLookupApiMock = double("ApiClient")
            zipLookupApi = ZipLookupsApi.new(zipLookupApiMock)
            zip = Zip.new

            allow(zipLookupApi).to receive(:lookup).and_raise("exception thrown in lookup test")
            begin
                response = zipLookupApi.lookup(zip)
            rescue => err
                expect(err.message).to eq("exception thrown in lookup test")
            end
        end

        it "lookup a zip code" do
            zipLookupApiMock = double("ApiClient")
            zipLookupApi = ZipLookupsApi.new(zipLookupApiMock)
            zip = Zip.new
            zip.id = "us_zip_fakeId"

            allow(zipLookupApi).to receive(:lookup) { zip }
            response = zipLookupApi.lookup("12345")

            expect(response.id).to eq("us_zip_fakeId")
        end
    end
end