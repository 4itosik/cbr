# Cbr

[![Build Status](https://travis-ci.org/4itosik/cbr.svg?branch=master)](https://travis-ci.org/4itosik/cbr)

Gem for get exchange rates from cbr.ru

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cbr', github: '4itosik/cbr', branch: 'master'
```

And then execute:

    $ bundle

## Usage

```
cbr = Cbr::ExchangeRate.new(date)

valutes = cbr.valutes
```

return all valutes

default ```date = Time.now```.

You can get valute by Char Code, example

```
  valute = Cbr::ExchangeRate.new.usd
```

Get list char codes, use

```
  Cbr::ExchangeRate.new.char_codes
```

Use method ```rate``` for Valute instanse, this method return rate for 1 nominal

Full example

```
  usd_rate = Cbr::ExchangeRate.new.usd.rate
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cbr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
