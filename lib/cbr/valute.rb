module Cbr
  class Valute
    attr_reader :id, :num_code, :char_code, :nominal, :name, :value

    def initialize(attributes = {})
      attributes.each do |name, value|
        name = name.downcase
        if name == 'numcode'
          @num_code = value
        elsif name == 'charcode'
          @char_code = value
        elsif name == 'value'
          @value = value.tr(',', '.').to_f
        else
          send("#{name.downcase}=", value)
        end
      end
    end

    private

    attr_writer :id, :num_code, :char_code, :nominal, :name, :value
  end
end
