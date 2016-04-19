module Fixy
  module Formatter
    module Mask
      #
      # Mask Formatter
      #
      # Input must be a pair [mask, value]
      #
      # Each '9'/'A'/'?' in `mask` will be replaced with a character from `value` if able,
      # and with ' ' otherwise
      #
      # If value is blank/nil, returns an empty result instead

      def format_mask(input, byte_width)
        raise ArgumentError, 'Value is nil' if input.nil?
        raise ArgumentError, 'Input must be a pair [mask, value]' unless input.is_a?(Array) && input.count == 2
        mask, value = input
        raise ArgumentError, 'Value is nil' if value.nil?
        raise ArgumentError, "Mask length must be #{byte_width}" unless mask.length == byte_width

        input_string = String.new(value.to_s).tr "#{Fixy::Record::LINE_ENDING_CRLF}#{line_ending}", ''

        return ' ' * byte_width if input_string == ''

        input_chars = input_string.chars

        mask.gsub(/[9A?]/) { |_char|  input_chars.shift || ' ' }
      end
    end
  end
end
