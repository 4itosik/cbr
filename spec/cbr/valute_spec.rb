require 'spec_helper'

describe Cbr::Valute do
  let(:valute) do
    Cbr::Valute.new(
      id: 'R01010',
      num_code: '036',
      char_code: 'TEST',
      nominal: '100',
      name: 'TEST VALUTE',
      value: 500.8
    )
  end

  it 'should return calculate rate' do
    expect(valute.rate).to eq 5.008
  end
end
