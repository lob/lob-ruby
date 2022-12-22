# OpenapiClient::DeliverabilityAnalysis

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **dpv_confirmation** | **String** | Result of Delivery Point Validation (DPV), which determines whether or not the address is deliverable by the USPS. Possible values are: * &#x60;Y&#x60; –– The address is deliverable by the USPS. * &#x60;S&#x60; –– The address is deliverable by removing the provided secondary unit designator. This information may be incorrect or unnecessary. * &#x60;D&#x60; –– The address is deliverable to the building&#39;s default address but is missing a secondary unit designator and/or number.   There is a chance the mail will not reach the intended recipient. * &#x60;N&#x60; –– The address is not deliverable according to the USPS, but parts of the address are valid (such as the street and ZIP code). * &#x60;&#39;&#39;&#x60; –– This address is not deliverable. No matching street could be found within the city or ZIP code.  |  |
| **dpv_cmra** | **String** | indicates whether or not the address is [CMRA-authorized](https://en.wikipedia.org/wiki/Commercial_mail_receiving_agency). Possible values are: * &#x60;Y&#x60; –– Address is CMRA-authorized. * &#x60;N&#x60; –– Address is not CMRA-authorized. * &#x60;&#39;&#39;&#x60; –– A DPV match is not made (&#x60;deliverability_analysis[dpv_confirmation]&#x60; is &#x60;N&#x60; or an empty string).  |  |
| **dpv_vacant** | **String** | indicates that an address was once deliverable, but has become vacant and is no longer receiving deliveries. Possible values are: * &#x60;Y&#x60; –– Address is vacant. * &#x60;N&#x60; –– Address is not vacant. * &#x60;&#39;&#39;&#x60; –– A DPV match is not made (&#x60;deliverability_analysis[dpv_confirmation]&#x60; is &#x60;N&#x60; or an empty string).  |  |
| **dpv_active** | **String** | Corresponds to the USPS field &#x60;dpv_no_stat&#x60;. Indicates that an address has been vacated in the recent past, and is no longer receiving deliveries. If it&#39;s been unoccupied for 90+ days, or temporarily vacant, this will be flagged. Possible values are: * &#x60;Y&#x60; –– Address is active. * &#x60;N&#x60; –– Address is not active. * &#x60;&#39;&#39;&#x60; –– A DPV match is not made (&#x60;deliverability_analysis[dpv_confirmation]&#x60; is &#x60;N&#x60; or an empty string).  |  |
| **dpv_footnotes** | [**Array&lt;DpvFootnote&gt;**](DpvFootnote.md) | An array of 2-character strings that gives more insight into how &#x60;deliverability_analysis[dpv_confirmation]&#x60; was determined. Will always include at least 1 string, and can include up to 3. For details, see [US Verification Details](#tag/US-Verification-Types).  |  |
| **ews_match** | **Boolean** | indicates whether or not an address has been flagged in the [Early Warning System](https://docs.informatica.com/data-engineering/data-engineering-quality/10-4-0/address-validator-port-reference/postal-carrier-certification-data-ports/early-warning-system-return-code.html), meaning the address is under development and not yet ready to receive mail. However, it should become available in a few months.  |  |
| **lacs_indicator** | **String** | indicates whether this address has been converted by [LACS&lt;sup&gt;Link&lt;/sup&gt;](https://postalpro.usps.com/address-quality/lacslink). LACS&lt;sup&gt;Link&lt;/sup&gt; corrects outdated addresses into their modern counterparts. Possible values are: * &#x60;Y&#x60; –– New address produced with a matching record in LACS&lt;sup&gt;Link&lt;/sup&gt;. * &#x60;N&#x60; –– New address could not be produced with a matching record in LACS&lt;sup&gt;Link&lt;/sup&gt;. * &#x60;&#39;&#39;&#x60; –– A DPV match is not made (&#x60;deliverability_analysis[dpv_confirmation]&#x60; is &#x60;N&#x60; or an empty string).  |  |
| **lacs_return_code** | **String** | A code indicating how &#x60;deliverability_analysis[lacs_indicator]&#x60; was determined. Possible values are: * &#x60;A&#x60; — A new address was produced because a match was found in LACS&lt;sup&gt;Link&lt;/sup&gt;. * &#x60;92&#x60; — A LACS&lt;sup&gt;Link&lt;/sup&gt; record was matched after dropping secondary information. * &#x60;14&#x60; — A match was found in LACS&lt;sup&gt;Link&lt;/sup&gt;, but could not be converted to a deliverable address. * &#x60;00&#x60; — A match was not found in LACS&lt;sup&gt;Link&lt;/sup&gt;, and no new address was produced. * &#x60;&#39;&#39;&#x60; — LACS&lt;sup&gt;Link&lt;/sup&gt; was not attempted.  |  |
| **suite_return_code** | **String** | A return code that indicates whether the address was matched and corrected by [Suite&lt;sup&gt;Link&lt;/sup&gt;](https://postalpro.usps.com/address-quality-solutions/suitelink). Suite&lt;sup&gt;Link&lt;/sup&gt; attempts to provide secondary information to business addresses. Possible values are: * &#x60;A&#x60; –– A Suite&lt;sup&gt;Link&lt;/sup&gt; match was found and secondary information was added. * &#x60;00&#x60; –– A Suite&lt;sup&gt;Link&lt;/sup&gt; match could not be found and no secondary information was added. * &#x60;&#39;&#39;&#x60; –– Suite&lt;sup&gt;Link&lt;/sup&gt; lookup was not attempted.  |  |

## Example

```ruby
require 'openapi_client'

instance = OpenapiClient::DeliverabilityAnalysis.new(
  dpv_confirmation: null,
  dpv_cmra: null,
  dpv_vacant: null,
  dpv_active: null,
  dpv_footnotes: null,
  ews_match: null,
  lacs_indicator: null,
  lacs_return_code: null,
  suite_return_code: null
)
```

