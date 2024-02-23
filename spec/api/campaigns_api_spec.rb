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

# Unit tests for Lob::CampaignsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CampaignsApi' do
  before do
    # run before each test
    @api_instance = Lob::CampaignsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CampaignsApi' do
    it 'should create an instance of CampaignsApi' do
      expect(@api_instance).to be_instance_of(Lob::CampaignsApi)
    end
  end

  # unit tests for campaign_create
  # create
  # Creates a new campaign with the provided properties. See how to launch your first campaign [here](https://help.lob.com/best-practices/launching-your-first-campaign).
  # @param campaign_writable 
  # @param [Hash] opts the optional parameters
  # @option opts [String] :x_lang_output * &#x60;native&#x60; - Translate response to the native language of the country in the request * &#x60;match&#x60; - match the response to the language in the request  Default response is in English. 
  # @return [Campaign]
  describe 'campaign_create test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for campaign_delete
  # delete
  # Delete an existing campaign. You need only supply the unique identifier that was returned upon campaign creation. Deleting a campaign also deletes any associated mail pieces that have been created but not sent. A campaign&#39;s &#x60;send_date&#x60; matches its associated mail pieces&#39; &#x60;send_date&#x60;s.
  # @param cmp_id id of the campaign
  # @param [Hash] opts the optional parameters
  # @return [CampaignDeletion]
  describe 'campaign_delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for campaign_retrieve
  # get
  # Retrieves the details of an existing campaign. You need only supply the unique campaign identifier that was returned upon campaign creation.
  # @param cmp_id id of the campaign
  # @param [Hash] opts the optional parameters
  # @return [Campaign]
  describe 'campaign_retrieve test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for campaign_update
  # update
  # Update the details of an existing campaign. You need only supply the unique identifier that was returned upon campaign creation.
  # @param cmp_id id of the campaign
  # @param campaign_updatable 
  # @param [Hash] opts the optional parameters
  # @return [Campaign]
  describe 'campaign_update test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for campaigns_list
  # list
  # Returns a list of your campaigns. The campaigns are returned sorted by creation date, with the most recently created campaigns appearing first.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit How many results to return.
  # @option opts [Array<String>] :include Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;. 
  # @option opts [String] :before A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response. 
  # @option opts [String] :after A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response. 
  # @return [CampaignsList]
  describe 'campaigns_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
