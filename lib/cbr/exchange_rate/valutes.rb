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
        valutes = []
        response['ValCurs']['Valute'].each do |valute|
          valutes << Valute.new(valute)
        end
        valutes
      end
    end
  end
end
