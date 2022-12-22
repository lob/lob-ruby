# UsVerification.unit.rb

include OpenapiClient
$:.unshift File.expand_path("../../lib/openapi_client", File.dirname(__FILE__))

RSpec.describe "UsVerificationsApi" do

    it "can be instantiated" do
        usVerificationApiMock = double("ApiClient")
        usVerificationApi = UsVerificationsApi.new(usVerificationApiMock)

        expect(usVerificationApi).not_to be_nil
        expect(usVerificationApi).to be_a_kind_of(UsVerificationsApi)
    end

    describe "Bulk Verification" do
        it "handles errors returned by the api" do
            usVerificationApiMock = double("ApiClient")
            usVerificationApi = UsVerificationsApi.new(usVerificationApiMock)
            usVerificationsWritable = UsVerificationsWritable.new

            allow(usVerificationApi).to receive(:verifyBulk).and_raise("exception thrown in verification test")
            begin
                response = usVerificationApi.verifyBulk(usVerificationsWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in verification test")
            end
        end

        it "bulk verify addresses" do
            usVerificationApiMock = double("ApiClient")
            usVerificationApi = UsVerificationsApi.new(usVerificationApiMock)
            usVerificationsWritable = UsVerificationsWritable.new
            usVerifications = UsVerifications.new
            usVerifications.addresses = Array.new(2, { "id": "intl_ver_fakeId", "status": "LF1"})

            allow(usVerificationApi).to receive(:verifyBulk) { usVerifications }
            response = usVerificationApi.verifyBulk(usVerificationsWritable)

            expect(response.addresses.length()).to eq(2)
        end
    end

    describe "Single Verification" do
        it "handles errors returned by the api" do
            usVerificationApiMock = double("ApiClient")
            usVerificationApi = UsVerificationsApi.new(usVerificationApiMock)
            usVerificationWritable = UsVerificationsWritable.new

            allow(usVerificationApi).to receive(:verifySingle).and_raise("exception thrown in verification test")
            begin
                response = usVerificationApi.verifySingle(usVerificationWritable)
            rescue => err
                expect(err.message).to eq("exception thrown in verification test")
            end
        end

        it "single verify addresses" do
            usVerificationApiMock = double("ApiClient")
            usVerificationApi = UsVerificationsApi.new(usVerificationApiMock)
            usVerificationWritable = UsVerificationsWritable.new
            usVerification = UsVerification.new
            usVerification.deliverability = "deliverable"

            allow(usVerificationApi).to receive(:verifySingle) { usVerification }
            response = usVerificationApi.verifySingle(usVerificationWritable)

            expect(response.deliverability).to eq("deliverable")
        end
    end
end