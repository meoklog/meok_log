
module MeokLog
  module Providers
    class BindingConfig
      @file : String

      getter :file

      def initialize(@file)
      end

      def write(content : Array(String),
                writer : Proc(Tuple(String, String), String))
        header_string = "---\nbindings\n"
        content_string = content.map { |c| "  - #{c}\n" }.join
        result_string = "#{header_string}#{content_string}"
        content_written = writer.call({file, result_string})

        if (content_written.empty?)
          raise IO::Error.new "no content written"
        end
        content_written
      end
    end
  end
end
