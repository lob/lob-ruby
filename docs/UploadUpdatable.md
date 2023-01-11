# Lob::UploadUpdatable

## Properties

| Name | Type | Description | Notes |
| ---- | ---- | ----------- | ----- |
| **state** | [**UploadState**](UploadState.md) |  | [optional][default to &#39;Draft&#39;] |
| **original_filename** | **String** | Original filename provided when the upload is created. | [optional] |

## Example

```ruby
require 'openapi_client'

instance = Lob::UploadUpdatable.new(
  state: null,
  original_filename: null
)
```

