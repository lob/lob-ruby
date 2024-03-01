# Lob::BankAccountVerify

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **amounts** | **Array&lt;Integer&gt;** | In live mode, an array containing the two micro deposits (in cents) placed in the bank account. In test mode, no micro deposits will be placed, so any two integers between &#x60;1&#x60; and &#x60;100&#x60; will work. |  |

## Example

```ruby
require 'lob'

instance = Lob::BankAccountVerify.new(
  amounts: null
)
```

