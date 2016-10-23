
module MeokLog
  module Resolvers
    class Directory
      def self.fetch(dir_name : String, reader : Proc(String, Array(String)))
        if dir_name.empty?
          raise ArgumentError.new "First argument, directory name, cannot be empty"
        end

        dir_files = reader.call(dir_name).reverse()

        if dir_files.empty?
          raise Enumerable::EmptyError.new "no content found"
        end
        dir_files
      end
    end
  end
end
