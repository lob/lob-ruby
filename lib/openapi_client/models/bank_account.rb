=begin
#Lob

#The Lob API is organized around REST. Our API is designed to have predictable, resource-oriented URLs and uses HTTP response codes to indicate any API errors. <p> Looking for our [previous documentation](https://lob.github.io/legacy-docs/)? 

The version of the OpenAPI document: 1.3.0
Contact: lob-openapi@lob.com
Generated by: https://openapi-generator.tech
OpenAPI Generator version: 5.2.1

=end

require 'date'
require 'time'

module Lob
  class BankAccount
    # An internal description that identifies this resource. Must be no longer than 255 characters. 
    attr_accessor :description

    # Must be a [valid US routing number](https://www.frbservices.org/index.html).
    attr_accessor :routing_number

    attr_accessor :account_number

    # The type of entity that holds the account.
    attr_accessor :account_type

    # The signatory associated with your account. This name will be printed on checks created with this bank account. If you prefer to use a custom signature image on your checks instead, please create your bank account from the [Dashboard](https://dashboard.lob.com/#/login).
    attr_accessor :signatory

    # Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters `\"` and `\\`. i.e. '{\"customer_id\" : \"NEWYORK2015\"}' Nested objects are not supported.  See [Metadata](#section/Metadata) for more information.
    attr_accessor :metadata

    # Unique identifier prefixed with `bank_`.
    attr_accessor :id

    # A signed link to the signature image. will be generated.
    attr_accessor :signature_url

    # The name of the bank based on the provided routing number, e.g. `JPMORGAN CHASE BANK`.
    attr_accessor :bank_name

    # A bank account must be verified before a check can be created.
    attr_accessor :verified

    # A timestamp in ISO 8601 format of the date the resource was created.
    attr_accessor :date_created

    # A timestamp in ISO 8601 format of the date the resource was last modified.
    attr_accessor :date_modified

    # Only returned if the resource has been successfully deleted.
    attr_accessor :deleted

    attr_accessor :object

    class EnumAttributeValidator
      attr_reader :datatype
      attr_reader :allowable_values

      def initialize(datatype, allowable_values)
        @allowable_values = allowable_values.map do |value|
          case datatype.to_s
          when /Integer/i
            value.to_i
          when /Float/i
            value.to_f
          else
            value
          end
        end
      end

      def valid?(value)
        !value || allowable_values.include?(value)
      end
    end

    # Attribute mapping from ruby-style variable name to JSON key.
    def self.attribute_map
      {
        :'description' => :'description',
        :'routing_number' => :'routing_number',
        :'account_number' => :'account_number',
        :'account_type' => :'account_type',
        :'signatory' => :'signatory',
        :'metadata' => :'metadata',
        :'id' => :'id',
        :'signature_url' => :'signature_url',
        :'bank_name' => :'bank_name',
        :'verified' => :'verified',
        :'date_created' => :'date_created',
        :'date_modified' => :'date_modified',
        :'deleted' => :'deleted',
        :'object' => :'object'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'description' => :'String',
        :'routing_number' => :'String',
        :'account_number' => :'String',
        :'account_type' => :'String',
        :'signatory' => :'String',
        :'metadata' => :'Hash<String, String>',
        :'id' => :'String',
        :'signature_url' => :'String',
        :'bank_name' => :'String',
        :'verified' => :'Boolean',
        :'date_created' => :'Time',
        :'date_modified' => :'Time',
        :'deleted' => :'Boolean',
        :'object' => :'String'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'description',
        :'signature_url',
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Lob::BankAccount` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Lob::BankAccount`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'routing_number')
        self.routing_number = attributes[:'routing_number']
      end

      if attributes.key?(:'account_number')
        self.account_number = attributes[:'account_number']
      end

      if attributes.key?(:'account_type')
        self.account_type = attributes[:'account_type']
      end

      if attributes.key?(:'signatory')
        self.signatory = attributes[:'signatory']
      end

      if attributes.key?(:'metadata')
        if (value = attributes[:'metadata']).is_a?(Hash)
          self.metadata = value
        end
      end

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'signature_url')
        self.signature_url = attributes[:'signature_url']
      end

      if attributes.key?(:'bank_name')
        self.bank_name = attributes[:'bank_name']
      end

      if attributes.key?(:'verified')
        self.verified = attributes[:'verified']
      else
        self.verified = false
      end

      if attributes.key?(:'date_created')
        self.date_created = attributes[:'date_created']
      end

      if attributes.key?(:'date_modified')
        self.date_modified = attributes[:'date_modified']
      end

      if attributes.key?(:'deleted')
        self.deleted = attributes[:'deleted']
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'bank_account'
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      if !@description.nil? && @description.to_s.length > 255
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 255.')
      end

      if @routing_number.nil?
        invalid_properties.push('invalid value for "routing_number", routing_number cannot be nil.')
      end

      if @routing_number.to_s.length > 9
        invalid_properties.push('invalid value for "routing_number", the character length must be smaller than or equal to 9.')
      end

      if @routing_number.to_s.length < 9
        invalid_properties.push('invalid value for "routing_number", the character length must be great than or equal to 9.')
      end

      if @account_number.nil?
        invalid_properties.push('invalid value for "account_number", account_number cannot be nil.')
      end

      if @account_number.to_s.length > 17
        invalid_properties.push('invalid value for "account_number", the character length must be smaller than or equal to 17.')
      end

      if @account_type.nil?
        invalid_properties.push('invalid value for "account_type", account_type cannot be nil.')
      end

      if @signatory.nil?
        invalid_properties.push('invalid value for "signatory", signatory cannot be nil.')
      end

      if @signatory.to_s.length > 30
        invalid_properties.push('invalid value for "signatory", the character length must be smaller than or equal to 30.')
      end

      if @id.nil?
        invalid_properties.push('invalid value for "id", id cannot be nil.')
      end

      pattern = Regexp.new(/^bank_[a-zA-Z0-9]+$/)
      if @id !~ pattern
        invalid_properties.push("invalid value for \"id\", must conform to the pattern #{pattern}.")
      end

      pattern = Regexp.new(/^https:\/\/lob-assets.com\/(letters|postcards|bank-accounts|checks|self-mailers|cards)\/[a-z]{3,4}_[a-z0-9]{15,16}(''|_signature)(.pdf|_thumb_[a-z]+_[0-9]+.png|.png)\?(version=[a-z0-9]*&)expires=[0-9]{10}&signature=[a-zA-Z0-9-_]+/)
      if !@signature_url.nil? && @signature_url !~ pattern
        invalid_properties.push("invalid value for \"signature_url\", must conform to the pattern #{pattern}.")
      end

      if @date_created.nil?
        invalid_properties.push('invalid value for "date_created", date_created cannot be nil.')
      end

      if @date_modified.nil?
        invalid_properties.push('invalid value for "date_modified", date_modified cannot be nil.')
      end

      if @object.nil?
        invalid_properties.push('invalid value for "object", object cannot be nil.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@description.nil? && @description.to_s.length > 255
      return false if @routing_number.nil?
      return false if @routing_number.to_s.length > 9
      return false if @routing_number.to_s.length < 9
      return false if @account_number.nil?
      return false if @account_number.to_s.length > 17
      return false if @account_type.nil?
      account_type_validator = EnumAttributeValidator.new('String', ["company", "individual"])
      return false unless account_type_validator.valid?(@account_type)
      return false if @signatory.nil?
      return false if @signatory.to_s.length > 30
      return false if @id.nil?
      return false if @id !~ Regexp.new(/^bank_[a-zA-Z0-9]+$/)
      return false if !@signature_url.nil? && @signature_url !~ Regexp.new(/^https:\/\/lob-assets.com\/(letters|postcards|bank-accounts|checks|self-mailers|cards)\/[a-z]{3,4}_[a-z0-9]{15,16}(''|_signature)(.pdf|_thumb_[a-z]+_[0-9]+.png|.png)\?(version=[a-z0-9]*&)expires=[0-9]{10}&signature=[a-zA-Z0-9-_]+/)
      return false if @date_created.nil?
      return false if @date_modified.nil?
      return false if @object.nil?
      object_validator = EnumAttributeValidator.new('String', ["bank_account"])
      return false unless object_validator.valid?(@object)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] description Value to be assigned
    def description=(description)
      if !description.nil? && description.to_s.length > 255
        fail ArgumentError, 'invalid value for "description", the character length must be smaller than or equal to 255.'
      end

      @description = description
    end

    # Custom attribute writer method with validation
    # @param [Object] routing_number Value to be assigned
    def routing_number=(routing_number)
      if routing_number.nil?
        fail ArgumentError, 'routing_number cannot be nil'
      end

      if routing_number.to_s.length > 9
        fail ArgumentError, 'invalid value for "routing_number", the character length must be smaller than or equal to 9.'
      end

      if routing_number.to_s.length < 9
        fail ArgumentError, 'invalid value for "routing_number", the character length must be great than or equal to 9.'
      end

      @routing_number = routing_number
    end

    # Custom attribute writer method with validation
    # @param [Object] account_number Value to be assigned
    def account_number=(account_number)
      if account_number.nil?
        fail ArgumentError, 'account_number cannot be nil'
      end

      if account_number.to_s.length > 17
        fail ArgumentError, 'invalid value for "account_number", the character length must be smaller than or equal to 17.'
      end

      @account_number = account_number
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] account_type Object to be assigned
    def account_type=(account_type)
      validator = EnumAttributeValidator.new('String', ["company", "individual"])
      unless validator.valid?(account_type)
        fail ArgumentError, "invalid value for \"account_type\", must be one of #{validator.allowable_values}."
      end
      @account_type = account_type
    end

    # Custom attribute writer method with validation
    # @param [Object] signatory Value to be assigned
    def signatory=(signatory)
      if signatory.nil?
        fail ArgumentError, 'signatory cannot be nil'
      end

      if signatory.to_s.length > 30
        fail ArgumentError, 'invalid value for "signatory", the character length must be smaller than or equal to 30.'
      end

      @signatory = signatory
    end

    # Custom attribute writer method with validation
    # @param [Object] metadata Value to be assigned
    def metadata=(metadata)
      @metadata = metadata
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)
      if id.nil?
        fail ArgumentError, 'id cannot be nil'
      end

      pattern = Regexp.new(/^bank_[a-zA-Z0-9]+$/)
      if id !~ pattern
        fail ArgumentError, "invalid value for \"id\", must conform to the pattern #{pattern}."
      end

      @id = id
    end

    # Custom attribute writer method with validation
    # @param [Object] signature_url Value to be assigned
    def signature_url=(signature_url)
      pattern = Regexp.new(/^https:\/\/lob-assets.com\/(letters|postcards|bank-accounts|checks|self-mailers|cards)\/[a-z]{3,4}_[a-z0-9]{15,16}(''|_signature)(.pdf|_thumb_[a-z]+_[0-9]+.png|.png)\?(version=[a-z0-9]*&)expires=[0-9]{10}&signature=[a-zA-Z0-9-_]+/)
      if !signature_url.nil? && signature_url !~ pattern
        fail ArgumentError, "invalid value for \"signature_url\", must conform to the pattern #{pattern}."
      end

      @signature_url = signature_url
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object Object to be assigned
    def object=(object)
      validator = EnumAttributeValidator.new('String', ["bank_account"])
      unless validator.valid?(object)
        fail ArgumentError, "invalid value for \"object\", must be one of #{validator.allowable_values}."
      end
      @object = object
    end

    # Checks equality by comparing each attribute.
    # @param [Object] Object to be compared
    def ==(o)
      return true if self.equal?(o)
      self.class == o.class &&
          description == o.description &&
          routing_number == o.routing_number &&
          account_number == o.account_number &&
          account_type == o.account_type &&
          signatory == o.signatory &&
          metadata == o.metadata &&
          id == o.id &&
          signature_url == o.signature_url &&
          bank_name == o.bank_name &&
          verified == o.verified &&
          date_created == o.date_created &&
          date_modified == o.date_modified &&
          deleted == o.deleted &&
          object == o.object
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [description, routing_number, account_number, account_type, signatory, metadata, id, signature_url, bank_name, verified, date_created, date_modified, deleted, object].hash
    end


    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def self.build_from_hash(attributes)
      new.build_from_hash(attributes)
    end

    # Builds the object from hash
    # @param [Hash] attributes Model attributes in the form of hash
    # @return [Object] Returns the model itself
    def build_from_hash(attributes)
      return nil unless attributes.is_a?(Hash)
      attributes = attributes.transform_keys(&:to_sym)
      self.class.openapi_types.each_pair do |key, type|
        if attributes[self.class.attribute_map[key]].nil? && self.class.openapi_nullable.include?(key)
          self.send("#{key}=", nil) # // guardrails-disable-line
        elsif type =~ /\AArray<(.*)>/i
          # check to ensure the input is an array given that the attribute
          # is documented as an array but the input is not
          if attributes[self.class.attribute_map[key]].is_a?(Array)
            self.send("#{key}=", attributes[self.class.attribute_map[key]].map { |v| _deserialize($1, v) }) # // guardrails-disable-line
          end
        elsif !attributes[self.class.attribute_map[key]].nil? && type.kind_of?(Array)
          for base_type in type do
            res = _deserialize(base_type, attributes[self.class.attribute_map[key]])
            if !res.nil?
              self.send("#{key}=", res) # // guardrails-disable-line
              break
            end
          end
        elsif !attributes[self.class.attribute_map[key]].nil?
          self.send("#{key}=", _deserialize(type, attributes[self.class.attribute_map[key]])) # // guardrails-disable-line
        end
      end

      self
    end

    # Deserializes the data based on type
    # @param string type Data type
    # @param string value Value to be deserialized
    # @return [Object] Deserialized data
    def _deserialize(type, value)
      case type.to_sym
      when :Time
        Time.parse(value)
      when :Date
        Date.parse(value)
      when :String
        value.to_s
      when :Integer
        value.to_i
      when :Float
        value.to_f
      when :Boolean
        if value.to_s =~ /\A(true|t|yes|y|1)\z/i
          true
        else
          false
        end
      when :Object
        # generic object (usually a Hash), return directly
        value
      when /\AArray<(?<inner_type>.+)>\z/
        inner_type = Regexp.last_match[:inner_type]
        value.map { |v| _deserialize(inner_type, v) }
      when /\AHash<(?<k_type>.+?), (?<v_type>.+)>\z/
        k_type = Regexp.last_match[:k_type]
        v_type = Regexp.last_match[:v_type]
        {}.tap do |hash|
          value.each do |k, v|
            hash[_deserialize(k_type, k)] = _deserialize(v_type, v)
          end
        end
      else # model
        # models (e.g. Pet) or oneOf
        klass = Lob.const_get(type)
        klass.respond_to?(:openapi_one_of) ? klass.build(value) : klass.build_from_hash(value)
      end
    end

    # Returns the string representation of the object
    # @return [String] String presentation of the object
    def to_s
      to_hash.to_s
    end

    # to_body is an alias to to_hash (backward compatibility)
    # @return [Hash] Returns the object in the form of hash
    def to_body
      to_hash
    end

    # Returns the object in the form of hash
    # @return [Hash] Returns the object in the form of hash
    def to_hash
      hash = {}
      self.class.attribute_map.each_pair do |attr, param|
        value = self.send(attr) # // guardrails-disable-line
        if value.nil?
          is_nullable = self.class.openapi_nullable.include?(attr)
          next if !is_nullable || (is_nullable && !instance_variable_defined?(:"@#{attr}"))
        end

        hash[param] = _to_hash(value)
      end
      hash
    end

    # Outputs non-array value in the form of hash
    # For object, use to_hash. Otherwise, just return the value
    # @param [Object] value Any valid value
    # @return [Hash] Returns the value in the form of hash
    def _to_hash(value)
      if value.is_a?(Array)
        value.compact.map { |v| _to_hash(v) }
      elsif value.is_a?(Hash)
        {}.tap do |hash|
          value.each { |k, v| hash[k] = _to_hash(v) }
        end
      elsif value.respond_to? :to_hash
        value.to_hash
      else
        value
      end
    end

  end

end
