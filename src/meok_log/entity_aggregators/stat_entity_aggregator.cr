
module MeokLog
  module EntityAggregators
    class Stat
      @date : MeokLog::Entities::Date
      @mood : MeokLog::Entities::Mood
      @work : MeokLog::Entities::Work
      @draw : MeokLog::Entities::Draw | Nil
      @stream: MeokLog::Entities::Stream | Nil

      getter :date
      getter :mood
      getter :work
      getter :draw
      getter :stream

      def initialize(@date, @mood, @work, @draw, @stream )
      end
    end
  end
end
