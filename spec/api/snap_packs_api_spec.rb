=begin
#Lob

#The Lob API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and uses HTTP response codes to indicate any API errors. <p> Looking for our [previous documentation](https://lob.github.io/legacy-docs/)? 

The version of the OpenAPI document: 1.3.0
Contact: lob-openapi@lob.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

require 'spec_helper'
require 'json'

# Unit tests for Lob::SnapPacksApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'SnapPacksApi' do
  before do
    # run before each test
    @api_instance = Lob::SnapPacksApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of SnapPacksApi' do
    it 'should create an instance of SnapPacksApi' do
      expect(@api_instance).to be_instance_of(Lob::SnapPacksApi)
    end
  end

  # unit tests for snap_pack_create
  # create
  # Creates a new snap_pack given information
  # @param snap_pack_editable 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :idempotency_key A string of no longer than 256 characters that uniquely identifies this resource. For more help integrating idempotency keys, refer to our [implementation guide](https://www.lob.com/guides#idempotent_request). 
  # @return [SnapPack]
  describe 'snap_pack_create test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for snap_pack_delete
  # delete
  # Completely removes a snap pack from production. This can only be done if the snap pack&#39;s &#x60;send_date&#x60; has not yet passed.
  # @param snp_id id of the snap_pack
  # @param [Hash] opts the optional parameters
  # @return [SnapPackDeletion]
  describe 'snap_pack_delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for snap_pack_retrieve
  # get
  # Retrieves the details of an existing snap_pack. You need only supply the unique snap_pack identifier that was returned upon snap_pack creation.
  # @param snp_id id of the snap_pack
  # @param [Hash] opts the optional parameters
  # @return [SnapPack]
  describe 'snap_pack_retrieve test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for snap_packs_list
  # list
  # Returns a list of your Snap Packs. The snap packs are returned sorted by creation date, with the most recently created snap packs appearing first.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit How many results to return.
  # @option opts [String] :before A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response. 
  # @option opts [String] :after A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response. 
  # @option opts [Array<String>] :include Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;. 
  # @option opts [Hash<String, Time>] :date_created Filter by date created.
  # @option opts [Hash<String, String>] :metadata Filter by metadata key-value pair&#x60;.
  # @option opts [Array<SnapPackSize>] :size The Snap Pack sizes to be returned.
  # @option opts [Boolean] :scheduled * &#x60;true&#x60; - only return orders (past or future) where &#x60;send_date&#x60; is greater than &#x60;date_created&#x60; * &#x60;false&#x60; - only return orders where &#x60;send_date&#x60; is equal to &#x60;date_created&#x60; 
  # @option opts [Hash<String, String>] :send_date Filter by date sent.
  # @option opts [MailType] :mail_type A string designating the mail postage type: * &#x60;usps_first_class&#x60; - (default) * &#x60;usps_standard&#x60; - a [cheaper option](https://lob.com/pricing/print-mail#compare) which is less predictable and takes longer to deliver. &#x60;usps_standard&#x60; cannot be used with &#x60;4x6&#x60; postcards or for any postcards sent outside of the United States. 
  # @option opts [SortBy4] :sort_by Sorts items by ascending or descending dates. Use either &#x60;date_created&#x60; or &#x60;send_date&#x60;, not both. 
  # @return [SnapPackList]
  describe 'snap_packs_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end