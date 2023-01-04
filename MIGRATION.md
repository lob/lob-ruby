# Migrate from version < v5.0.0

This guide illustrates differences between Lob’s the legacy versions of this SDK and the new current version.

In this guide we compare how `v4.*.*` and >= `v5.0.0` implement the following method pattern.

- CREATE
- LIST
- GET
- DELETE
- VERIFY (BANK ACCOUNTS)
- UPDATE

## INSTALL

Similar to the legacy version, the new lob-python SDK is available through `pip`:

```
$ pip install lob_python
```

## IMPORT AND INITIALIZE


```python
import lob_python
configuration = lob_python.Configuration(
    username = os.getenv('LOB_API_TEST_KEY')
)
```
You then instantiate the specific resource API that you need access to as follows:

```python
with lob_python.ApiClient(configuration) as api_client:
    addresses_api = AddressesApi(api_client)
```

## METHODS

The new SDK version abstracts the request/response interaction out of the calling code such that you create the resource and pass it to the corresponding API in a try/catch such that any non-success is an `ApiException` that must be handled.

### COMPARE CREATE METHODS

Here is a sample of the legacy lob-python CREATE function:

```python
lob.Address.create(
  description='Harry - Office',
  name='Harry Zhang',
  company='Lob',
  email='harry@lob.com',
  phone='5555555555',
  address_line1='210 King St',
  address_line2='# 6100',
  address_city='San Francisco',
  address_state='CA',
  address_zip='94107',
  address_country='US',
)
```

Here is a sample of the updated CREATE method

```python
address_editable = AddressEditable(
  description = "Harry - Office",
  name = "Harry Zhang",
  company = "Lob",
  email = "harry@lob.com",
  phone = "5555555555",
  address_line1 = "210 King St",
  address_line2 = "# 6100",
  address_city = "San Francisco",
  address_state = "CA",
  address_zip = "94107",
  address_country = CountryExtended("US"),
)

with lob_python.ApiClient(configuration) as api_client:
  api = AddressesApi(api_client)

try:
  created_address = api.create(address_editable)
except ApiException as e:
  print(e)
```

### COMPARE LIST METHODS

Here is a sample of the legacy lob-python LIST method:

```python
lob.Address.list(limit=2)
```

Here is a sample of the updated LIST method:

```python
with lob_python.ApiClient(configuration) as api_client:
  api = AddressesApi(api_client)

try:
  addresses = api.list(limit=2)
except ApiException as e:
  print(e)
```

### COMPARE GET BY ID METHOD

Here is a sample of the legacy lob-python GET method:

```python
lob.Address.retrieve('adr_xxx')
```

Here is a sample of the updated GET method:

```python
with lob_python.ApiClient(configuration) as api_client:
  api = AddressesApi(api_client)

try:
  address = api.get('adr_xxx')
except ApiException as e:
  print(e)
```

### COMPARE DELETE METHOD

Here is a sample of the legacy lob-python DELETE method:

```python
lob.Address.delete('adr_xxx')
```

Here is a sample of the updated DELETE method:

```python
with lob_python.ApiClient(configuration) as api_client:
  api = AddressesApi(api_client)

try:
  deleted_address = api.delete('adr_xxx')
except ApiException as e:
  print(e)
```

### COMPARE BANK ACCOUNT VERIFY

Here is a sample of the legacy lob-python BANK ACCOUNT VERIFY method:

```python
lob.BankAccount.verify(id = 'bank_xxx', amounts = [25, 63])
```

Here is a sample of the updated BANK ACCOUNT VERIFY method:

```python
verification_data = BankAccountVerify(
  amounts = [
    25,
    63,
  ],
)

with lob_python.ApiClient(configuration) as api_client:
  api = BankAccountsApi(api_client)

try:
  verifiedAccount = api.verify('bank_dfceb4a2a05b57e', verification_data)
except ApiException as e:
  print(e)
```

### COMPARE UPDATE METHOD

Here is a sample of the legacy lob-python UPDATE method:

```python
This feature is not currently supported by this library.
```

Here is a sample of the updated UPDATE method:

```python
with lob_python.ApiClient(configuration) as api_client:
  api = TemplatesApi(api_client)

template_update = TemplateUpdate(
    description = "Updated template"
)

try:
  updated_template = api.update('tmpl_xxx', template_update)
except ApiException as e:
  print(e)
```
