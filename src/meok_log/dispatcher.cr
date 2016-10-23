
require "yaml"

module MeokLog
  class Dispatcher
    @config : NamedTuple(data: String)
    @file_reader : Proc(String, String)
    @dir_reader : Proc(String, Array(String))
    @parser : Proc(String, NamedTuple(yaml: YAML::Any, md: String))
    @extension_pattern : Regex

    getter :config

    def initialize(@config)
      md_yaml = MeokLog::Providers::MdYaml
      @file_reader = ->(file : String ) { File.read file }
      @dir_reader = ->(dir : String) { Dir.entries dir }
      @parser = ->(content : String) { Providers::MdYaml.parse content }
      @extension_pattern = /md/
    end

    def fetch_all
      dir = MeokLog::Resolvers::Directory
      file = MeokLog::Resolvers::File
      extension = MeokLog::Resolvers::Extension

      file_list = dir.fetch(@config["data"], @dir_reader)
      md_list = extension.select(file_list, @extension_pattern)
      contents = file.read_all(md_list, @config["data"], @file_reader)
      parsed_contents = contents.map { |content| @parser.call content}

      parsed_contents
    end
  end
end
