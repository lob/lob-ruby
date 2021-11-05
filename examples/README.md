# Ruby Examples

Here we have put together a handful of ruby examples to help get you started. Please read through the official [API Documentation](https://docs.lob.com) to get a complete sense of what to expect from each endpoint. As always, feel free to [contact us](https://lob.com/support) directly if you have any questions on implementation.

To run these example commands, make sure you have a supported version of Ruby installed, including all the necessary gems.

## [/csv_checks/](./csv_checks/)

An example showing how to dynamically create checks from a CSV using HTML, merge variables, and Lob's [Checks API](https://lob.com/services/checks).

```
bundle exec ruby examples/csv_checks/create_checks.rb
```

## [/csv_letters/](./csv_letters/)

An example showing how to dynamically create letters from a CSV using HTML, a custom font, merge variables, and Lob's [Letters API](https://lob.com/services/letters).

```
bundle exec ruby examples/csv_letters/create_letters.rb
```

## [/csv_postcards/](./csv_postcards/)

An example showing how to dynamically create postcards from a CSV using HTML, a custom font, merge variables, and Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/csv_postcards/create_postcards.rb
```

## [/csv_verify/](./csv_verify/)

An example showing how to validate and cleanse a CSV spreadsheet full of shipping addresses using Lob's [US Verification API](https://lob.com/services/verifications).
  		  
Please note that if you are running this with a Test API Key, the verification API will always return [a dummy address](https://docs.lob.com/#section/US-Verifications-Test-Env).

```
bundle exec ruby examples/csv_verify/verify.rb
```

## [/checks.rb](./checks.rb)

An example showing how to create a check using Lob's [Checks API](https://lob.com/services/checks).

```
bundle exec ruby examples/checks.rb
```

## [/letters.rb](./letters.rb)

An example showing how to create a letter using Lob's [Letters API](https://lob.com/services/letters).

```
bundle exec ruby examples/letters.rb
```

## [/postcards.rb](./postcards.rb)

An example showing how to create a postcard using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards.rb
```

## [/postcards_idempotent.rb](./postcards_idempotent.rb)

An example showing how to create an idempotent postcard request using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards_idempotent.rb
```

## [/postcards_intl.rb](./postcards_intl.rb)

An example showing how to create an international postcard using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards_intl.rb
```

## [/postcards_remote.rb](./postcards_remote.rb)

An example showing how to create a postcard with remote files, using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards_remote.rb
```

## [/postcards_send_date.rb](./postcards_send_date.rb)

An example showing how to create a postcard with a specified send date, using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards_send_date.rb
```

## [/postcards_template.rb](./postcards_template.rb)

An example showing how to create a postcard with a saved template, using Lob's [Postcards API](https://lob.com/services/postcards).

```
bundle exec ruby examples/postcards_template.rb
```

## [/self_mailers.rb](./self_mailers.rb)

An example showing how to create a self mailer using Lob's Self Mailers API.

```
bundle exec ruby examples/self_mailers.rb
```
