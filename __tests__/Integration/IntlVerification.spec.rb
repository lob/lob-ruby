# IntlVerification.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "IntlVerificationsApi" do
    it "can be instantiated" do
        intlVerificationApi = IntlVerificationsApi.new()

        expect(intlVerificationApi).not_to be_nil
        expect(intlVerificationApi).to be_a_kind_of(IntlVerificationsApi)
    end

    describe "verifySingle" do
        before(:all) do
            api = TestFixtures.api_client_with_live_key()
            @intlVerificationApi = IntlVerificationsApi.new(api)

            @validAddress = IntlVerificationWritable.new({
                primary_line: "35 TOWER HILL",
                city: "LONDON",
                postal_code: "EC3N 4DR",
                country: CountryExtended::GB
            })

            @invalidAddress = IntlVerificationWritable.new({
                primary_line: "1 CEMETERY ST",
                city: "POTATOFIELD",
                postal_code: "EC3N 40R",
                country: CountryExtended::GB
            })

            mc1 = MultipleComponentsIntl.new({
                primary_line: "35 TOWER HILL",
                city: "LONDON",
                postal_code: "EC3N 4DR",
                country: CountryExtended::GB
            })
            mc2 = MultipleComponentsIntl.new({
                primary_line: "10 DOWNING ST",
                city: "LONDON",
                postal_code: "SW1A 2AB",
                country: CountryExtended::GB
            })
            @addressList = IntlVerificationsPayload.new({
                addresses: [mc1, mc2]
            })
        end

        it "Verifies valid addresses in bulk" do
            verifiedList = @intlVerificationApi.verifyBulk(@addressList)
            expect(verifiedList.addresses.length()).to be(2)
            expect(verifiedList.addresses[0].deliverability).to eq("deliverable")
            expect(verifiedList.addresses[1].deliverability).to eq("deliverable_missing_info")
        end

        it "Verifies single deliverable address" do
          verifiedAddr = @intlVerificationApi.verifySingle(@validAddress)
          expect(verifiedAddr.deliverability).to eq("deliverable")
        end

        it "Verifies single undeliverable address" do
          verifiedAddr = @intlVerificationApi.verifySingle(@invalidAddress)
          expect(verifiedAddr.deliverability).to eq("undeliverable")
        end

        it "handles errors returned by the api" do
            validAddress = IntlVerificationWritable.new()
            begin
                response = @intlVerificationApi.verifySingle(validAddress)
            rescue => err
                expect(err.message.include? "primary_line is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            intlVerificationApi = IntlVerificationsApi.new(badapi)

            begin
                response = intlVerificationApi.verifySingle(@validAddress)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end
end