=begin
#Lob

#The Lob API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and uses HTTP response codes to indicate any API errors. <p> Looking for our [previous documentation](https://lob.github.io/legacy-docs/)?

The version of the OpenAPI document: 1.3.0
Contact: lob-openapi@lob.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

# Common files
require 'openapi_client/api_client'
require 'openapi_client/api_error'
require 'openapi_client/version'
require 'openapi_client/configuration'

# Models
require 'lob/models/address'
require 'lob/models/address_deletion'
require 'lob/models/address_domestic'
require 'lob/models/address_domestic_expanded'
require 'lob/models/address_editable'
require 'lob/models/address_list'
require 'lob/models/bank_account'
require 'lob/models/bank_account_deletion'
require 'lob/models/bank_account_list'
require 'lob/models/bank_account_verify'
require 'lob/models/bank_account_writable'
require 'lob/models/bank_type_enum'
require 'lob/models/billing_group'
require 'lob/models/billing_group_editable'
require 'lob/models/billing_group_list'
require 'lob/models/buckslip'
require 'lob/models/buckslip_deletion'
require 'lob/models/buckslip_editable'
require 'lob/models/buckslip_order'
require 'lob/models/buckslip_order_editable'
require 'lob/models/buckslip_orders_list'
require 'lob/models/buckslip_updatable'
require 'lob/models/buckslips_list'
require 'lob/models/bulk_error'
require 'lob/models/bulk_error_properties'
require 'lob/models/campaign'
require 'lob/models/campaign_creative'
require 'lob/models/campaign_deletion'
require 'lob/models/campaign_updatable'
require 'lob/models/campaign_writable'
require 'lob/models/campaigns_list'
require 'lob/models/card'
require 'lob/models/card_deletion'
require 'lob/models/card_editable'
require 'lob/models/card_list'
require 'lob/models/card_order'
require 'lob/models/card_order_editable'
require 'lob/models/card_order_list'
require 'lob/models/card_updatable'
require 'lob/models/check'
require 'lob/models/check_deletion'
require 'lob/models/check_editable'
require 'lob/models/check_list'
require 'lob/models/chk_use_type'
require 'lob/models/cmp_schedule_type'
require 'lob/models/cmp_use_type'
require 'lob/models/country_extended'
require 'lob/models/country_extended_expanded'
require 'lob/models/creative_patch'
require 'lob/models/creative_response'
require 'lob/models/creative_writable'
require 'lob/models/custom_envelope_returned'
require 'lob/models/deliverability_analysis'
require 'lob/models/dpv_footnote'
require 'lob/models/engine_html'
require 'lob/models/event_type'
require 'lob/models/events'
require 'lob/models/export'
require 'lob/models/export_model'
require 'lob/models/geocode_addresses'
require 'lob/models/geocode_components'
require 'lob/models/http_validation_error'
require 'lob/models/identity_validation'
require 'lob/models/inline_object'
require 'lob/models/intl_autocompletions'
require 'lob/models/intl_autocompletions_writable'
require 'lob/models/intl_components'
require 'lob/models/intl_suggestions'
require 'lob/models/intl_verification'
require 'lob/models/intl_verification_or_error'
require 'lob/models/intl_verification_writable'
require 'lob/models/intl_verifications'
require 'lob/models/intl_verifications_payload'
require 'lob/models/letter'
require 'lob/models/letter_custom_envelope'
require 'lob/models/letter_deletion'
require 'lob/models/letter_details_returned'
require 'lob/models/letter_details_writable'
require 'lob/models/letter_editable'
require 'lob/models/letter_list'
require 'lob/models/lob_confidence_score'
require 'lob/models/lob_error'
require 'lob/models/location'
require 'lob/models/location_analysis'
require 'lob/models/ltr_use_type'
require 'lob/models/mail_type'
require 'lob/models/multi_line_address'
require 'lob/models/multiple_components'
require 'lob/models/multiple_components_intl'
require 'lob/models/multiple_components_list'
require 'lob/models/optional_address_column_mapping'
require 'lob/models/placeholder_model'
require 'lob/models/postcard'
require 'lob/models/postcard_deletion'
require 'lob/models/postcard_details_returned'
require 'lob/models/postcard_details_writable'
require 'lob/models/postcard_editable'
require 'lob/models/postcard_list'
require 'lob/models/postcard_size'
require 'lob/models/psc_use_type'
require 'lob/models/qr_code'
require 'lob/models/required_address_column_mapping'
require 'lob/models/return_envelope'
require 'lob/models/reverse_geocode'
require 'lob/models/self_mailer'
require 'lob/models/self_mailer_deletion'
require 'lob/models/self_mailer_editable'
require 'lob/models/self_mailer_list'
require 'lob/models/self_mailer_size'
require 'lob/models/sfm_use_type'
require 'lob/models/sort_by'
require 'lob/models/sort_by1'
require 'lob/models/sort_by2'
require 'lob/models/sort_by3'
require 'lob/models/sort_by_date_modified'
require 'lob/models/suggestions'
require 'lob/models/template'
require 'lob/models/template_deletion'
require 'lob/models/template_list'
require 'lob/models/template_update'
require 'lob/models/template_version'
require 'lob/models/template_version_deletion'
require 'lob/models/template_version_list'
require 'lob/models/template_version_updatable'
require 'lob/models/template_version_writable'
require 'lob/models/template_writable'
require 'lob/models/thumbnail'
require 'lob/models/tracking_event_certified'
require 'lob/models/tracking_event_details'
require 'lob/models/tracking_event_normal'
require 'lob/models/upload'
require 'lob/models/upload_create_export'
require 'lob/models/upload_file'
require 'lob/models/upload_state'
require 'lob/models/upload_updatable'
require 'lob/models/upload_writable'
require 'lob/models/uploads_metadata'
require 'lob/models/us_autocompletions'
require 'lob/models/us_autocompletions_writable'
require 'lob/models/us_components'
require 'lob/models/us_verification'
require 'lob/models/us_verification_or_error'
require 'lob/models/us_verifications'
require 'lob/models/us_verifications_writable'
require 'lob/models/validation_error'
require 'lob/models/zip'
require 'lob/models/zip_code_type'
require 'lob/models/zip_editable'
require 'lob/models/zip_lookup_city'

# APIs
require 'lob/api/addresses_api'
require 'lob/api/bank_accounts_api'
require 'lob/api/billing_groups_api'
require 'lob/api/buckslip_orders_api'
require 'lob/api/buckslips_api'
require 'lob/api/campaigns_api'
require 'lob/api/card_orders_api'
require 'lob/api/cards_api'
require 'lob/api/checks_api'
require 'lob/api/creatives_api'
require 'lob/api/default_api'
require 'lob/api/identity_validation_api'
require 'lob/api/intl_autocompletions_api'
require 'lob/api/intl_verifications_api'
require 'lob/api/letters_api'
require 'lob/api/postcards_api'
require 'lob/api/reverse_geocode_lookups_api'
require 'lob/api/self_mailers_api'
require 'lob/api/template_versions_api'
require 'lob/api/templates_api'
require 'lob/api/uploads_api'
require 'lob/api/us_autocompletions_api'
require 'lob/api/us_verifications_api'
require 'lob/api/zip_lookups_api'

module OpenapiClient
  class << self
    # Customize default settings for the SDK using block.
    #   OpenapiClient.configure do |config|
    #     config.username = "xxx"
    #     config.password = "xxx"
    #   end
    # If no block given, return the default Configuration object.
    def configure
      if block_given?
        yield(Configuration.default)
      else
        Configuration.default
      end
    end
  end
end
