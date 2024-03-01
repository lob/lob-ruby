# UsVerification.spec.rb
require_relative '../TestFixtures'
include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "UsVerificationsApi" do
    it "can be instantiated" do
        usVerificationApi = UsVerificationsApi.new()

        expect(usVerificationApi).not_to be_nil
        expect(usVerificationApi).to be_a_kind_of(UsVerificationsApi)
    end

    describe "verifySingle" do
        before(:all) do
            api = TestFixtures.api_client_with_live_key()
            @usVerificationApi = UsVerificationsApi.new(api)

            @validAddress = UsVerificationsWritable.new({
                primary_line: "2261 MARKET ST",
                city: "SAN FRANCISCO",
                state: "CA",
                zip_code: "94114"
            })
            @invalidAddress = UsVerificationsWritable.new({
                primary_line: "1 CEMETERY ST",
                city: "POTATOFIELD",
                state: "NJ",
                zip_code: "07000"
            })
            mc1 = MultipleComponents.new({
                primary_line: "2261 MARKET Street",
                city: "SAN FRANCISCO",
                state: "CA",
                zip_code: "94114"
            })
            mc2 = MultipleComponents.new({
                primary_line: "001 CEMETERY LN",
                secondary_line: "SUITE 666",
                city: "WESTFIELD",
                state: "NJ",
                zip_code: "07000"
            })
            mcError = MultipleComponents.new({
            })
            @addressList = MultipleComponentsList.new({
                addresses: [mc1, mc2]
            })

            @errorAddressList = MultipleComponentsList.new({
                addresses: [mc1, mcError]
            })
        end

        it "Verifies valid addresses in bulk" do
            verifiedList = @usVerificationApi.verifyBulk(@addressList)
            expect(verifiedList.addresses.length()).to be(2)
            expect(verifiedList.addresses[0].deliverability).to eq("deliverable")
            expect(verifiedList.addresses[1].deliverability).to eq("undeliverable")
        end

        it "Handles errors while verifying addresses in bulk" do
          verifiedList = @usVerificationApi.verifyBulk(@errorAddressList)
          expect(verifiedList.addresses.length()).to be(2)
          expect(verifiedList.addresses[1].error).not_to be_nil
          expect(verifiedList.errors).to be(true)
        end

        it "Verifies single deliverable address" do
          verifiedAddr = @usVerificationApi.verifySingle(@validAddress)
          expect(verifiedAddr.deliverability).to eq("deliverable")
        end

        it "Verifies single undeliverable address" do
          verifiedAddr = @usVerificationApi.verifySingle(@invalidAddress)
          expect(verifiedAddr.deliverability).to eq("undeliverable")
        end

        it "handles errors returned by the api" do
            invalidAddress = UsVerificationsWritable.new()
            begin
                response = @usVerificationApi.verifySingle(invalidAddress)
            rescue => err
                expect(err.message.include? "primary_line is required").to be(true)
            end
        end

        it "does not allow creation with invalid key" do
            config = Lob::Configuration.default
            config.username = "fake key"
            badapi = Lob::ApiClient.new(config)

            usVerificationApi = UsVerificationsApi.new(badapi)

            begin
                response = usVerificationApi.verifySingle(@validAddress)
            rescue => err
                expect(err.message.include? "Your API key is not valid.").to be(true)
            end
        end
    end
end