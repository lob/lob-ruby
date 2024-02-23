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
  class BuckslipOrdersApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # create
    # Creates a new buckslip order given information
    # @param buckslip_id [String] The ID of the buckslip to which the buckslip orders belong.
    # @param buckslip_order_editable [BuckslipOrderEditable] 
    # @param [Hash] opts the optional parameters
    # @return [BuckslipOrder]
    def create(buckslip_id, buckslip_order_editable, opts = {})
      data, _status_code, _headers = buckslip_order_create_with_http_info(buckslip_id, buckslip_order_editable, opts)
      data
    end

    # create
    # Creates a new buckslip order given information
    # @param buckslip_id [String] The ID of the buckslip to which the buckslip orders belong.
    # @param buckslip_order_editable [BuckslipOrderEditable] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(BuckslipOrder, Integer, Hash)>] BuckslipOrder data, response status code and response headers
    def buckslip_order_create_with_http_info(buckslip_id, buckslip_order_editable, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BuckslipOrdersApi.buckslip_order_create ...'
      end
      # verify the required parameter 'buckslip_id' is set
      if @api_client.config.client_side_validation && buckslip_id.nil?
        fail ArgumentError, "Missing the required parameter 'buckslip_id' when calling BuckslipOrdersApi.buckslip_order_create"
      end
      pattern = Regexp.new(/^bck_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && buckslip_id !~ pattern
        fail ArgumentError, "invalid value for 'buckslip_id' when calling BuckslipOrdersApi.buckslip_order_create, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'buckslip_order_editable' is set
      if @api_client.config.client_side_validation && buckslip_order_editable.nil?
        fail ArgumentError, "Missing the required parameter 'buckslip_order_editable' when calling BuckslipOrdersApi.buckslip_order_create"
      end
      # resource path
      local_var_path = '/buckslips/{buckslip_id}/orders'.sub('{' + 'buckslip_id' + '}', CGI.escape(buckslip_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(buckslip_order_editable)

      # return_type
      return_type = opts[:debug_return_type] || 'BuckslipOrder'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"BuckslipOrdersApi.buckslip_order_create",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BuckslipOrdersApi#buckslip_order_create\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # get
    # Retrieves the buckslip orders associated with the given buckslip id.
    # @param buckslip_id [String] The ID of the buckslip to which the buckslip orders belong.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many results to return. (default to 10)
    # @option opts [Integer] :offset An integer that designates the offset at which to begin returning results. Defaults to 0. (default to 0)
    # @return [BuckslipOrdersList]
    def get(buckslip_id, opts = {})
      data, _status_code, _headers = buckslip_orders_retrieve_with_http_info(buckslip_id, opts)
      data
    end

    # get
    # Retrieves the buckslip orders associated with the given buckslip id.
    # @param buckslip_id [String] The ID of the buckslip to which the buckslip orders belong.
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many results to return. (default to 10)
    # @option opts [Integer] :offset An integer that designates the offset at which to begin returning results. Defaults to 0. (default to 0)
    # @return [Array<(BuckslipOrdersList, Integer, Hash)>] BuckslipOrdersList data, response status code and response headers
    def buckslip_orders_retrieve_with_http_info(buckslip_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: BuckslipOrdersApi.buckslip_orders_retrieve ...'
      end
      # verify the required parameter 'buckslip_id' is set
      if @api_client.config.client_side_validation && buckslip_id.nil?
        fail ArgumentError, "Missing the required parameter 'buckslip_id' when calling BuckslipOrdersApi.buckslip_orders_retrieve"
      end
      pattern = Regexp.new(/^bck_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && buckslip_id !~ pattern
        fail ArgumentError, "invalid value for 'buckslip_id' when calling BuckslipOrdersApi.buckslip_orders_retrieve, must conform to the pattern #{pattern}."
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling BuckslipOrdersApi.buckslip_orders_retrieve, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling BuckslipOrdersApi.buckslip_orders_retrieve, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/buckslips/{buckslip_id}/orders'.sub('{' + 'buckslip_id' + '}', CGI.escape(buckslip_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'offset'] = opts[:'offset'] if !opts[:'offset'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'BuckslipOrdersList'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"BuckslipOrdersApi.buckslip_orders_retrieve",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: BuckslipOrdersApi#buckslip_orders_retrieve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
