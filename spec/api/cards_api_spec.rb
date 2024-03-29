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

# Unit tests for Lob::CardsApi
# Automatically generated by openapi-generator (https://openapi-generator.tech)
# Please update as you see appropriate
describe 'CardsApi' do
  before do
    # run before each test
    @api_instance = Lob::CardsApi.new
  end

  after do
    # run after each test
  end

  describe 'test an instance of CardsApi' do
    it 'should create an instance of CardsApi' do
      expect(@api_instance).to be_instance_of(Lob::CardsApi)
    end
  end

  # unit tests for card_create
  # create
  # Creates a new card given information
  # @param card_editable 
  # @param [Hash] opts the optional parameters
  # @return [Card]
  describe 'card_create test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for card_delete
  # delete
  # Delete an existing card. You need only supply the unique identifier that was returned upon card creation.
  # @param card_id id of the card
  # @param [Hash] opts the optional parameters
  # @return [CardDeletion]
  describe 'card_delete test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for card_retrieve
  # get
  # Retrieves the details of an existing card. You need only supply the unique customer identifier that was returned upon card creation.
  # @param card_id id of the card
  # @param [Hash] opts the optional parameters
  # @return [Card]
  describe 'card_retrieve test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for card_update
  # update
  # Update the details of an existing card. You need only supply the unique identifier that was returned upon card creation.
  # @param card_id id of the card
  # @param card_updatable 
  # @param [Hash] opts the optional parameters
  # @return [Card]
  describe 'card_update test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

  # unit tests for cards_list
  # list
  # Returns a list of your cards. The cards are returned sorted by creation date, with the most recently created addresses appearing first.
  # @param [Hash] opts the optional parameters
  # @option opts [Integer] :limit How many results to return.
  # @option opts [String] :before A reference to a list entry used for paginating to the previous set of entries. This field is pre-populated in the &#x60;previous_url&#x60; field in the return response. 
  # @option opts [String] :after A reference to a list entry used for paginating to the next set of entries. This field is pre-populated in the &#x60;next_url&#x60; field in the return response. 
  # @option opts [Array<String>] :include Request that the response include the total count by specifying &#x60;include[]&#x3D;total_count&#x60;. 
  # @return [CardList]
  describe 'cards_list test' do
    it 'should work' do
      # assertion here. ref: https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers
    end
  end

end
