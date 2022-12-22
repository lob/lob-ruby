module OpenapiClient
    class TestFixtures

        def self.api_client_with_test_key()
            config = OpenapiClient::Configuration.default
            config.username = ENV["LOB_API_TEST_KEY"]
            apiClient = OpenapiClient::ApiClient.new(config)
            return apiClient
        end

        def self.api_client_with_live_key()
            config = OpenapiClient::Configuration.default
            config.username = ENV["LOB_API_LIVE_KEY"]
            apiClient = OpenapiClient::ApiClient.new(config)
            return apiClient
        end

        def self.FILE_LOCATION()
            return "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf"
        end

        def self.FILE_LOCATION_4x6()
            return "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/templates/4x6_pc_template.pdf";
        end

        def self.FILE_LOCATION_6X18()
            return "https://s3.us-west-2.amazonaws.com/public.lob.com/assets/templates/self_mailers/6x18_sfm_inside.pdf"
        end

        def self.FILE_LOCATION_8X11()
            return "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/us_letter_1pg.pdf"
        end


    end
end
