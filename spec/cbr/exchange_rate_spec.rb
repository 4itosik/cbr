require 'spec_helper'

describe Cbr::ExchangeRate do
  let(:response) do
    '<ValCurs Date="18.12.2015" name="Foreign Currency Market">'\
      '<Valute ID="R01010">'\
        '<NumCode>036</NumCode><CharCode>AUD</CharCode><Nominal>1</Nominal>'\
        '<Name>Australian Dollar</Name><Value>50,8180</Value>'\
      '</Valute>'\
      '<Valute ID="R01090">'\
        '<NumCode>974</NumCode><CharCode>BYR</CharCode><Nominal>10000</Nominal>'\
        '<Name>Belarussian Ruble</Name><Value>38,8356</Value>'\
      '</Valute>'\
    '</ValCurs>'
  end

  let(:headers) do
    {
      'server' => ['nginx/1.4.6 (Ubuntu)'], 'date' => ['Sun, 20 Dec 2015 11:08:38 GMT'],
      'content-type' => ['text/xml'], 'transfer-encoding' => ['chunked'],
      'connection' => ['close'], 'cache-control' => ['private'], 'x-powered-by' => ['ASP.NET']
    }
  end

  before do
    stub_request(:get, /cbr.ru/).to_return(status: 200, body: response, headers: headers)
  end

  context 'with date' do
    subject { Cbr::ExchangeRate.new('18.12.2015') }

    it 'should return request date' do
      expect(subject.date).to eq '18.12.2015'
    end
  end

  context 'with default date' do
    subject { Cbr::ExchangeRate.new }

    it 'should return request date' do
      expect(subject.date).to eq '18.12.2015'
    end
  end

  it 'should return response' do
    exchange_rate = Cbr::ExchangeRate.new('18.12.2015')
    expect(exchange_rate.response.body).to eq response
  end

  context 'valutes' do
    subject { Cbr::ExchangeRate.new.valutes }

    it 'return valutes array' do
      expect(subject.size).to eq 2
    end

    it 'should return currect values array' do
      expect(subject.map(&:value)).to match_array([50.8180, 38.8356])
    end
  end
end
