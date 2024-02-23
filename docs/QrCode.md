# Lob::QrCode

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **position** | **String** | Sets how a QR code is being positioned in the document. |  |
| **top** | **String** | Vertical distance(in inches) to place QR code from the top. | [optional] |
| **right** | **String** | Horizonal distance(in inches) to place QR code from the right. | [optional] |
| **left** | **String** | Horizonal distance(in inches) to place QR code from the left. | [optional] |
| **bottom** | **String** | Vertical distance(in inches) to place QR code from the bottom. | [optional] |
| **redirect_url** | **String** | The url to redirect the user when a QR code is scanned. The url must start with &#x60;https://&#x60; |  |
| **width** | **String** | The size(in inches) of the QR code. All QR codes are generated as a square. |  |

## Example

```ruby
require 'lob'

instance = Lob::QrCode.new(
  position: null,
  top: null,
  right: null,
  left: null,
  bottom: null,
  redirect_url: null,
  width: null
)
```

