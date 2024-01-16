# Code Snippets

## Address Api

### Retrieve
```bash
curl https://api.lob.com/v1/addresses/adr_fa85158b26c3eb7c \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
addressApi = AddressesApi.new(config)

begin
  retrievedAddress = addressApi.get("adr_fa85158b26c3eb7c")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/addresses/adr_43769b47aed248c2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
addressApi = AddressesApi.new(config)

begin
  deletedAddress = addressApi.delete("adr_43769b47aed248c2")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/addresses \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Harry - Office" \
  -d "name=Harry Zhang" \
  -d "company=Lob" \
  -d "email=harry@lob.com" \
  -d "phone=5555555555" \
  -d "address_line1=2261 Market Street" \
  -d "address_line2=Ste 5668" \
  -d "address_city=San Francisco" \
  -d "address_state=CA" \
  -d "address_zip=94114" \
  -d "address_country=US" \
```

```ruby
addressCreate = AddressEditable.new({ 
  description: "Harry - Office",
  name: "Harry Zhang",
  company: "Lob",
  email: "harry@lob.com",
  phone: "5555555555",
  address_line1: "2261 Market Street",
  address_line2: "Ste 5668",
  address_city: "San Francisco",
  address_state: "CA",
  address_zip: "94114",
  address_country: "US",
});

addressApi = AddressesApi.new(config)

begin
  createdAddress = addressApi.create(addressCreate)
rescue => err
  p err.message
end
```







### List
```bash
curl -X GET "https://api.lob.com/v1/addresses?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
addressesApi = AddressesApi.new(config)

begin
  addresses = addressesApi.list({ limit: 2 })
rescue => err
  p err.message
end
```










































## Postcards Api

### Retrieve
```bash
curl https://api.lob.com/v1/postcards/psc_5c002b86ce47537a \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
postcardApi = PostcardsApi.new(config)

begin
  retrievedPostcard = postcardApi.get("psc_5c002b86ce47537a")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/postcards/psc_5c002b86ce47537a" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
postcardApi = PostcardsApi.new(config)

begin
  deletedPostcard = postcardApi.cancel("psc_5c002b86ce47537a")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/postcards \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Demo Postcard job" \
  -d "from=adr_210a8d4b0b76d77b" \
  --data-urlencode "front=<html style='padding: 1in; font-size: 50;'>Front HTML for {{name}}</html>" \
  --data-urlencode "back=<html style='padding: 1in; font-size: 20;'>Back HTML for {{name}}</html>" \
  -d "to[name]=Harry Zhang" \
  -d "to[address_line1]=2261 Market Street" \
  -d "to[address_line2]=Ste 5668" \
  -d "to[address_city]=San Francisco" \
  -d "to[address_state]=CA" \
  -d "to[address_zip]=94114" \
  -d "merge_variables[name]=Harry" \
```

```ruby
postcardCreate = PostcardEditable.new({ 
  description: "Demo Postcard job",
  from: "adr_210a8d4b0b76d77b",
  front: "<html style='padding: 1in; font-size: 50;'>Front HTML for {{name}}</html>",
  back: "<html style='padding: 1in; font-size: 20;'>Back HTML for {{name}}</html>",
  to: AddressEditable.new({ 
    name: "Harry Zhang",
    address_line1: "2261 Market Street",
    address_line2: "Ste 5668",
    address_city: "San Francisco",
    address_state: "CA",
    address_zip: "94114",
  }),
  merge_variables: { 
    name: "Harry"
  },
});

postcardApi = PostcardsApi.new(config)

begin
  createdPostcard = postcardApi.create(postcardCreate)
rescue => err
  p err.message
end
```







### List
```bash
curl -X GET "https://api.lob.com/v1/postcards?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
postcardsApi = PostcardsApi.new(config)

begin
  postcards = postcardsApi.list({ limit: 2 })
rescue => err
  p err.message
end
```


## SelfMailers Api

### Retrieve
```bash
curl https://api.lob.com/v1/self_mailers/sfm_8ffbe811dea49dcf \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
selfMailerApi = SelfMailersApi.new(config)

begin
  retrievedSelfMailer = selfMailerApi.get("sfm_8ffbe811dea49dcf")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/self_mailers/sfm_8ffbe811dea49dcf" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
selfMailerApi = SelfMailersApi.new(config)

begin
  deletedSelfMailer = selfMailerApi.delete("sfm_8ffbe811dea49dcf")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/self_mailers \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Demo Self Mailer job" \
  -d "from=adr_210a8d4b0b76d77b" \
  --data-urlencode "inside=<html style='padding: 1in; font-size: 50;'>Inside HTML for {{name}}</html>" \
  --data-urlencode "outside=<html style='padding: 1in; font-size: 20;'>Outside HTML for {{name}}</html>" \
  -d "to[name]=Harry Zhang" \
  -d "to[address_line1]=2261 Market Street" \
  -d "to[address_line2]=Ste 5668" \
  -d "to[address_city]=San Francisco" \
  -d "to[address_state]=CA" \
  -d "to[address_zip]=94114" \
  -d "merge_variables[name]=Harry" \
```

```ruby
selfMailerCreate = SelfMailerEditable.new({ 
  description: "Demo Self Mailer job",
  from: "adr_210a8d4b0b76d77b",
  inside: "<html style='padding: 1in; font-size: 50;'>Inside HTML for {{name}}</html>",
  outside: "<html style='padding: 1in; font-size: 20;'>Outside HTML for {{name}}</html>",
  to: AddressEditable.new({ 
    name: "Harry Zhang",
    address_line1: "2261 Market Street",
    address_line2: "Ste 5668",
    address_city: "San Francisco",
    address_state: "CA",
    address_zip: "94114",
  }),
  merge_variables: { 
    name: "Harry"
  },
});

selfMailerApi = SelfMailersApi.new(config)

begin
  createdSelfMailer = selfMailerApi.create(selfMailerCreate)
rescue => err
  p err.message
end
```







### List
```bash
curl -X GET "https://api.lob.com/v1/self_mailers?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
selfMailersApi = SelfMailersApi.new(config)

begin
  selfMailers = selfMailersApi.list({ limit: 2 })
rescue => err
  p err.message
end
```


## Letters Api

### Retrieve
```bash
curl https://api.lob.com/v1/letters/ltr_4868c3b754655f90 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
letterApi = LettersApi.new(config)

begin
  retrievedLetter = letterApi.get("ltr_4868c3b754655f90")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/letters/ltr_4868c3b754655f90" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
letterApi = LettersApi.new(config)

begin
  deletedLetter = letterApi.cancel("ltr_4868c3b754655f90")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/letters \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Demo Letter" \
  -d "from=adr_210a8d4b0b76d77b" \
  --data-urlencode "file=<html style='padding-top: 3in; margin: .5in;'>HTML Letter for {{name}}</html>" \
  -d "color=true" \
  -d "to[name]=Harry Zhang" \
  -d "to[address_line1]=2261 Market Street" \
  -d "to[address_line2]=Ste 5668" \
  -d "to[address_city]=San Francisco" \
  -d "to[address_state]=CA" \
  -d "to[address_zip]=94114" \
  -d "merge_variables[name]=Harry" \
  -d "cards[]=card_c51ae96f5cebf3e"
```

```ruby
letterCreate = LetterEditable.new({ 
  description: "Demo Letter",
  from: "adr_210a8d4b0b76d77b",
  file: "<html style='padding-top: 3in; margin: .5in;'>HTML Letter for {{name}}</html>",
  color: "true",
  to: AddressEditable.new({ 
    name: "Harry Zhang",
    address_line1: "2261 Market Street",
    address_line2: "Ste 5668",
    address_city: "San Francisco",
    address_state: "CA",
    address_zip: "94114",
  }),
  merge_variables: { 
    name: "Harry"
  },
  cards: [
    "card_c51ae96f5cebf3e",
  ],
});

letterApi = LettersApi.new(config)

begin
  createdLetter = letterApi.create(letterCreate)
rescue => err
  p err.message
end
```







### List
```bash
curl -X GET "https://api.lob.com/v1/letters?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
lettersApi = LettersApi.new(config)

begin
  letters = lettersApi.list({ limit: 2 })
rescue => err
  p err.message
end
```


## Checks Api

### Retrieve
```bash
curl https://api.lob.com/v1/checks/chk_534f10783683daa0 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
checkApi = ChecksApi.new(config)

begin
  retrievedCheck = checkApi.get("chk_534f10783683daa0")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/checks/chk_534f10783683daa0" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
checkApi = ChecksApi.new(config)

begin
  deletedCheck = checkApi.cancel("chk_534f10783683daa0")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/checks \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Demo Check" \
  -d "bank_account=bank_8cad8df5354d33f" \
  -d "amount=22.5" \
  -d "memo=rent" \
  --data-urlencode "logo=https://s3-us-west-2.amazonaws.com/public.lob.com/assets/check_logo.png" \
  --data-urlencode "check_bottom=<h1 style='padding-top:4in;'>Demo Check for {{name}}</h1>" \
  -d "from=adr_210a8d4b0b76d77b" \
  -d "to[name]=Harry Zhang" \
  -d "to[address_line1]=2261 Market Street" \
  -d "to[address_line2]=Ste 5668" \
  -d "to[address_city]=San Francisco" \
  -d "to[address_state]=CA" \
  -d "to[address_zip]=94114" \
  -d "merge_variables[name]=Harry" \
```

```ruby
checkCreate = CheckEditable.new({ 
  description: "Demo Check",
  bank_account: "bank_8cad8df5354d33f",
  amount: 22.5,
  memo: "rent",
  logo: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/check_logo.png",
  check_bottom: "<h1 style='padding-top:4in;'>Demo Check for {{name}}</h1>",
  from: "adr_210a8d4b0b76d77b",
  to: AddressDomestic.new({ 
    name: "Harry Zhang",
    address_line1: "2261 Market Street",
    address_line2: "Ste 5668",
    address_city: "San Francisco",
    address_state: "CA",
    address_zip: "94114",
  }),
  merge_variables: { 
    name: "Harry"
  },
});

checkApi = ChecksApi.new(config)

begin
  createdCheck = checkApi.create(checkCreate)
rescue => err
  p err.message
end
```







### List
```bash
curl -X GET "https://api.lob.com/v1/checks?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
checksApi = ChecksApi.new(config)

begin
  checks = checksApi.list({ limit: 2 })
rescue => err
  p err.message
end
```


## BankAccounts Api

### Retrieve
```bash
curl https://api.lob.com/v1/bank_accounts/bank_8cad8df5354d33f \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
bankAccountApi = BankAccountsApi.new(config)

begin
  retrievedBankAccount = bankAccountApi.get("bank_8cad8df5354d33f")
rescue => err
  p err.message
end
```







### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/bank_accounts/bank_3e64d9904356b20" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
bankAccountApi = BankAccountsApi.new(config)

begin
  deletedBankAccount = bankAccountApi.delete("bank_3e64d9904356b20")
rescue => err
  p err.message
end
```



### List
```bash
curl -X GET "https://api.lob.com/v1/bank_accounts?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
bankAccountsApi = BankAccountsApi.new(config)

begin
  bankAccounts = bankAccountsApi.list({ limit: 2 })
rescue => err
  p err.message
end
```






### Verify
```bash
curl https://api.lob.com/v1/bank_accounts/bank_dfceb4a2a05b57e/verify \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \ 
  -d "amounts[]=25" \ 
  -d "amounts[]=63" \ 
```

```ruby
verificationData = BankAccountVerify.new({
  amounts: [ 
    25, 
    63, 
  ],
})

bankAccountsApi = BankAccountsApi.new(config)

begin
  verifiedAccount = bankAccountsApi.verify("bank_dfceb4a2a05b57e", verificationData)
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/bank_accounts \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Test Bank Account" \
  -d "routing_number=322271627" \
  -d "account_number=123456789" \
  -d "signatory=John Doe" \
  -d "account_type=company" \
```

```ruby
bankAccountCreate = BankAccountWritable.new({ 
  description: "Test Bank Account",
  routing_number: "322271627",
  account_number: "123456789",
  signatory: "John Doe",
  account_type: BankTypeEnum::COMPANY,
});

bankAccountApi = BankAccountsApi.new(config)

begin
  createdBankAccount = bankAccountApi.create(bankAccountCreate)
rescue => err
  p err.message
end
```





## Templates Api

### Retrieve
```bash
curl https://api.lob.com/v1/templates/tmpl_c94e83ca2cd5121 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateApi = TemplatesApi.new(config)

begin
  retrievedTemplate = templateApi.get("tmpl_c94e83ca2cd5121")
rescue => err
  p err.message
end
```









### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/templates/tmpl_df934eeda694203" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateApi = TemplatesApi.new(config)

begin
  deletedTemplate = templateApi.delete("tmpl_df934eeda694203")
rescue => err
  p err.message
end
```

### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/templates/tmpl_df934eeda694203" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateApi = TemplatesApi.new(config)

begin
  deletedTemplate = templateApi.delete("tmpl_df934eeda694203")
rescue => err
  p err.message
end
```



### List
```bash
curl -X GET "https://api.lob.com/v1/templates?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templatesApi = TemplatesApi.new(config)

begin
  templates = templatesApi.list({ limit: 2 })
rescue => err
  p err.message
end
```








### Update
```bash
curl -X PATCH https://api.lob.com/v1/tmpl_c94e83ca2cd5121 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=updated template" \
  -d "published_version=vrsn_362184d96d9b0c9" \
```

```ruby
templateUpdate = TemplateUpdate.new({ 
  description: "updated template",
  published_version: "vrsn_362184d96d9b0c9",
})

templateApi = TemplatesApi.new(config)

begin
  updatedTemplate = templateApi.update("tmpl_c94e83ca2cd5121", templateUpdate)
rescue => err
  p err.message
end
```



### Create
```bash
curl https://api.lob.com/v1/templates \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Test Template" \
  --data-urlencode "html=<html>HTML for {{name}}</html>" \
```

```ruby
templateCreate = TemplateWritable.new({ 
  description: "Test Template",
  html: "<html>HTML for {{name}}</html>",
});

templateApi = TemplatesApi.new(config)

begin
  createdTemplate = templateApi.create(templateCreate)
rescue => err
  p err.message
end
```







## TemplateVersions Api

### Retrieve
```bash
curl https://api.lob.com/v1/templates/tmpl_c94e83ca2cd5121/versions/vrsn_534e339882d2282 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateVersionApi = TemplateVersionsApi.new(config)

begin
  retrievedTemplateVersion = templateVersionApi.get("tmpl_c94e83ca2cd5121", "vrsn_534e339882d2282")
rescue => err
  p err.message
end
```








### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/templates/tmpl_4aa14648113e45b/versions/vrsn_534e339882d2282" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateVersionApi = TemplateVersionsApi.new(config)

begin
  deletedTemplateVersion = templateVersionApi.delete("tmpl_4aa14648113e45b", "vrsn_534e339882d2282")
rescue => err
  p err.message
end
```




### List
```bash
curl -X GET "https://api.lob.com/v1/templates/tmpl_dadaaf7b76c9f25/versions?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
templateVersionsApi = TemplateVersionsApi.new(config)

begin
  templateVersions = templateVersionsApi.list("tmpl_dadaaf7b76c9f25", { limit: 2 })
rescue => err
  p err.message
end
```







### Update
```bash
curl -X PATCH https://api.lob.com/v1/vrsn_534e339882d2282 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=updated template version" \
```

```ruby
templateVersionUpdatable = TemplateUpdate.new({ 
  description: "updated template version",
})

templateVersionApi = TemplateVersionsApi.new(config)

begin
  updatedTemplateVersion = templateVersionApi.update("tmpl_c94e83ca2cd5121", "vrsn_534e339882d2282", templateVersionUpdatable)
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/templates/tmpl_4aa14648113e45b/versions \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Second Version" \
  --data-urlencode "html=<html>Second HTML for {{name}}</html>" \
```

```ruby
templateVersionCreate = TemplateVersionWritable.new({ 
  description: "Second Version",
  html: "<html>Second HTML for {{name}}</html>",
});

templateVersionApi = TemplateVersionsApi.new(config)

begin
  createdTemplateVersion = templateVersionApi.create("tmpl_4aa14648113e45b", templateVersionCreate)
rescue => err
  p err.message
end
```






## BillingGroups Api

### Retrieve
```bash
curl https://api.lob.com/v1/billing_groups/bg_4bb02b527a72667d0 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
billingGroupApi = BillingGroupsApi.new(config)

begin
  retrievedBillingGroup = billingGroupApi.get("bg_4bb02b527a72667d0")
rescue => err
  p err.message
end
```

### Retrieve
```bash
curl https://api.lob.com/v1/billing_groups/bg_4bb02b527a72667d0 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
billingGroupApi = BillingGroupsApi.new(config)

begin
  retrievedBillingGroup = billingGroupApi.get("bg_4bb02b527a72667d0")
rescue => err
  p err.message
end
```





### Create
```bash
curl https://api.lob.com/v1/billing_groups \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Usage group used for the Marketing Department's resource sends" \
  -d "name=Marketing Department" \
```

```ruby
bgCreate = BillingGroupEditable.new({ 
  description: "Usage group used for the Marketing Department's resource sends",
  name: "Marketing Department",
});

bgApi = BillingGroupsApi.new(config)

begin
  createdBillingGroup = bgApi.create(bgCreate)
rescue => err
  p err.message
end
```




### Update
```bash
curl -X PATCH https://api.lob.com/v1/bg_759954f540a1bfdb5 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=demo replacement" \
```

```ruby
billingGroupEditable = BillingGroupEditable.new({ 
  description: "demo replacement",
})

bgApi = BillingGroupsApi.new(config)

begin
  updatedBillingGroup = bgApi.update("bg_759954f540a1bfdb5", billingGroupEditable)
rescue => err
  p err.message
end
```





### List
```bash
curl -X GET "https://api.lob.com/v1/billing_groups?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
billingGroupsApi = BillingGroupsApi.new(config)

begin
  billingGroups = billingGroupsApi.list({ limit: 2 })
rescue => err
  p err.message
end
```



## Cards Api


### Retrieve
```bash
curl https://api.lob.com/v1/cards/card_7a6d73c5c8457fc \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
cardApi = CardsApi.new(config)

begin
  retrievedCard = cardApi.get("card_7a6d73c5c8457fc")
rescue => err
  p err.message
end
```








### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/cards/card_6afffd19045076c" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
cardApi = CardsApi.new(config)

begin
  deletedCard = cardApi.delete("card_6afffd19045076c")
rescue => err
  p err.message
end
```

### Create
```bash
curl https://api.lob.com/v1/cards \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "front=https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf" \
  -d "back=https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf" \
  -d "size=2.125x3.375" \
  -d "description=Test Card" \
```

```ruby
cardCreate = CardEditable.new({ 
  front: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf",
  back: "https://s3-us-west-2.amazonaws.com/public.lob.com/assets/card_horizontal.pdf",
  size: "2.125x3.375",
  description: "Test Card",
});

cardApi = CardsApi.new(config)

begin
  createdCard = cardApi.create(cardCreate)
rescue => err
  p err.message
end
```









### List
```bash
curl -X GET "https://api.lob.com/v1/cards?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
cardsApi = CardsApi.new(config)

begin
  cards = cardsApi.list({ limit: 2 })
rescue => err
  p err.message
end
```






### Update
```bash
curl -X PATCH https://api.lob.com/v1/card_6afffd19045076c \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Awesome card" \
  -d "auto_reorder=true" \
  -d "reorder_quantity=10000" \
```

```ruby
cardUpdatable = CardUpdatable.new({ 
  description: "Awesome card",
  auto_reorder: "true",
  reorder_quantity: 10000,
})

cardApi = CardsApi.new(config)

begin
  updatedCard = cardApi.update("card_6afffd19045076c", cardUpdatable)
rescue => err
  p err.message
end
```


## CardOrders Api



### Retrieve
```bash
curl https://api.lob.com/v1/cards/card_6afffd19045076c/orders/ \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
cardOrderApi = CardOrdersApi.new(config)

begin
  retrievedCardOrderList = cardOrderApi.get("card_6afffd19045076c", { limit: 2, offset: 1 })
rescue => err
  p err.message
end
```

### Create
```bash
curl https://api.lob.com/v1/cards/card_6afffd19045076c/orders \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "quantity=10000" \
```

```ruby
cardOrderCreate = CardOrderEditable.new({ 
  quantity: 10000,
});

cardOrderApi = CardOrdersApi.new(config)

begin
  createdCardOrder = cardOrderApi.create("card_6afffd19045076c", cardOrderCreate)
rescue => err
  p err.message
end
```





## Campaigns Api


### Retrieve
```bash
curl https://api.lob.com/v1/campaigns/cmp_e05ee61ff80764b \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
campaignApi = CampaignsApi.new(config)

begin
  retrievedCampaign = campaignApi.get("cmp_e05ee61ff80764b")
rescue => err
  p err.message
end
```








### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/campaigns/cmp_e05ee61ff80764b" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
campaignApi = CampaignsApi.new(config)

begin
  deletedCampaign = campaignApi.delete("cmp_e05ee61ff80764b")
rescue => err
  p err.message
end
```




### Update
```bash
curl -X PATCH https://api.lob.com/v1/cmp_e05ee61ff80764b \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Awesome campaign" \
```

```ruby
campaignUpdatable = CampaignUpdatable.new({ 
  description: "Awesome campaign",
})

campaignApi = CampaignsApi.new(config)

begin
  updatedCampaign = campaignApi.update("cmp_e05ee61ff80764b", campaignUpdatable)
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/campaigns \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "name=My First Campaign" \
  -d "schedule_type=immediate" \
```

```ruby
campaignCreate = CampaignWritable.new({ 
  name: "My First Campaign",
  schedule_type: "immediate",
});

campaignApi = CampaignsApi.new(config)

begin
  createdCampaign = campaignApi.create(campaignCreate)
rescue => err
  p err.message
end
```









### List
```bash
curl -X GET "https://api.lob.com/v1/campaigns?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
campaignsApi = CampaignsApi.new(config)

begin
  campaigns = campaignsApi.list({ limit: 2 })
rescue => err
  p err.message
end
```



## Creatives Api



### Update
```bash
curl -X PATCH https://api.lob.com/v1/crv_2a3b096c409b32c \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "description=Our updated 4x6 postcard creative" \
```

```ruby
creativePatch = CreativePatch.new({ 
  description: "Our updated 4x6 postcard creative",
})

creativeApi = CreativesApi.new(config)

begin
  updatedCreative = creativeApi.update("crv_2a3b096c409b32c", creativePatch)
rescue => err
  p err.message
end
```


### Retrieve
```bash
curl https://api.lob.com/v1/creatives/crv_2a3b096c409b32c \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
creativeApi = CreativesApi.new(config)

begin
  retrievedCreative = creativeApi.get("crv_2a3b096c409b32c")
rescue => err
  p err.message
end
```


### Create
```bash
curl https://api.lob.com/v1/creatives \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "campaign_id=cmp_e05ee61ff80764b" \
  -d "resource_type=postcard" \
  -d "description=Our 4x6 postcard creative" \
  -d "from=adr_210a8d4b0b76d77b" \
  -d "front=tmpl_4aa14648113e45b" \
  -d "back=tmpl_4aa14648113e45b" \
  -d "details[mail_type]=usps_first_class" \
```

```ruby
creativeCreate = CreativeWritable.new({ 
  campaign_id: "cmp_e05ee61ff80764b",
  resource_type: "postcard",
  description: "Our 4x6 postcard creative",
  from: "adr_210a8d4b0b76d77b",
  front: "tmpl_4aa14648113e45b",
  back: "tmpl_4aa14648113e45b",
  details: PostcardDetailsWritable.new({ 
    mail_type: "usps_first_class",
  }),
});

creativeApi = CreativesApi.new(config)

begin
  createdCreative = creativeApi.create(creativeCreate)
rescue => err
  p err.message
end
```





## Uploads Api

### List
```bash
curl -X GET "https://api.lob.com/v1/?limit=2" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
uploadsApi = UploadsApi.new(config)

begin
  uploads = uploadsApi.list_upload({ campaign_id: "cmp_e05ee61ff80764b" })
rescue => err
  p err.message
end
```

### Retrieve Export
```bash
curl https://api.lob.com/v1/uploads/upl_71be866e430b11e9/exports/ex_6a94fe68fd151e0f8 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "type=failures"
```

```ruby
uploadsApi = UploadsApi.new(config)

begin
  retrievedExport = uploadsApi.get_export("upl_71be866e430b11e9", "ex_6a94fe68fd151e0f8")
rescue => err
  p err.message
end
```








### Upload File

```bash
curl -X POST https://api.lob.com/v1/uploads/upl_71be866e430b11e9/file \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -F file=@<YOUR_FILE_NAME_HERE>
```

```ruby
# to come
```


### Retrieve
```bash
curl https://api.lob.com/v1/uploads/upl_71be866e430b11e9 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
uploadApi = UploadsApi.new(config)

begin
  retrievedUpload = uploadApi.get_upload("upl_71be866e430b11e9")
rescue => err
  p err.message
end
```





### Create Export
```bash
curl https://api.lob.com/v1/uploads/upl_71be866e430b11e9/exports \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "type=failures"
```

```ruby
exportModel = ExportModel.new({
  type: "all"
})

uploadsApi = UploadsApi.new(config)

begin
  createdExport = uploadsApi.create_export("upl_71be866e430b11e9", exportModel)
rescue => err
  p err.message
end
```



### Update
```bash
curl -X PATCH https://api.lob.com/v1/upl_71be866e430b11e9 \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
```

```ruby
uploadUpdatable = UploadUpdatable.new({ 
  required_address_column_mapping: RequiredAddressColumnMapping.new({ 
    name: "recipient",
    address_line1: "primary line",
    address_city: "city",
    address_state: "state",
    address_zip: "zip_code",
  }),
})

uploadApi = UploadsApi.new(config)

begin
  updatedUpload = uploadApi.update_upload("upl_71be866e430b11e9", uploadUpdatable)
rescue => err
  p err.message
end
```

### Create
```bash
curl https://api.lob.com/v1/uploads \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "campaignId=cmp_e05ee61ff80764b" \
```

```ruby
uploadCreate = UploadWritable.new({ 
  campaign_id: "cmp_e05ee61ff80764b",
});

uploadApi = UploadsApi.new(config)

begin
  createdUpload = uploadApi.create_upload(uploadCreate)
rescue => err
  p err.message
end
```






### Delete
```bash
curl -X DELETE "https://api.lob.com/v1/uploads/upl_71be866e430b11e9" \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc:
```

```ruby
uploadApi = UploadsApi.new(config)

begin
  deletedUpload = uploadApi.delete_upload("upl_71be866e430b11e9")
rescue => err
  p err.message
end
```

## ZipLookups Api

### ZipLookup
```bash
curl https://api.lob.com/v1/us_zip_lookups \
  -u test_0dc8d51e0acffcb1880e0f19c79b2f5b0cc: \
  -d "zip_code=94107"
```

```ruby
zipLookupsApi = ZipLookupsApi.new(config)

zipRequest = ZipEditable.new({
  zip_code: "94107"
})

begin
  zipLookup = zipLookupsApi.lookup(zipRequest)
rescue => err
  p err.message
end
```

## Reverse Geocode Lookups Api

### Reverse Geocode Lookup
```bash
curl https://api.lob.com/v1/us_reverse_geocode_lookups \
  -u <YOUR_LIVE_API_KEY>: \
```

```ruby
reverseGeocodeLookupsApi = ReverseGeocodeLookupsApi.new(config)

coordinates = Location.new({ 
  latitude: 37.777456,
  longitude: -122.393039,
})

begin
  geocode = reverseGeocodeLookupsApi.lookup(coordinates)
rescue => err
  p err.message
end
```

## USAutoCompletions Api

### Autocomplete
```bash
curl https://api.lob.com/v1/us_autocompletions \
  -u <YOUR_LIVE_API_KEY>: \
  -d "address_prefix=185 B" \
  -d "city=San Francisco" \
  -d "state=CA" \
  -d "zip_code=94017" \
```

```ruby
usAutocompletionsApi = UsAutocompletionsApi.new(config)

autocompletionData = UsAutocompletionsWritable.new({ 
  address_prefix: "185 B",
  city: "San Francisco",
  state: "CA",
  zip_code: "94017",
})

begin
  autocompletedAddress = usAutocompletionsApi.autocomplete(autocompletionData)
rescue => err
  p err.message
end
```

## UsVerifications Api

### Bulk Verify
```bash
curl https://api.lob.com/v1/bulk/us_verifications \
  -u <YOUR LIVE API KEY>: \
  --header "Content-Type: application/x-www-form-urlencoded" \
  --data-urlencode "addresses[0][primary_line]=2261 Market Street" \
  --data-urlencode "addresses[0][city]=San Francisco" \
  --data-urlencode "addresses[0][state]=CA" \
  --data-urlencode "addresses[0][zip_code]=94114" \
  --data-urlencode "addresses[1][primary_line]=185 BERRY ST STE 6600" \
  --data-urlencode "addresses[1][city]=SAN FRANCISCO" \
  --data-urlencode "addresses[1][state]=CA" \
  --data-urlencode "addresses[1][zip_code]=94017" \
```

```ruby
usVerificationsApi = UsVerificationsApi.new(config)


verificationData0 = MultipleComponents.new({ 
  primary_line: "2261 Market Street",
  city: "San Francisco",
  state: "CA",
  zip_code: "94114",
})

verificationData1 = MultipleComponents.new({ 
  primary_line: "185 BERRY ST STE 6600",
  city: "SAN FRANCISCO",
  state: "CA",
  zip_code: "94017",
})


addressList = MultipleComponentsList.new({
  addresses: [
    verificationData0,
    verificationData1,
  ],
})

begin
  bulkVerifiedAddrs = usVerificationsApi.verifyBulk(addressList)
rescue => err
  p err.message
end
```

### Single Verify
```bash
curl https://api.lob.com/v1/us_verifications \
  -u <YOUR_LIVE_API_KEY>: \
  -d "primary_line=2261 Market Street" \
  -d "city=San Francisco" \
  -d "state=CA" \
  -d "zip_code=94114" \
```

```ruby
usVerificationsApi = UsVerificationsApi.new(config)

verificationData = UsVerificationsWritable.new({ 
  primary_line: "2261 Market Street",
  city: "San Francisco",
  state: "CA",
  zip_code: "94114",
})

begin
  singleVerifiedAddr = usVerificationsApi.verifySingle(verificationData)
rescue => err
  p err.message
end
```

## IntlAutocompletion Api

### IntlAutocompletion
```bash
curl https://api.lob.com/v1/intl_autocompletions \
  -u <YOUR_LIVE_API_KEY>: \
  -d "address_prefix=340 Wat" \
  -d "city=Summerside" \
  -d "state=Prince Edward Island" \
  -d "zip_code=C1N 1C4" \
  -d "country=CA" \
```

```ruby
intlAutocompletionsApi = IntlAutocompletionsApi.new(config)

autocompletionData = IntlAutocompletionsWritable.new({ 
  address_prefix: "340 Wat",
  city: "Summerside",
  state: "Prince Edward Island",
  zip_code: "C1N 1C4",
  country: CountryExtended::CA,
})

begin
  autocompletedAddr = intlAutocompletionsApi.autocomplete(autocompletionData)
rescue => err
  p err.message
end
```

## IntlVerifications Api

### Single Verify
```bash
curl https://api.lob.com/v1/intl_verifications \
  -u <YOUR_LIVE_API_KEY>: \
  -d "primary_line=370 Water St" \
  -d "city=Summerside" \
  -d "state=Prince Edward Island" \
  -d "postal_code=C1N 1C4" \
  -d "country=CA" \
```

```ruby
intlVerificationsApi = IntlVerificationsApi.new(config)

verificationData = IntlVerificationWritable.new({ 
  primary_line: "370 Water St",
  city: "Summerside",
  state: "Prince Edward Island",
  postal_code: "C1N 1C4",
  country: CountryExtended::CA,
})

begin
  verifiedAddr = intlVerificationsApi.verifySingle(verificationData)
rescue => err
  p err.message
end
```

### Bulk Verify
```bash
curl https://api.lob.com/v1/bulk/intl_verifications \
  -u <YOUR LIVE API KEY>: \
  --header 'Content-Type: application/x-www-form-urlencoded' \
  --data-urlencode 'addresses[0][primary_line]=35 Tower Hill' \
  --data-urlencode 'addresses[0][city]=London' \
  --data-urlencode 'addresses[0][postal_code]=EC3N 4DR' \
  --data-urlencode 'addresses[0][country]=GB' \
  --data-urlencode 'addresses[1][primary_line]=370 Water St' \
  --data-urlencode 'addresses[1][city]=Summerside' \
  --data-urlencode 'addresses[1][state]=Prince Edward Island' \
  --data-urlencode 'addresses[1][postal_code]=C1N 1C4' \
  --data-urlencode 'addresses[1][country]=CA' \
```

```ruby
intlVerificationsApi = IntlVerificationsApi.new(config)

verificationData0 = MultipleComponentsIntl.new({ 
  primary_line: "35 Tower Hill",
  city: "London",
  postal_code: "EC3N 4DR",
  country: "GB",
})

verificationData1 = MultipleComponentsIntl.new({ 
  primary_line: "370 Water St",
  city: "Summerside",
  state: "Prince Edward Island",
  postal_code: "C1N 1C4",
  country: "CA",
})


addressList = IntlVerificationsPayload.new({
  addresses: [
    verificationData0,
    verificationData1,
  ],
})

begin
  bulkVerifiedAddrs = intlVerificationsApi.verifyBulk(addressList)
rescue => err
  p err.message
end
```

