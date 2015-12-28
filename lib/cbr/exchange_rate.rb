require 'cbr/exchange_rate/valutes'
require 'cbr/exchange_rate/char_codes'

module Cbr
  class ExchangeRate
    include HTTParty
    include Cbr::ExchangeRate::Valutes
    include Cbr::ExchangeRate::CharCodes

    base_uri 'http://www.cbr.ru/scripts/XML_daily'

    attr_reader :date, :response

    def initialize(options = {})
      date = options[:date] || Time.now
      custrom_date = date.class == String ? Date.parse(date) : date
      locale = options[:locale] || :ru
      update_url = locale == :en ? '_eng' : ''
      response = self.class.get "#{update_url}.asp?date_req=#{custrom_date.strftime('%d.%m.%Y')}"
      @date = response['ValCurs']['Date']
      @response = response
    end
  end
end
