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
  class TemplateVersionsApi
    attr_accessor :api_client

    def initialize(api_client = ApiClient.default)
      @api_client = api_client
    end
    # create
    # Creates a new template version attached to the specified template.
    # @param tmpl_id [String] The ID of the template the new version will be attached to
    # @param template_version_writable [TemplateVersionWritable] 
    # @param [Hash] opts the optional parameters
    # @return [TemplateVersion]
    def create(tmpl_id, template_version_writable, opts = {})
      data, _status_code, _headers = create_template_version_with_http_info(tmpl_id, template_version_writable, opts)
      data
    end

    # create
    # Creates a new template version attached to the specified template.
    # @param tmpl_id [String] The ID of the template the new version will be attached to
    # @param template_version_writable [TemplateVersionWritable] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateVersion, Integer, Hash)>] TemplateVersion data, response status code and response headers
    def create_template_version_with_http_info(tmpl_id, template_version_writable, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TemplateVersionsApi.create_template_version ...'
      end
      # verify the required parameter 'tmpl_id' is set
      if @api_client.config.client_side_validation && tmpl_id.nil?
        fail ArgumentError, "Missing the required parameter 'tmpl_id' when calling TemplateVersionsApi.create_template_version"
      end
      pattern = Regexp.new(/^tmpl_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && tmpl_id !~ pattern
        fail ArgumentError, "invalid value for 'tmpl_id' when calling TemplateVersionsApi.create_template_version, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'template_version_writable' is set
      if @api_client.config.client_side_validation && template_version_writable.nil?
        fail ArgumentError, "Missing the required parameter 'template_version_writable' when calling TemplateVersionsApi.create_template_version"
      end
      # resource path
      local_var_path = '/templates/{tmpl_id}/versions'.sub('{' + 'tmpl_id' + '}', CGI.escape(tmpl_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(template_version_writable)

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateVersion'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"TemplateVersionsApi.create_template_version",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TemplateVersionsApi#create_template_version\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # delete
    # Permanently deletes a template version. A template's `published_version` can not be deleted.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param [Hash] opts the optional parameters
    # @return [TemplateVersionDeletion]
    def delete(tmpl_id, vrsn_id, opts = {})
      data, _status_code, _headers = template_version_delete_with_http_info(tmpl_id, vrsn_id, opts)
      data
    end

    # delete
    # Permanently deletes a template version. A template&#39;s &#x60;published_version&#x60; can not be deleted.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateVersionDeletion, Integer, Hash)>] TemplateVersionDeletion data, response status code and response headers
    def template_version_delete_with_http_info(tmpl_id, vrsn_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TemplateVersionsApi.template_version_delete ...'
      end
      # verify the required parameter 'tmpl_id' is set
      if @api_client.config.client_side_validation && tmpl_id.nil?
        fail ArgumentError, "Missing the required parameter 'tmpl_id' when calling TemplateVersionsApi.template_version_delete"
      end
      pattern = Regexp.new(/^tmpl_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && tmpl_id !~ pattern
        fail ArgumentError, "invalid value for 'tmpl_id' when calling TemplateVersionsApi.template_version_delete, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'vrsn_id' is set
      if @api_client.config.client_side_validation && vrsn_id.nil?
        fail ArgumentError, "Missing the required parameter 'vrsn_id' when calling TemplateVersionsApi.template_version_delete"
      end
      pattern = Regexp.new(/^vrsn_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && vrsn_id !~ pattern
        fail ArgumentError, "invalid value for 'vrsn_id' when calling TemplateVersionsApi.template_version_delete, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/templates/{tmpl_id}/versions/{vrsn_id}'.sub('{' + 'tmpl_id' + '}', CGI.escape(tmpl_id.to_s)).sub('{' + 'vrsn_id' + '}', CGI.escape(vrsn_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateVersionDeletion'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"TemplateVersionsApi.template_version_delete",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:DELETE, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TemplateVersionsApi#template_version_delete\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # get
    # Retrieves the template version with the given template and version ids.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param [Hash] opts the optional parameters
    # @return [TemplateVersion]
    def get(tmpl_id, vrsn_id, opts = {})
      data, _status_code, _headers = template_version_retrieve_with_http_info(tmpl_id, vrsn_id, opts)
      data
    end

    # get
    # Retrieves the template version with the given template and version ids.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateVersion, Integer, Hash)>] TemplateVersion data, response status code and response headers
    def template_version_retrieve_with_http_info(tmpl_id, vrsn_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TemplateVersionsApi.template_version_retrieve ...'
      end
      # verify the required parameter 'tmpl_id' is set
      if @api_client.config.client_side_validation && tmpl_id.nil?
        fail ArgumentError, "Missing the required parameter 'tmpl_id' when calling TemplateVersionsApi.template_version_retrieve"
      end
      pattern = Regexp.new(/^tmpl_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && tmpl_id !~ pattern
        fail ArgumentError, "invalid value for 'tmpl_id' when calling TemplateVersionsApi.template_version_retrieve, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'vrsn_id' is set
      if @api_client.config.client_side_validation && vrsn_id.nil?
        fail ArgumentError, "Missing the required parameter 'vrsn_id' when calling TemplateVersionsApi.template_version_retrieve"
      end
      pattern = Regexp.new(/^vrsn_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && vrsn_id !~ pattern
        fail ArgumentError, "invalid value for 'vrsn_id' when calling TemplateVersionsApi.template_version_retrieve, must conform to the pattern #{pattern}."
      end

      # resource path
      local_var_path = '/templates/{tmpl_id}/versions/{vrsn_id}'.sub('{' + 'tmpl_id' + '}', CGI.escape(tmpl_id.to_s)).sub('{' + 'vrsn_id' + '}', CGI.escape(vrsn_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateVersion'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"TemplateVersionsApi.template_version_retrieve",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TemplateVersionsApi#template_version_retrieve\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # update
    # Updates the template version with the given template and version ids.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param template_version_updatable [TemplateVersionUpdatable] 
    # @param [Hash] opts the optional parameters
    # @return [TemplateVersion]
    def update(tmpl_id, vrsn_id, template_version_updatable, opts = {})
      data, _status_code, _headers = template_version_update_with_http_info(tmpl_id, vrsn_id, template_version_updatable, opts)
      data
    end

    # update
    # Updates the template version with the given template and version ids.
    # @param tmpl_id [String] The ID of the template to which the version belongs.
    # @param vrsn_id [String] id of the template_version
    # @param template_version_updatable [TemplateVersionUpdatable] 
    # @param [Hash] opts the optional parameters
    # @return [Array<(TemplateVersion, Integer, Hash)>] TemplateVersion data, response status code and response headers
    def template_version_update_with_http_info(tmpl_id, vrsn_id, template_version_updatable, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TemplateVersionsApi.template_version_update ...'
      end
      # verify the required parameter 'tmpl_id' is set
      if @api_client.config.client_side_validation && tmpl_id.nil?
        fail ArgumentError, "Missing the required parameter 'tmpl_id' when calling TemplateVersionsApi.template_version_update"
      end
      pattern = Regexp.new(/^tmpl_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && tmpl_id !~ pattern
        fail ArgumentError, "invalid value for 'tmpl_id' when calling TemplateVersionsApi.template_version_update, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'vrsn_id' is set
      if @api_client.config.client_side_validation && vrsn_id.nil?
        fail ArgumentError, "Missing the required parameter 'vrsn_id' when calling TemplateVersionsApi.template_version_update"
      end
      pattern = Regexp.new(/^vrsn_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && vrsn_id !~ pattern
        fail ArgumentError, "invalid value for 'vrsn_id' when calling TemplateVersionsApi.template_version_update, must conform to the pattern #{pattern}."
      end

      # verify the required parameter 'template_version_updatable' is set
      if @api_client.config.client_side_validation && template_version_updatable.nil?
        fail ArgumentError, "Missing the required parameter 'template_version_updatable' when calling TemplateVersionsApi.template_version_update"
      end
      # resource path
      local_var_path = '/templates/{tmpl_id}/versions/{vrsn_id}'.sub('{' + 'tmpl_id' + '}', CGI.escape(tmpl_id.to_s)).sub('{' + 'vrsn_id' + '}', CGI.escape(vrsn_id.to_s))

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
      post_body = opts[:debug_body] || @api_client.object_to_http_body(template_version_updatable)

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateVersion'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"TemplateVersionsApi.template_version_update",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:POST, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TemplateVersionsApi#template_version_update\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end

    # list
    # Returns a list of template versions for the given template ID. The template versions are sorted by creation date, with the most recently created appearing first. 
    # @param tmpl_id [String] The ID of the template associated with the retrieved versions
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many results to return. (default to 10)
    # @option opts [String] :before A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response. 
    # @option opts [String] :after A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response. 
    # @option opts [Array<String>] :include Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;. 
    # @option opts [Hash<String, Time>] :date_created Filter by date created.
    # @return [TemplateVersionList]
    def list(tmpl_id, opts = {})
      data, _status_code, _headers = template_versions_list_with_http_info(tmpl_id, opts)
      data
    end

    # list
    # Returns a list of template versions for the given template ID. The template versions are sorted by creation date, with the most recently created appearing first. 
    # @param tmpl_id [String] The ID of the template associated with the retrieved versions
    # @param [Hash] opts the optional parameters
    # @option opts [Integer] :limit How many results to return. (default to 10)
    # @option opts [String] :before A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response. 
    # @option opts [String] :after A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response. 
    # @option opts [Array<String>] :include Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;. 
    # @option opts [Hash<String, Time>] :date_created Filter by date created.
    # @return [Array<(TemplateVersionList, Integer, Hash)>] TemplateVersionList data, response status code and response headers
    def template_versions_list_with_http_info(tmpl_id, opts = {})
      if @api_client.config.debugging
        @api_client.config.logger.debug 'Calling API: TemplateVersionsApi.template_versions_list ...'
      end
      # verify the required parameter 'tmpl_id' is set
      if @api_client.config.client_side_validation && tmpl_id.nil?
        fail ArgumentError, "Missing the required parameter 'tmpl_id' when calling TemplateVersionsApi.template_versions_list"
      end
      pattern = Regexp.new(/^tmpl_[a-zA-Z0-9]+$/)
      if @api_client.config.client_side_validation && tmpl_id !~ pattern
        fail ArgumentError, "invalid value for 'tmpl_id' when calling TemplateVersionsApi.template_versions_list, must conform to the pattern #{pattern}."
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] > 100
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling TemplateVersionsApi.template_versions_list, must be smaller than or equal to 100.'
      end

      if @api_client.config.client_side_validation && !opts[:'limit'].nil? && opts[:'limit'] < 1
        fail ArgumentError, 'invalid value for "opts[:"limit"]" when calling TemplateVersionsApi.template_versions_list, must be greater than or equal to 1.'
      end

      # resource path
      local_var_path = '/templates/{tmpl_id}/versions'.sub('{' + 'tmpl_id' + '}', CGI.escape(tmpl_id.to_s))

      # query parameters
      query_params = opts[:query_params] || {}
      query_params[:'limit'] = opts[:'limit'] if !opts[:'limit'].nil?
      query_params[:'before'] = opts[:'before'] if !opts[:'before'].nil?
      query_params[:'after'] = opts[:'after'] if !opts[:'after'].nil?
      query_params[:'include'] = @api_client.build_collection_param(opts[:'include'], :multi) if !opts[:'include'].nil?
      query_params[:'date_created'] = opts[:'date_created'] if !opts[:'date_created'].nil?

      # header parameters
      header_params = opts[:header_params] || {}
      # HTTP header 'Accept' (if needed)
      header_params['Accept'] = @api_client.select_header_accept(['application/json'])

      # form parameters
      form_params = opts[:form_params] || {}

      # http body (model)
      post_body = opts[:debug_body]

      # return_type
      return_type = opts[:debug_return_type] || 'TemplateVersionList'

      # auth_names
      auth_names = opts[:debug_auth_names] || ['basicAuth']

      new_options = opts.merge(
        :operation => :"TemplateVersionsApi.template_versions_list",
        :header_params => header_params,
        :query_params => query_params,
        :form_params => form_params,
        :body => post_body,
        :auth_names => auth_names,
        :return_type => return_type
      )

      data, status_code, headers = @api_client.call_api(:GET, local_var_path, new_options)
      if @api_client.config.debugging
        @api_client.config.logger.debug "API called: TemplateVersionsApi#template_versions_list\nData: #{data.inspect}\nStatus code: #{status_code}\nHeaders: #{headers}"
      end
      return data, status_code, headers
    end
  end
end
