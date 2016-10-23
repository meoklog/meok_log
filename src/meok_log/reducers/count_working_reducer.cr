
require "yaml"

module MeokLog
  module Reducers
    class CountWorking
      def self.total(data : Array(YAML::Any | NamedTuple(travail: String)))
        data.reduce(0) { |acc, day| acc.to_i + (day["travail"] == "true" ? 1 : 0) }
      end
    end
  end
end
