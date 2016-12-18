
module MeokLog
  module Reducers
    class PairDate

      @date_binding : String
      @data : Array(YAML::Any)

      getter :date_binding
      getter :data

      def initialize(@data = [YAML.parse("")], @date_binding : String = "date")
      end

      def to_pairs(prop : String)
        @data.map do |d|
          {
            "date": d["#{date_binding}"].to_s,
            "value": d[prop].to_s
          }
        end
      end

      def to_pairs(prop : String, filenames : Array(String))
        @data.map_with_index do |d, index|
          {
            "date": filenames[index].to_s,
            "value": d[prop].to_s
          }
        end
      end

    end

  end

end
