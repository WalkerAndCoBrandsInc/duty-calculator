![Travis CI](https://travis-ci.org/WalkerAndCoBrandsInc/duty-calculator.svg?branch=develop)
# DutyCalculator

TODO: Write a gem description

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'duty_calculator'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install duty_calculator

## Usage

### Initializer

If using rails you can create an initializer that sets the configuration for the client.

```ruby
DutyCalculator.configure do |config|
  config.api_key = '###############'
  # optional default overrides
  config.api_root = 'http://something.com'
  config.api_version = 'v3.0'
  config.sandbox = true
  config.debug = true
end

```

### Get Calculation

```
duty_calculation = DutyCalculator::Calculation.get(params)

0> duty_calculation.keys
=> ["id", "item", "total_charges"]

0> duty_calculation.total_charges.keys
=> ["customs_value", "duty", "sales_tax", "total"]

0> duty_calculation.total_charges.customs_value
=> #<Hashie::Mash amount=#<Hashie::Mash currency="CAD" value=1556.0> name="FOB">

0> duty_calculation.total_charges.sales_tax
=> #<Hashie::Mash amount=#<Hashie::Mash currency="CAD" value=77.8> name="GST">

0> duty_calculation.total_charges.duty
=> #<Hashie::Mash amount=#<Hashie::Mash currency="CAD" value=0.0>>

0> duty_calculation.total_charges.total
=> #<Hashie::Mash amount=#<Hashie::Mash currency="CAD" value=77.8>>

```

### Listing Categories

```ruby
2.1.2 :008 > DutyCalculator::Category.list_all
{
  "categories"=>{
    "category"=>{
      "name"=>"Health & Beauty",
      "id"=>"L1-84",
      "subcategory"=>{
        "name"=>"Bath & Shower",
        "id"=>"L2-278",
        "item"=>[
          {
            "id"=>"522",
            "__content__"=>"Hydrotherapy Spa Bath"
          },
          ...
        ]
      }
    }
  }
}
```

### Listing Currencies

```ruby
2.1.2 :009 > DutyCalculator::Currency.list_all
 {
   "currencies"=>{
     "currency"=>[
       {
         "code"=>"EUR",
         "__content__"=>"Euro "
       },
       {
         "code"=>"GBP",
         "__content__"=>"£ Sterling"
       },
       ...
     ]
   }
 }
```

## TODO

- Port other objects to response nicer objects with `Hashie::Mash`
- Coerce sub `Array` for `item` to use `Response` object

## Contributing

1. Fork it ( https://github.com/[my-github-username]/duty_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
