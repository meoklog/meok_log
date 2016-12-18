
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
  filenames = input.map { |page| page["filename"] }

  bindings_data = MeokLog::Parsers::Binding.new

  bindings = MeokLog::Reducers::CountBinding.new(
    bindings_data.config(bindings_content),
    yamls
  )

  date_stress = MeokLog::Reducers::PairDate.new(
    "date",
    yamls
  )

  puts "stress présent dans #{bindings.total("stress")} fichiers"
  puts "humeur par date : #{date_stress.to_pairs("humeur", filenames)}"
end
