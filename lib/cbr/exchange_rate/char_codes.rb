module Cbr
  class ExchangeRate
    module CharCodes
      def char_codes
        valutes.map(&:char_code_for_array)
      end

      def method_missing(name, *args, &block)
        super unless char_codes.include?(name)

        valutes.find { |valute| valute.char_code_for_array == name }
      end
    end
  end
end
