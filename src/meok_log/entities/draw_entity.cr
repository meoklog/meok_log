
module MeokLog
  module Entities
    class Draw
      @name : String
      @type: Array(String)

      getter :name
      getter :type

      def initialize(@name, @type)
      end
    end
  end
end
