
require "yaml"

module MeokLog
  module Parsers
    class Binding
      @bindings : Array(String)

      getter :bindings

      def initialize(@bindings = [] of String)
      end

      def config(content : String)
        of_yaml = YAML.parse(content)
        @bindings = of_yaml["bindings"].map { |b| b.as_s }
      end

      def md(contents : Array(String))
        md_parser = MeokLog::Providers::MdYaml
        yaml_metas = contents.map { |c| md_parser.parse(c)["yaml"] }
        binded_metas = yaml_metas.map { |y| y.as_h.map { |k, v| k.to_s } }
        @bindings = binded_metas.flatten.uniq
      end
    end
  end
end
