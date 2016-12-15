
require "./meok_log/*"
require "./meok_log/entities/*"
require "./meok_log/entity_aggregators/*"
require "./meok_log/resolvers/*"
require "./meok_log/providers/*"
require "./meok_log/parsers/*"
require "./meok_log/reducers/*"

module MeokLog
  config_content = YAML.parse(File.read("config/data.yml"))
  bindings_content = YAML.dump(YAML.parse(File.read("config/bindings.yml")))

  dispatcher = MeokLog::Dispatcher.new({ data: config_content["data"].to_s })
  input = dispatcher.fetch_all
  yamls = input.map { |page| page["yaml"] }

  bindings_data = MeokLog::Parsers::Binding.new

  bindings = MeokLog::Reducers::CountBinding.new(
    bindings_data.config(bindings_content),
    yamls
  )

  puts "stress présent dans #{bindings.total("stress")} fichiers"
end
