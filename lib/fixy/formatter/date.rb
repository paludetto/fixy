module Fixy
  module Formatter
    module Date
      #
      # Date Formatter
      #
      # If value is a date, it will strftime it
      # Otherwise, we return an empty result
      #
      # Define `date_format` method to customize date format (default is %Y-%m-%d)

      def format_date(input, byte_width)
        return ' ' * byte_width unless input.respond_to? :strftime

        date_format_string = if respond_to? :date_format
                               date_format
                             else
                               '%Y-%m-%d'
                             end

        result = input.strftime date_format_string
        raise ArgumentError, 'Date format not compatible with field width' unless result.length == byte_width

        result
      end
    end
  end
end
