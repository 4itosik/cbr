module Cbr
  class ExchangeRate
    module CharCodes
      def char_codes
        valutes.map(&:char_code_for_array)
      end

      def method_missing(name, *args, &block)
        if char_codes.include?(name)
          valutes.each do |valute|
            return valute if valute.char_code_for_array == name
          end
        else
          super
        end
      end
    end
  end
end
