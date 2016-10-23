
require "yaml"
require "markdown"

module MeokLog
  module Providers
    class MdYaml
      def self.parse(contents : String)
        yaml = MeokLog::Providers::Content
        md = MeokLog::Providers::Content

        md_parser = ->(content : String) { Markdown.to_html content }
        meta_parser = ->(content : String) { MeokLog::Parsers::MdMeta.reject content }
        md_meta_parser = ->(content : String) { md_parser.call(meta_parser.call(content)) }
        yaml_parser = ->(content : String) { YAML.parse content }

        yaml_contents = yaml.parse(contents, yaml_parser)
        md_contents = md.parse(contents, md_meta_parser)

        {"yaml": yaml_contents, "md": md_contents}
      end
    end
  end
end
