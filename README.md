# Cbr

[![Build Status](https://travis-ci.org/4itosik/cbr.svg?branch=master)](https://travis-ci.org/4itosik/cbr)

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/cbr`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cbr'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install cbr

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

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release` to create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

1. Fork it ( https://github.com/[my-github-username]/cbr/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
