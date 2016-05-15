module Cbr
  class ExchangeRate
    module Valutes
      def valutes
        current_valutes
      end

      private

      def current_valutes
        @valutes ||= generate_valutes
      end

      def generate_valutes
        response['ValCurs']['Valute'].map(& -> (valute) { Valute.new(valute) })
      end
    end
  end
end
