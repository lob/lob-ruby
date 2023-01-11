# Lob::Thumbnail

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **small** | **String** | A [signed link](#section/Asset-URLs) served over HTTPS. The link returned will expire in 30 days to prevent mis-sharing. Each time a GET request is initiated, a new signed URL will be generated. | [optional] |
| **medium** | **String** | A [signed link](#section/Asset-URLs) served over HTTPS. The link returned will expire in 30 days to prevent mis-sharing. Each time a GET request is initiated, a new signed URL will be generated. | [optional] |
| **large** | **String** | A [signed link](#section/Asset-URLs) served over HTTPS. The link returned will expire in 30 days to prevent mis-sharing. Each time a GET request is initiated, a new signed URL will be generated. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::Thumbnail.new(
  small: null,
  medium: null,
  large: null
)
```

