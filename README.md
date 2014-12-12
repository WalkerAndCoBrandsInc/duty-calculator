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

### Listing Categories

```ruby
2.1.2 :008 > DutyCalculator::Category.list_all
 => #<Faraday::Response:0x007ff08468e990 @on_complete_callbacks=[], @env=#<Faraday::Env @method=:get @body={"categories"=>{"category"=>{"name"=>"Health & Beauty", "id"=>"L1-84", "subcategory"=>{"name"=>"Bath & Shower", "id"=>"L2-278", "item"=>[{"id"=>"522", "__content__"=>"Hydrotherapy Spa Bath"}, {"id"=>"540", "__content__"=>"Soap in bars"}, {"id"=>"541", "__content__"=>"Soap in liquid or cream"}, {"id"=>"2464", "__content__"=>"Soap in bars | castile soap"}, {"id"=>"2465", "__content__"=>"Soap in liquid or cream | containing aromatic surface-active agent"}, {"id"=>"3134", "__content__"=>"Bath Salts"}, {"id"=>"3178", "__content__"=>"Hand, Body or Face Wipes"}, {"id"=>"3682", "__content__"=>"Soap or Lotion Pump"}, {"id"=>"5538", "__content__"=>"Bath or Cosmetic Set"}, {"id"=>"6824", "__content__"=>"Sponge | natural"}]}}}} @url=#<URI::HTTP:0x007ff084684a08 URL:http://www.dutycalculator.com/api2.1/sandbox/319c208413770277/categories> @request=#<Faraday::RequestOptions (empty)> @request_headers={"User-Agent"=>"Faraday v0.9.0"} @ssl=#<Faraday::SSLOptions (empty)> @response_headers={"server"=>"nginx/1.6.1", "date"=>"Fri, 12 Dec 2014 00:02:21 GMT", "content-type"=>"application/xml", "transfer-encoding"=>"chunked", "connection"=>"close", "x-powered-by"=>"PHP/5.5.9-1ubuntu4.4", "set-cookie"=>"DebugLevel=0; expires=Sun, 11-Jan-2015 00:05:01 GMT; Max-Age=2592000; path=/, PHPSESSID=071egvffhc5gb2eka0kd70m677; path=/", "expires"=>"Thu, 19 Nov 1981 08:52:00 GMT", "cache-control"=>"no-store, no-cache, must-revalidate, post-check=0, pre-check=0", "pragma"=>"no-cache"} @status=200>>
```

### Listing Currencies

```ruby
2.1.2 :009 > DutyCalculator::Currency.list_all
 => #<Faraday::Response:0x007ff084d5a850 @on_complete_callbacks=[], @env=#<Faraday::Env @method=:get @body={"currencies"=>{"currency"=>[{"code"=>"EUR", "__content__"=>"Euro "}, {"code"=>"GBP", "__content__"=>"£ Sterling"}, {"code"=>"USD", "__content__"=>"US Dollar "}, {"code"=>"AUD", "__content__"=>"Australian Dollar "}, {"code"=>"BSD", "__content__"=>"Bahamian Dollar"}, {"code"=>"PAB", "__content__"=>"Balboa"}, {"code"=>"BDT", "__content__"=>"Bangladeshi taka"}, {"code"=>"BBD", "__content__"=>"Barbadian Dollar"}, {"code"=>"BZD", "__content__"=>"Belize Dollar"}, {"code"=>"BMD", "__content__"=>"Bermudian Dollar"}, {"code"=>"BWP", "__content__"=>"Botswana Pula"}, {"code"=>"BRL", "__content__"=>"Brazilian Real "}, {"code"=>"BGN", "__content__"=>"Bulgarian Lev"}, {"code"=>"CAD", "__content__"=>"Canadian Dollar"}, {"code"=>"KYD", "__content__"=>"Cayman Islands Dollar"}, {"code"=>"CNY", "__content__"=>"Chinese Yuan"}, {"code"=>"COP", "__content__"=>"Colombian Peso"}, {"code"=>"CRC", "__content__"=>"Costa Rican colón"}, {"code"=>"HRK", "__content__"=>"Croatian Kuna"}, {"code"=>"CZK", "__content__"=>"Czech Koruna"}, {"code"=>"DKK", "__content__"=>"Danish Krone"}, {"code"=>"DOP", "__content__"=>"Dominican peso"}, {"code"=>"XCD", "__content__"=>"East Caribbean Dollar"}, {"code"=>"EGP", "__content__"=>"Egyptian Pound"}, {"code"=>"AED", "__content__"=>"Emirati dirham"}, {"code"=>"GIP", "__content__"=>"Gibraltar Pound"}, {"code"=>"GTQ", "__content__"=>"Guatemalan quetzal"}, {"code"=>"GGP", "__content__"=>"Guernsey Pound"}, {"code"=>"GYD", "__content__"=>"Guyanese Dollar"}, {"code"=>"HTG", "__content__"=>"Haitian Gourde"}, {"code"=>"HKD", "__content__"=>"Hong Kong Dollar "}, {"code"=>"HUF", "__content__"=>"Hungarian Forint"}, {"code"=>"INR", "__content__"=>"Indian Rupee (Ngultrum) "}, {"code"=>"IDR", "__content__"=>"Indonesian Rupiah"}, {"code"=>"ILS", "__content__"=>"Israeli Sheqel"}, {"code"=>"JMD", "__content__"=>"Jamaican Dollar"}, {"code"=>"JPY", "__content__"=>"Japanese Yen"}, {"code"=>"JEP", "__content__"=>"Jersey Pound"}, {"code"=>"JOD", "__content__"=>"Jordanian Dinar"}, {"code"=>"KWD", "__content__"=>"Kuwaiti dinar"}, {"code"=>"LSL", "__content__"=>"Lesotho Loti"}, {"code"=>"LTL", "__content__"=>"Lithuanian Litas"}, {"code"=>"MOP", "__content__"=>"Macanese pataca"}, {"code"=>"MYR", "__content__"=>"Malaysian ringgit"}, {"code"=>"MXN", "__content__"=>"Mexican Peso"}, {"code"=>"MAD", "__content__"=>"Moroccan Dirham"}, {"code"=>"NAD", "__content__"=>"Namibian Dollar"}, {"code"=>"TWD", "__content__"=>"New Taiwan dollar"}, {"code"=>"NZD", "__content__"=>"New Zealand Dollar "}, {"code"=>"NGN", "__content__"=>"Nigerian naira"}, {"code"=>"NOK", "__content__"=>"Norwegian Krone"}, {"code"=>"PKR", "__content__"=>"Pakistan Rupee"}, {"code"=>"PYG", "__content__"=>"Paraguayan Guaraní"}, {"code"=>"PHP", "__content__"=>"Philippine Peso"}, {"code"=>"PLN", "__content__"=>"Polish Zloty"}, {"code"=>"RON", "__content__"=>"Romanian New Leu"}, {"code"=>"RUB", "__content__"=>"Russian Rouble "}, {"code"=>"SAR", "__content__"=>"Saudi Arabian Riyal"}, {"code"=>"RSD", "__content__"=>"Serbian Dinar"}, {"code"=>"SGD", "__content__"=>"Singapore Dollar "}, {"code"=>"ZAR", "__content__"=>"South African Rand "}, {"code"=>"KRW", "__content__"=>"South Korean Won"}, {"code"=>"LKR", "__content__"=>"Sri Lankan rupee"}, {"code"=>"SRD", "__content__"=>"Surinamese Dollar"}, {"code"=>"SZL", "__content__"=>"Swazi Lilangeni"}, {"code"=>"SEK", "__content__"=>"Swedish Krona"}, {"code"=>"CHF", "__content__"=>"Swiss Franc"}, {"code"=>"THB", "__content__"=>"Thai Baht "}, {"code"=>"TTD", "__content__"=>"Trinidad and Tobago Dollar"}, {"code"=>"TRL", "__content__"=>"Turkish Lira "}, {"code"=>"TRY", "__content__"=>"Turkish lira"}, {"code"=>"UYU", "__content__"=>"Uruguayan Peso"}]}} @url=#<URI::HTTP:0x007ff087041d28 URL:http://www.dutycalculator.com/api2.1/sandbox/319c208413770277/supported-currencies> @request=#<Faraday::RequestOptions (empty)> @request_headers={"User-Agent"=>"Faraday v0.9.0"} @ssl=#<Faraday::SSLOptions (empty)> @response_headers={"server"=>"nginx/1.6.1", "date"=>"Fri, 12 Dec 2014 00:03:46 GMT", "content-type"=>"application/xml", "transfer-encoding"=>"chunked", "connection"=>"close", "x-powered-by"=>"PHP/5.5.9-1ubuntu4.4", "set-cookie"=>"DebugLevel=0; expires=Sun, 11-Jan-2015 00:06:29 GMT; Max-Age=2592000; path=/, PHPSESSID=su1qkdhete6lt6ts2j0u4r6hh0; path=/", "expires"=>"Thu, 19 Nov 1981 08:52:00 GMT", "cache-control"=>"no-store, no-cache, must-revalidate, post-check=0, pre-check=0", "pragma"=>"no-cache"} @status=200>>
 ```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/duty_calculator/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
