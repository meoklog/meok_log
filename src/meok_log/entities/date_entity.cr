
module MeokLog
  module Entities
    class Date
      @year : Int32
      @month : Int32
      @day : Int32

      getter :year
      getter :month
      getter :day

      def initialize(@year, @month, @day)
      end
    end
  end
end
