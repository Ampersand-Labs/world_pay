# WorldPayApi

Gem for consuming the World Pay API

Currently working:
* Create customer
* Get customer


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'world_pay_api'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install world_pay_api

## Usage

Checkout the rspec tests for better documentation

### Examples
```ruby
  @service = WorldPayApi::Client.new :sandbox, secure_key # :sandbox or :live
  
  @service.customer.find 1 # find customer with id 1


```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
