
module MeokLog
  module Parsers
    class MdMeta
      def self.reject(content : String)
        lines = content.split("\n")
        result = ""
        dash_counter = 0
        lines.each do |line|
          if line == "---"
            dash_counter = dash_counter + 1
          elsif dash_counter == 2
            result = result + line + "\n"
          end
        end
        result
      end
    end
  end
end
