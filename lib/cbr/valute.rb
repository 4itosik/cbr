module Cbr
  class Valute
    attr_reader :id, :num_code, :char_code, :nominal, :name, :value

    SKIP_ATTRIBUTES = ['vunitrate'].freeze

    def initialize(attributes = {})
      attributes.each do |name, value|
        next if SKIP_ATTRIBUTES.include?(name.downcase)

        case name.downcase
        when 'numcode'
          @num_code = value
        when 'charcode'
          @char_code = value
        when 'value'
          @value = value.tr(',', '.').to_f
        else
          send("#{name.downcase}=", value)
        end
      end
    end

    def char_code_for_array
      char_code.downcase.to_sym
    end

    def rate
      value / nominal.to_f
    end

    private

    attr_writer :id, :num_code, :char_code, :nominal, :name, :value
  end
end
