module Fixy
  module Decorator
    class Default
      class << self
        def document(document)
          document
        end

        def field(value, _record_number, _position, _method, _length, _type)
          value
        end

        def record(record)
          record
        end
      end
    end
  end
end
