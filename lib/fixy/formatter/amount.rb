require_relative './helpers'

module Fixy
  module Formatter
    module Amount
      include Fixy::Formatter::Helpers

      #
      # Amount Formatter
      #
      # May contain any digit from 0 through 9. Field is unsigned,
      # has an implied decimal, and is right- justified and zero-filled.
      # For example, 123.98 would be coded as 000000012398
      #

      def format_amount(input, length)
        raise ArgumentError, 'Value is nil' if input.nil?
        value = (('%0' << length.to_s << 'd') % integerize(input.abs * 100))

        if value.length > length
          raise ArgumentError, "Insufficient length for provided amount (input: #{input}, length: #{length}, required length: #{value.length})"
        else
          value
        end
      end
    end
  end
end
