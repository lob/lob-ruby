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

# Unit tests for Lob::CardOrdersApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CardOrdersApi' do
  before do
    # run before each test
    @api_instance = Lob::CardOrdersApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CardOrdersApi' do
    it 'should create an instance of CardOrdersApi' do
      expect(@api_instance).to be_instance_of(Lob::CardOrdersApi)
    end
  end

  # unit tests for card_order_create
  # create
  # Creates a new card order given information
  # @param card_id The ID of the card to which the card orders belong.
  # @param card_order_editable 
  # @param [Hash] opts the optional parameters
  # @return [CardOrder]
  describe 'card_order_create test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for card_orders_retrieve
  # get
  # Retrieves the card orders associated with the given card id.
  # @param card_id The ID of the card to which the card orders belong.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit How many results to return.
  # @option opts [Integer] :offset An integer that designates the offset at which to begin returning results. Defaults to 0.
  # @return [CardOrderList]
  describe 'card_orders_retrieve test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
