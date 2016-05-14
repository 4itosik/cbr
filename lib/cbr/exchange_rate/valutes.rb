module Cbr
  class ExchangeRate
    module Valutes
      def valutes
        get_valutes
      end

      private

      def get_valutes
        @valutes ||= generate_valutes
      end

      def generate_valutes
        response['ValCurs']['Valute'].map(& -> (valute) { Valute.new(valute) } )
      end
    end
  end
end
