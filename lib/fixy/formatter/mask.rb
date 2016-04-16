module Fixy
  module Formatter
    module Mask
      #
      # Mask Formatter
      #
      # Only contains printable characters and is
      # left-justified and filled with spaces.
      #
      # input must be a pair [mask, value]
      #
      # Each '9'/'A'/'?' in `mask` will be replaced with a character from `value` if able,
      # and with ' ' otherwise

      def format_mask(input, byte_width)
        raise ArgumentError, "Input must be a pair [mask, value]" unless input.is_a?(Array) && input.count == 2
        mask, value = input
        raise ArgumentError, "Mask length must be #{byte_width}" unless mask.length == byte_width

        input_string = String.new(value.to_s).tr "#{Fixy::Record::LINE_ENDING_CRLF}#{line_ending}", ''

        input_chars = input_string.chars

        mask.gsub(/[9A?]/) { |_char|  input_chars.shift || ' ' }
      end
    end
  end
end
