require 'spec_helper'

describe Fixy::Formatter::Date do
  let(:proxy) do
    Class.new {
      def line_ending; end

      def date_format
        '%d / %m / %Y'
      end
      include Fixy::Formatter::Date
    }.new
  end

  let(:format) { -> (input, bytes) { proxy.format_date input, bytes } }

  it 'format dates' do
    expect(format[Date.new(2016, 4, 13), 14]).to eq('13 / 04 / 2016')
  end

  it 'coerces non-date values' do
    expect(format['wtf', 9]).to eq('         ')
    expect(format[413, 12]).to eq('            ')
  end

  it 'rejects nil values' do
    expect { format[nil, 14] }.to raise_error ArgumentError
  end
end
