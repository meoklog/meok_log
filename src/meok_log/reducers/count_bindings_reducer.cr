
require "yaml"

module MeokLog
  module Reducers
    class CountBinding
      @bindings : Array(String)
      @data : Array(YAML::Any)

      getter :bindings
      getter :data

      def initialize(@bindings : Array(String), @data = [YAML.parse("")])
      end

      def total(prop : String)
        data.reduce(0) do |acc, day|
          if day[prop] != nil
            acc = acc.to_i + 1
          else
            acc = acc.to_i
          end
        end
      end

    end
  end
end
