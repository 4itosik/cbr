require 'cbr/exchange_rate/valutes'
require 'cbr/exchange_rate/char_codes'

module Cbr
  class ExchangeRate
    include HTTParty
    include Cbr::ExchangeRate::Valutes
    include Cbr::ExchangeRate::CharCodes

    base_uri 'http://www.cbr.ru/scripts/XML_daily'

    attr_reader :date, :response

    def initialize(date = Time.now)
      custrom_date = date.class == String ? Date.parse(date) : date
      response = self.class.get ".asp?date_req=#{custrom_date.strftime('%d.%m.%Y')}"
      @date = response['ValCurs']['Date']
      @response = response
    end
  end
end
