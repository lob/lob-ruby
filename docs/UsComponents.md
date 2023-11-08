# Lob::UsComponents

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **primary_number** | **String** | The numeric or alphanumeric part of an address preceding the street name. Often the house, building, or PO Box number. |  |
| **street_predirection** | **String** | Geographic direction preceding a street name (&#x60;N&#x60;, &#x60;S&#x60;, &#x60;E&#x60;, &#x60;W&#x60;, &#x60;NE&#x60;, &#x60;SW&#x60;, &#x60;SE&#x60;, &#x60;NW&#x60;).  |  |
| **street_name** | **String** | The name of the street. |  |
| **street_suffix** | **String** | The standard USPS abbreviation for the street suffix (&#x60;ST&#x60;, &#x60;AVE&#x60;, &#x60;BLVD&#x60;, etc).  |  |
| **street_postdirection** | **String** | Geographic direction following a street name (&#x60;N&#x60;, &#x60;S&#x60;, &#x60;E&#x60;, &#x60;W&#x60;, &#x60;NE&#x60;, &#x60;SW&#x60;, &#x60;SE&#x60;, &#x60;NW&#x60;).  |  |
| **secondary_designator** | **String** | The standard USPS abbreviation describing the &#x60;components[secondary_number]&#x60; (&#x60;STE&#x60;, &#x60;APT&#x60;, &#x60;BLDG&#x60;, etc).  |  |
| **secondary_number** | **String** | Number of the apartment/unit/etc.  |  |
| **pmb_designator** | **String** | Designator of a [CMRA-authorized](https://en.wikipedia.org/wiki/Commercial_mail_receiving_agency) private mailbox.  |  |
| **pmb_number** | **String** | Number of a [CMRA-authorized](https://en.wikipedia.org/wiki/Commercial_mail_receiving_agency) private mailbox.  |  |
| **extra_secondary_designator** | **String** | An extra (often unnecessary) secondary designator provided with the input address.  |  |
| **extra_secondary_number** | **String** | An extra (often unnecessary) secondary number provided with the input address.  |  |
| **city** | **String** |  |  |
| **state** | **String** | The [ISO 3166-2](https://en.wikipedia.org/wiki/ISO_3166-2) two letter code for the state.  |  |
| **zip_code** | **String** | The 5-digit ZIP code |  |
| **zip_code_plus_4** | **String** |  |  |
| **zip_code_type** | [**ZipCodeType**](ZipCodeType.md) |  |  |
| **delivery_point_barcode** | **String** | A 12-digit identifier that uniquely identifies a delivery point (location where mail can be sent and received). It consists of the 5-digit ZIP code (&#x60;zip_code&#x60;), 4-digit ZIP+4 add-on (&#x60;zip_code_plus_4&#x60;), 2-digit delivery point, and 1-digit delivery point check digit.  |  |
| **address_type** | **String** | Uses USPS&#39;s [Residential Delivery Indicator (RDI)](https://www.usps.com/nationalpremieraccounts/rdi.htm) to identify whether an address is classified as residential or business. Possible values are: * &#x60;residential&#x60; –– The address is residential or a PO Box. * &#x60;commercial&#x60; –– The address is commercial. * &#x60;&#39;&#39;&#x60; –– Not enough information provided to be determined.  |  |
| **record_type** | **String** | A description of the type of address. Populated if a DPV match is made (&#x60;deliverability_analysis[dpv_confirmation]&#x60; is &#x60;Y&#x60;, &#x60;S&#x60;, or &#x60;D&#x60;). For more detailed information about each record type, see [US Verification Details](#tag/US-Verification-Types).  |  |
| **default_building_address** | **Boolean** | Designates whether or not the address is the default address for a building containing multiple delivery points.  |  |
| **county** | **String** | County name of the address city. |  |
| **county_fips** | **String** | A 5-digit [FIPS county code](https://en.wikipedia.org/wiki/FIPS_county_code) which uniquely identifies &#x60;components[county]&#x60;. It consists of a 2-digit state code and a 3-digit county code.  |  |
| **carrier_route** | **String** | A 4-character code assigned to a mail delivery route within a ZIP code.  |  |
| **carrier_route_type** | **String** | The type of &#x60;components[carrier_route]&#x60;. For more detailed information about each carrier route type, see [US Verification Details](#tag/US-Verification-Types).  |  |
| **po_box_only_flag** | **String** | Indicates the mailing facility for an address only supports PO Box deliveries and other forms of mail delivery are not available.  |  |
| **latitude** | **Float** | A positive or negative decimal indicating the geographic latitude of the address, specifying the north-to-south position of a location. This should be used with &#x60;longitude&#x60; to pinpoint locations on a map. Will not be returned for undeliverable addresses or military addresses (state is &#x60;AA&#x60;, &#x60;AE&#x60;, or &#x60;AP&#x60;).  | [optional] |
| **longitude** | **Float** | A positive or negative decimal indicating the geographic longitude of the address, specifying the north-to-south position of a location. This should be used with &#x60;latitude&#x60; to pinpoint locations on a map. Will not be returned for undeliverable addresses or military addresses (state is &#x60;AA&#x60;, &#x60;AE&#x60;, or &#x60;AP&#x60;).  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::UsComponents.new(
  primary_number: null,
  street_predirection: null,
  street_name: null,
  street_suffix: null,
  street_postdirection: null,
  secondary_designator: null,
  secondary_number: null,
  pmb_designator: null,
  pmb_number: null,
  extra_secondary_designator: null,
  extra_secondary_number: null,
  city: null,
  state: null,
  zip_code: null,
  zip_code_plus_4: null,
  zip_code_type: null,
  delivery_point_barcode: null,
  address_type: null,
  record_type: null,
  default_building_address: null,
  county: null,
  county_fips: null,
  carrier_route: null,
  carrier_route_type: null,
  po_box_only_flag: null,
  latitude: null,
  longitude: null
)
```

