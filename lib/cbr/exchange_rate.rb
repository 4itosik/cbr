module Cbr
  class ExchangeRate
    include HTTParty

    base_uri 'http://www.cbr.ru/scripts/XML_daily'
  end
end
