require 'cbr/exchange_rate/valutes'

module Cbr
  class ExchangeRate
    include HTTParty
    include Cbr::ExchangeRate::Valutes

    base_uri 'http://www.cbr.ru/scripts/XML_daily'

    attr_reader :date, :response

    def initialize(date = Time.now)
      date = date.class == String ? Date.parse(date) : date
      response = self.class.get ".asp?date_req=#{date.strftime('%d.%m.%Y')}"
      @date = response['ValCurs']['Date']
      @response = response
    end
  end
end
