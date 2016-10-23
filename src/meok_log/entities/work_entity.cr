
module MeokLog
  module Entities
    class Work
      @has_worked: Bool

      getter :has_worked

      def initialize(@has_worked)
      end
    end
  end
end
