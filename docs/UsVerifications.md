# Lob::UsVerifications

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **addresses** | [**Array&lt;UsVerificationOrError&gt;**](UsVerificationOrError.md) |  |  |
| **errors** | **Boolean** | Indicates whether any errors occurred during the verification process. |  |

## Example

```ruby
require 'lob'

instance = Lob::UsVerifications.new(
  addresses: null,
  errors: null
)
```

