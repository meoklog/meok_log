
module MeokLog
  module Entities
    class Mood
      @name : String
      @stress : Int32

      getter :name
      getter :stress

      def initialize(@name, @stress)
      end
    end
  end
end
