
module MeokLog
  module Reducers
    class PairDate

      @date_binding : String
      @data : Array(YAML::Any)

      getter :date_binding
      getter :data

      def initialize(@date_binding : String = "date", @data = [YAML.parse("")])
      end

      def to_pairs(prop : String)
        @data.map do |d|
          {
            "date": d["#{date_binding}"].to_s,
            "value": d[prop].to_s
          }
        end
      end

    end

  end

end
