require 'spec_helper'

describe Cbr::Valute do
  let(:valute) do
    Cbr::Valute.new(
      "ID" => 'R01010',
      "NumCode" => '036',
      "CharCode" => 'TEST',
      "Nominal" => '100',
      "Name" => 'TEST VALUTE',
      "Value" => '500,8',
      "VunitRate" => '5,008'
    )
  end

  it 'should return calculate rate' do
    expect(valute.rate).to eq 5.008
  end
end
