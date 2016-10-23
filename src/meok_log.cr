
require "./meok_log/*"
require "./meok_log/entities/*"
require "./meok_log/entity_aggregators/*"
require "./meok_log/resolvers/*"
require "./meok_log/providers/*"
require "./meok_log/parsers/*"
require "./meok_log/reducers/*"

module MeokLog
  config = {data: "./data"}
  dispatcher = MeokLog::Dispatcher.new(config)

  input =  dispatcher.fetch_all

  yamls = input.map { |page| page["yaml"] }
  p "jours de travail totaux : "
  p MeokLog::Reducers::CountWorking.total(yamls)
end
