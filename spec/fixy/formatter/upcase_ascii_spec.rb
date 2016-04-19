require 'spec_helper'

describe Fixy::Formatter::UpcaseAscii do
  let(:proxy) do
    Class.new {
      def line_ending; end
      include Fixy::Formatter::UpcaseAscii
    }.new
  end
  let(:format) { -> (input, bytes) { proxy.format_upcase_ascii input, bytes } }

  it 'upcases characters' do
    expect(format['Sir Charles', 11]).to eq('SIR CHARLES')
  end

  it 'rejects nils' do
    expect { format[nil, 3] }.to raise_error ArgumentError
  end
end
