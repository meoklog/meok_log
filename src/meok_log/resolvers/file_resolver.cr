
module MeokLog
  module Resolvers
    #
    class File
      def self.read_all(files : Array(String), dir_name : String, reader : Proc(String, String))
        files.map { |file_name| reader.call "#{dir_name}/#{file_name.to_s}" }
      end
    end
  end
end
