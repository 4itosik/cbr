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
    subject { Cbr::ExchangeRate.new(date: '18.12.2015') }

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
    exchange_rate = Cbr::ExchangeRate.new(date: '18.12.2015')
    expect(exchange_rate.response.body).to eq response
  end

  context '#valutes' do
    subject { Cbr::ExchangeRate.new.valutes }

    it 'return valutes array' do
      expect(subject.size).to eq 2
    end

    it 'should return currect values array' do
      expect(subject.map(&:value)).to match_array([50.8180, 38.8356])
    end
  end

  context 'char_code return valute' do
    subject { Cbr::ExchangeRate.new }

    context 'correct char_code' do
      it 'should return Australian Dollar with value 50,8180' do
        expect(subject.aud.value).to eq 50.8180
      end

      it 'should return Australian Dollar' do
        expect(subject.aud.name).to eq 'Australian Dollar'
      end

      it 'should return rate for byr' do
        expect(subject.byr.rate).to eq 0.00388356
      end
    end

    context 'in correct char_code' do
      it 'should return error' do
        expect { subject.eur.name }.to raise_error { |error|
          expect(error).to be_a(NoMethodError)
        }
      end
    end
  end

  context '#char_codes' do
    subject { Cbr::ExchangeRate.new }

    it 'should return active char codes' do
      expect(subject.char_codes).to match_array([:aud, :byr])
    end
  end

  context 'en locale' do
    subject { Cbr::ExchangeRate.new(locale: :en) }

    it 'should return Australian Dollar with value 50,8180' do
      expect(subject.aud.value).to eq 50.8180
    end

    it 'should return Australian Dollar' do
      expect(subject.aud.name).to eq 'Australian Dollar'
    end
  end
end
