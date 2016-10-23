
module MeokLog
  module Entities
    class Stream
      @hours : Int32
      @minutes : Int32
      @seconds : Int32

      getter :hours
      getter :minutes
      getter :seconds

      def initialize(@hours, @minutes, @seconds = 0)

      end
    end
  end
end
