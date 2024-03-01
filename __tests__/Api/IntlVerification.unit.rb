# IntlVerification.unit.rb

include Lob
$:.unshift File.expand_path("../../lib/lob", File.dirname(__FILE__))

RSpec.describe "IntlVerificationsApi" do

    it "can be instantiated" do
        intlVerificationApiMock = double("ApiClient")
        intlVerificationApi = IntlVerificationsApi.new(intlVerificationApiMock)

        expect(intlVerificationApi).not_to be_nil
        expect(intlVerificationApi).to be_a_kind_of(IntlVerificationsApi)
    end

    describe "Bulk Verification" do
        it "handles errors returned by the api" do
            intlVerificationApiMock = double("ApiClient")
            intlVerificationApi = IntlVerificationsApi.new(intlVerificationApiMock)
            intlVerificationsPayload = IntlVerificationsPayload.new

            allow(intlVerificationApi).to receive(:verifyBulk).and_raise("exception thrown in verification test")
            begin
                response = intlVerificationApi.verifyBulk(intlVerificationsPayload)
            rescue => err
                expect(err.message).to eq("exception thrown in verification test")
            end
        end

        it "bulk verify addresses" do
            intlVerificationApiMock = double("ApiClient")
            intlVerificationApi = IntlVerificationsApi.new(intlVerificationApiMock)
            intlVerificationsPayload = IntlVerificationsPayload.new
            intlVerifications = IntlVerifications.new
            intlVerifications.addresses = Array.new(2, { "id": "intl_ver_fakeId", "status": "LF1"})

            allow(intlVerificationApi).to receive(:verifyBulk) { intlVerifications }
            response = intlVerificationApi.verifyBulk(intlVerificationsPayload)

            expect(response.addresses.length()).to eq(2)
        end
    end

    describe "Single Verification" do
        it "handles errors returned by the api" do
            intlVerificationApiMock = double("ApiClient")
            intlVerificationApi = IntlVerificationsApi.new(intlVerificationApiMock)
            intlVerificationWritable = IntlVerificationsPayload.new

            allow(intlVerificationApi).to receive(:verifySingle).and_raise("exception thrown in verification test")
            begin
                response = intlVerificationApi.verifySingle(intlVerificationWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in verification test")
            end
        end

        it "single verify addresses" do
            intlVerificationApiMock = double("ApiClient")
            intlVerificationApi = IntlVerificationsApi.new(intlVerificationApiMock)
            intlVerificationWritable = IntlVerificationsPayload.new
            intlVerification = IntlVerification.new
            intlVerification.status = "LF1"

            allow(intlVerificationApi).to receive(:verifySingle) { intlVerification }
            response = intlVerificationApi.verifySingle(intlVerificationWritable)

            expect(response.status).to eq("LF1")
        end
    end
end