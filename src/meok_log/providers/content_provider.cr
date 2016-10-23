
module MeokLog
  module Providers
    class Content
      def self.parse(content : String, parser : Proc(String, String | YAML::Any))
        parser.call content
      end
    end
  end
end
