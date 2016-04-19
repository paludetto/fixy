module Fixy
  module Formatter
    module UpcaseAscii
      include Fixy::Formatter::Ascii

      #
      # ASCII Upcase Formatter
      #
      # Same as ASCII Formatter, except it upcases all characters
      #

      def format_upcase_ascii(input, bytes)
        raise ArgumentError, 'Value is nil' if input.nil?
        format_ascii(input, bytes).upcase
      end
    end
  end
end
