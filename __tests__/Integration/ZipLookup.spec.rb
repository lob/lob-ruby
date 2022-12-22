# UsAutocompletion.spec.rb
require_relative '../TestFixtures'
include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "ZipLookupsApi" do
    it "can be instantiated" do
        zipLookupsApi = ZipLookupsApi.new()

        expect(zipLookupsApi).not_to be_nil
        expect(zipLookupsApi).to be_a_kind_of(ZipLookupsApi)
    end

    describe "Lookup" do
        before(:all) do
            api = TestFixtures.api_client_with_test_key()
            @zipLookupsApi = ZipLookupsApi.new(api)

            @zipEditable = ZipEditable.new({
                zip_code: "94107"
              });
        end

        it "looks up given input" do
            response = @zipLookupsApi.lookup(@zipEditable)
            expect(response.cities.length()).to be > 0
        end
    end
end