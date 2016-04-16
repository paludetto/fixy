require 'spec_helper'

describe Fixy::Formatter::Mask do
  let(:proxy) do
    Class.new do
      def line_ending; end
      include Fixy::Formatter::Mask
    end.new
  end

  let(:format) { -> (input, bytes) { proxy.format_mask input, bytes } }

  it 'fills masks with values' do
    expect(format[['999.999.999-99', '31415926536'], 14]).to eq('314.159.265-36')
    expect(format[['AAA-AAA-AA', 'Fixy'], 10]).to eq('Fix-y  -  ')
    expect(format[['???-99', '987654321'], 6]).to eq('987-65')
  end

  it 'coerces blank values' do
    expect(format[['9-9', nil], 3]).to eq('   ')
    expect(format[['??.???.??', ''], 9]).to eq('         ')
    expect(format[['9.A?/?(A::9)', nil], 12]).to eq('            ')
  end
end
