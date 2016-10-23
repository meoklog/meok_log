
require "yaml"

module MeokLog
  module Resolvers
    class Extension
      def self.select(files : Array(String), pattern : Regex = //)
        s = files.select { |file| pattern =~ file }
      end
    end
  end
end
