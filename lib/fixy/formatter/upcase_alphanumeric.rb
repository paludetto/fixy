module Fixy
  module Formatter
    module UpcaseAlphanumeric
      include Fixy::Formatter::Alphanumeric

      #
      # Upcase Alphanumeric Formatter
      #
      # Same as Alphanumeric Formatter, except
      # it's all upper case.
      #

      def format_upcase_alphanumeric(input, bytes)
        raise ArgumentError, 'Value is nil' if input.nil?
        format_alphanumeric(input.to_s.upcase, bytes)
      end
    end
  end
end
