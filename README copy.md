# lob-ruby

[![semantic-release: angular](https://img.shields.io/badge/semantic--release-angular-e10079?logo=semantic-release)](https://github.com/semantic-release/semantic-release)

Ruby SDK for the [Lob.com](https://lob.com) API. See the full Lob.com API documentation [here](https://docs.lob.com).

## Getting Started

### Registration

First, you will need to first create an account at [Lob.com](https://dashboard.lob.com/#/register) and obtain your Test and Live API Keys.

Once you have created an account, you can access your API Keys from the [Settings Panel](https://dashboard.lob.com/#/settings).

### Installation

lob-ruby can be installed through the ruby package manager:

```
$ go install github.com/lob/lob-go@latest
```

## Examples

### First API Calls
```go
import (
  "context"
  "os"
  lob "github.com/lob/lob-go"
)
ctx := context.Background()
ctx = context.WithValue(ctx, lob.ContextBasicAuth, lob.BasicAuth{UserName: os.Getenv("LOB_API_TEST_KEY")})

config := *lob.NewConfiguration()

apiClient := *lob.NewAPIClient(&config)

address := *lob.AddressEditable
address.SetName("Harry Zhang")
address.SetAddressLine1("210 King St")
address.SetAddressCity("San Francisco")
address.SetAddressState("CA")
address.SetAddressZip("94107")

myAddress, _, createErr := apiClient.AddressesApi.Create(ctx).AddressEditable(address).Execute()

if createErr != nil {
    log.Fatal(createErr)
}

myAddressFromApi, _, getErr := apiClient.AddressesApi.Get(ctx, *myAddress.Id).Execute()

if getErr != nil {
    log.Fatal(getErr)
}

resp, _, deleteErr := suite.apiClient.AddressesApi.Delete(suite.ctx, *myAddress.Id).Execute()

if deleteErr != nil {
    log.Fatal(deleteErr)
}
```

## API Documentation

The full and comprehensive documentation of Lob's APIs is available [here](https://docs.lob.com/).

## Supported Go Versions

Our client libraries follow the [Go release schedule](https://go.dev/dl/).
This package is compatible with all current _stable_ versions of
Go. If you are using a version that is not listed as an _stable_ version we recommend that you switch to an actively supported LTS version.

Any support or compatability with versions of Go not listed as _stable_ is on a best-efforts basis.

## Testing

### Integration Tests

Integration tests run against a live deployment of the Lob API and require multiple valid API keys with access to specific features. As such, it is not expected that these tests will pass for every user in every environment.

To run integration tests:

```go
go test -v ./__tests__ 
```

=======================

Copyright © 2022 Lob.com

Released under the MIT License, which can be found in the repository in [LICENSE.txt](https://github.com/lob/lob-go/blob/main/LICENSE.txt).
