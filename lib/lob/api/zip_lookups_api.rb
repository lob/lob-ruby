=begin
#Lob

#The Lob API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and uses HTTP response codes to indicate any API errors. <p> Looking for our [previous documentation](https://lob.github.io/legacy-docs/)? 

The version of the OpenAPI document: 1.3.0
Contact: lob-openapi@lob.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

require 'cgi'

module Lob
  class ZipLookupsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # lookup
    # Returns information about a ZIP code
    # @param zip_editable [ZipEditable] 
    # @param [Hash] opts the optional parameters
    # @return [Zip]
    def lookup(zip_editable, opts = {})
      data, _status_code, _headers = zip_lookup_with_http_info(zip_editable, opts)
      data
    end

    # lookup
    # Returns information about a ZIP code
    # @param zip_editable [ZipEditable] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(Zip, Integer, Hash)>] Zip data, response status code and response headers
    def zip_lookup_with_http_info(zip_editable, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: ZipLookupsApi.zip_lookup ...'
      end
      # verify the required parameter 'zip_editable' is set
      if @api_client.config.client_side_validation && zip_editable.nil?
        fail ArgumentError, "Missing the required parameter 'zip_editable' when calling ZipLookupsApi.zip_lookup"
      end
      # resource path
      local_var_path = '/us_zip_lookups'

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])
      # HTTP header 'Content-Type'
      content_type = @api_client.select_header_content_type(['application/json', 'application/x-www-form-urlencoded', 'multipart/form-data'])
      if !content_type.nil?
          header_params['Content-Type'] = content_type
      end

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body] || @api_client.object_to_http_body(zip_editable)

      # return_type
      return_type = opts[:debug_return_type] || 'Zip'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"ZipLookupsApi.zip_lookup",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: ZipLookupsApi#zip_lookup\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end