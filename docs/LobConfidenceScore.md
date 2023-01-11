# Lob::LobConfidenceScore

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **score** | **Float** | A numerical score between 0 and 100 that represents the percentage of mailpieces Lob has sent to this addresses that have been delivered successfully over the past 2 years. Will be &#x60;null&#x60; if no tracking data exists for this address.  | [optional] |
| **level** | **String** | indicates the likelihood that the address is a valid, mail-receiving address. Possible values are:   - &#x60;high&#x60; — Over 70% of mailpieces Lob has sent to this address were delivered successfully and recent mailings were also successful.   - &#x60;medium&#x60; — Between 40% and 70% of mailpieces Lob has sent to this address were delivered successfully.   - &#x60;low&#x60; — Less than 40% of mailpieces Lob has sent to this address were delivered successfully and recent mailings weren&#39;t successful.   - &#x60;\&quot;\&quot;&#x60; — No tracking data exists for this address or lob deliverability was unable to find a corresponding level of mail success.  | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::LobConfidenceScore.new(
  score: null,
  level: null
)
```

