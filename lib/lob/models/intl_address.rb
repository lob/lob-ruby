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
  class IntlAddress
    # Unique identifier prefixed with `adr_`.
    attr_accessor :id

    # An internal description that identifies this resource. Must be no longer than 255 characters. 
    attr_accessor :description

    # name associated with address
    attr_accessor :name

    # Either `name` or `company` is required, you may also add both.
    attr_accessor :company

    # Must be no longer than 40 characters.
    attr_accessor :phone

    # Must be no longer than 100 characters.
    attr_accessor :email

    # Use metadata to store custom information for tagging and labeling back to your internal systems. Must be an object with up to 20 key-value pairs. Keys must be at most 40 characters and values must be at most 500 characters. Neither can contain the characters `\"` and `\\`. i.e. '{\"customer_id\" : \"NEWYORK2015\"}' Nested objects are not supported.  See [Metadata](#section/Metadata) for more information.
    attr_accessor :metadata

    attr_accessor :address_line1

    attr_accessor :address_line2

    attr_accessor :address_city

    # 2 letter state short-name code
    attr_accessor :address_state

    # Must have a maximum of 12 characters 
    attr_accessor :address_zip

    attr_accessor :address_country

    attr_accessor :object

    # A timestamp in ISO 8601 format of the date the resource was created.
    attr_accessor :date_created

    # A timestamp in ISO 8601 format of the date the resource was last modified.
    attr_accessor :date_modified

    # Only returned if the resource has been successfully deleted.
    attr_accessor :deleted

    # Checks if address id is used or not
    attr_accessor :inline

    # Only returned for accounts on certain <a href=\"https://dashboard.lob.com/#/settings/editions\">Print &amp; Mail Editions</a>. Value is `true` if the address was altered because the recipient filed for a <a href=\"#ncoa\">National Change of Address (NCOA)</a>, `false` if the NCOA check was run but no altered address was found, and `null` if the NCOA check was not run. The NCOA check does not happen for non-US addresses, for non-deliverable US addresses, or for addresses created before the NCOA feature was added to your account. 
    attr_accessor :recipient_moved

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
        :'id' => :'id',
        :'description' => :'description',
        :'name' => :'name',
        :'company' => :'company',
        :'phone' => :'phone',
        :'email' => :'email',
        :'metadata' => :'metadata',
        :'address_line1' => :'address_line1',
        :'address_line2' => :'address_line2',
        :'address_city' => :'address_city',
        :'address_state' => :'address_state',
        :'address_zip' => :'address_zip',
        :'address_country' => :'address_country',
        :'object' => :'object',
        :'date_created' => :'date_created',
        :'date_modified' => :'date_modified',
        :'deleted' => :'deleted',
        :'inline' => :'inline',
        :'recipient_moved' => :'recipient_moved'
      }
    end

    # Returns all the JSON keys this model knows about
    def self.acceptable_attributes
      attribute_map.values
    end

    # Attribute type mapping.
    def self.openapi_types
      {
        :'id' => :'String',
        :'description' => :'String',
        :'name' => :'String',
        :'company' => :'String',
        :'phone' => :'String',
        :'email' => :'String',
        :'metadata' => :'Hash<String, String>',
        :'address_line1' => :'String',
        :'address_line2' => :'String',
        :'address_city' => :'String',
        :'address_state' => :'String',
        :'address_zip' => :'String',
        :'address_country' => :'CountryExtendedExpanded',
        :'object' => :'String',
        :'date_created' => :'Time',
        :'date_modified' => :'Time',
        :'deleted' => :'Boolean',
        :'inline' => :'Boolean',
        :'recipient_moved' => :'Boolean'
      }
    end

    # List of attributes with nullable: true
    def self.openapi_nullable
      Set.new([
        :'description',
        :'name',
        :'company',
        :'phone',
        :'email',
        :'address_line2',
        :'recipient_moved'
      ])
    end

    # Initializes the object
    # @param [Hash] attributes Model attributes in the form of hash
    def initialize(attributes = {})
      if (!attributes.is_a?(Hash))
        fail ArgumentError, "The input argument (attributes) must be a hash in `Lob::IntlAddress` initialize method"
      end

      # check to see if the attribute exists and convert string to symbol for hash key
      attributes = attributes.each_with_object({}) { |(k, v), h|
        if (!self.class.attribute_map.key?(k.to_sym))
          fail ArgumentError, "`#{k}` is not a valid attribute in `Lob::IntlAddress`. Please check the name to make sure it's valid. List of attributes: " + self.class.attribute_map.keys.inspect
        end
        h[k.to_sym] = v
      }

      if attributes.key?(:'id')
        self.id = attributes[:'id']
      end

      if attributes.key?(:'description')
        self.description = attributes[:'description']
      end

      if attributes.key?(:'name')
        self.name = attributes[:'name']
      end

      if attributes.key?(:'company')
        self.company = attributes[:'company']
      end

      if attributes.key?(:'phone')
        self.phone = attributes[:'phone']
      end

      if attributes.key?(:'email')
        self.email = attributes[:'email']
      end

      if attributes.key?(:'metadata')
        if (value = attributes[:'metadata']).is_a?(Hash)
          self.metadata = value
        end
      end

      if attributes.key?(:'address_line1')
        self.address_line1 = attributes[:'address_line1']
      end

      if attributes.key?(:'address_line2')
        self.address_line2 = attributes[:'address_line2']
      end

      if attributes.key?(:'address_city')
        self.address_city = attributes[:'address_city']
      end

      if attributes.key?(:'address_state')
        self.address_state = attributes[:'address_state']
      end

      if attributes.key?(:'address_zip')
        self.address_zip = attributes[:'address_zip']
      end

      if attributes.key?(:'address_country')
        self.address_country = attributes[:'address_country']
      end

      if attributes.key?(:'object')
        self.object = attributes[:'object']
      else
        self.object = 'address'
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

      if attributes.key?(:'inline')
        self.inline = attributes[:'inline']
      end

      if attributes.key?(:'recipient_moved')
        self.recipient_moved = attributes[:'recipient_moved']
      end
    end

    # Show invalid properties with the reasons. Usually used together with valid?
    # @return Array for valid properties with the reasons
    def list_invalid_properties
      invalid_properties = Array.new
      pattern = Regexp.new(/^adr_[a-zA-Z0-9]+$/)
      if !@id.nil? && @id !~ pattern
        invalid_properties.push("invalid value for \"id\", must conform to the pattern #{pattern}.")
      end

      if !@description.nil? && @description.to_s.length > 255
        invalid_properties.push('invalid value for "description", the character length must be smaller than or equal to 255.')
      end

      if !@name.nil? && @name.to_s.length > 40
        invalid_properties.push('invalid value for "name", the character length must be smaller than or equal to 40.')
      end

      if !@company.nil? && @company.to_s.length > 40
        invalid_properties.push('invalid value for "company", the character length must be smaller than or equal to 40.')
      end

      if !@phone.nil? && @phone.to_s.length > 40
        invalid_properties.push('invalid value for "phone", the character length must be smaller than or equal to 40.')
      end

      if !@email.nil? && @email.to_s.length > 100
        invalid_properties.push('invalid value for "email", the character length must be smaller than or equal to 100.')
      end

      if !@address_line1.nil? && @address_line1.to_s.length > 64
        invalid_properties.push('invalid value for "address_line1", the character length must be smaller than or equal to 64.')
      end

      if !@address_line2.nil? && @address_line2.to_s.length > 64
        invalid_properties.push('invalid value for "address_line2", the character length must be smaller than or equal to 64.')
      end

      if !@address_city.nil? && @address_city.to_s.length > 200
        invalid_properties.push('invalid value for "address_city", the character length must be smaller than or equal to 200.')
      end

      pattern = Regexp.new(/^[a-zA-Z]{2}$/)
      if !@address_state.nil? && @address_state !~ pattern
        invalid_properties.push("invalid value for \"address_state\", must conform to the pattern #{pattern}.")
      end

      if !@address_zip.nil? && @address_zip.to_s.length > 12
        invalid_properties.push('invalid value for "address_zip", the character length must be smaller than or equal to 12.')
      end

      invalid_properties
    end

    # Check to see if the all the properties in the model are valid
    # @return true if the model is valid
    def valid?
      return false if !@id.nil? && @id !~ Regexp.new(/^adr_[a-zA-Z0-9]+$/)
      return false if !@description.nil? && @description.to_s.length > 255
      return false if !@name.nil? && @name.to_s.length > 40
      return false if !@company.nil? && @company.to_s.length > 40
      return false if !@phone.nil? && @phone.to_s.length > 40
      return false if !@email.nil? && @email.to_s.length > 100
      return false if !@address_line1.nil? && @address_line1.to_s.length > 64
      return false if !@address_line2.nil? && @address_line2.to_s.length > 64
      return false if !@address_city.nil? && @address_city.to_s.length > 200
      return false if !@address_state.nil? && @address_state !~ Regexp.new(/^[a-zA-Z]{2}$/)
      return false if !@address_zip.nil? && @address_zip.to_s.length > 12
      object_validator = EnumAttributeValidator.new('String', ["address"])
      return false unless object_validator.valid?(@object)
      true
    end

    # Custom attribute writer method with validation
    # @param [Object] id Value to be assigned
    def id=(id)
      pattern = Regexp.new(/^adr_[a-zA-Z0-9]+$/)
      if !id.nil? && id !~ pattern
        fail ArgumentError, "invalid value for \"id\", must conform to the pattern #{pattern}."
      end

      @id = id
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
    # @param [Object] name Value to be assigned
    def name=(name)
      if !name.nil? && name.to_s.length > 40
        fail ArgumentError, 'invalid value for "name", the character length must be smaller than or equal to 40.'
      end

      @name = name
    end

    # Custom attribute writer method with validation
    # @param [Object] company Value to be assigned
    def company=(company)
      if !company.nil? && company.to_s.length > 40
        fail ArgumentError, 'invalid value for "company", the character length must be smaller than or equal to 40.'
      end

      @company = company
    end

    # Custom attribute writer method with validation
    # @param [Object] phone Value to be assigned
    def phone=(phone)
      if !phone.nil? && phone.to_s.length > 40
        fail ArgumentError, 'invalid value for "phone", the character length must be smaller than or equal to 40.'
      end

      @phone = phone
    end

    # Custom attribute writer method with validation
    # @param [Object] email Value to be assigned
    def email=(email)
      if !email.nil? && email.to_s.length > 100
        fail ArgumentError, 'invalid value for "email", the character length must be smaller than or equal to 100.'
      end

      @email = email
    end

    # Custom attribute writer method with validation
    # @param [Object] metadata Value to be assigned
    def metadata=(metadata)
      @metadata = metadata
    end

    # Custom attribute writer method with validation
    # @param [Object] address_line1 Value to be assigned
    def address_line1=(address_line1)
      if !address_line1.nil? && address_line1.to_s.length > 64
        fail ArgumentError, 'invalid value for "address_line1", the character length must be smaller than or equal to 64.'
      end

      @address_line1 = address_line1
    end

    # Custom attribute writer method with validation
    # @param [Object] address_line2 Value to be assigned
    def address_line2=(address_line2)
      if !address_line2.nil? && address_line2.to_s.length > 64
        fail ArgumentError, 'invalid value for "address_line2", the character length must be smaller than or equal to 64.'
      end

      @address_line2 = address_line2
    end

    # Custom attribute writer method with validation
    # @param [Object] address_city Value to be assigned
    def address_city=(address_city)
      if !address_city.nil? && address_city.to_s.length > 200
        fail ArgumentError, 'invalid value for "address_city", the character length must be smaller than or equal to 200.'
      end

      @address_city = address_city
    end

    # Custom attribute writer method with validation
    # @param [Object] address_state Value to be assigned
    def address_state=(address_state)
      pattern = Regexp.new(/^[a-zA-Z]{2}$/)
      if !address_state.nil? && address_state !~ pattern
        fail ArgumentError, "invalid value for \"address_state\", must conform to the pattern #{pattern}."
      end

      @address_state = address_state
    end

    # Custom attribute writer method with validation
    # @param [Object] address_zip Value to be assigned
    def address_zip=(address_zip)
      if !address_zip.nil? && address_zip.to_s.length > 12
        fail ArgumentError, 'invalid value for "address_zip", the character length must be smaller than or equal to 12.'
      end

      @address_zip = address_zip
    end

    # Custom attribute writer method checking allowed values (enum).
    # @param [Object] object Object to be assigned
    def object=(object)
      validator = EnumAttributeValidator.new('String', ["address"])
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
          id == o.id &&
          description == o.description &&
          name == o.name &&
          company == o.company &&
          phone == o.phone &&
          email == o.email &&
          metadata == o.metadata &&
          address_line1 == o.address_line1 &&
          address_line2 == o.address_line2 &&
          address_city == o.address_city &&
          address_state == o.address_state &&
          address_zip == o.address_zip &&
          address_country == o.address_country &&
          object == o.object &&
          date_created == o.date_created &&
          date_modified == o.date_modified &&
          deleted == o.deleted &&
          inline == o.inline &&
          recipient_moved == o.recipient_moved
    end

    # @see the `==` method
    # @param [Object] Object to be compared
    def eql?(o)
      self == o
    end

    # Calculates hash code according to all attributes.
    # @return [Integer] Hash code
    def hash
      [id, description, name, company, phone, email, metadata, address_line1, address_line2, address_city, address_state, address_zip, address_country, object, date_created, date_modified, deleted, inline, recipient_moved].hash
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
