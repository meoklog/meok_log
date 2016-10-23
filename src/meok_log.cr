
require "./meok_log/*"
require "./meok_log/entities/*"
require "./meok_log/entity_aggregators/*"
require "./meok_log/resolvers/*"
require "./meok_log/providers/*"
require "./meok_log/parsers/*"

module MeokLog
  config = {data: "./data"}
  dispatcher = MeokLog::Dispatcher.new(config)

  input =  dispatcher.fetch_all
end

# require "yaml"
#
# module MeokLog
#
#   class Log
#     @dir_files : Array(String)
#     @dir_name: String
#     @pattern : Regex
#
#     getter :dir
#     def initialize(@dir_name, @pattern)
#       @dir_files = Dir.entries(@dir_name).reverse
#     end
#
#     def content
#       @dir_files.map { |f|  File.read "#{@dir_name}/#{f.to_s}" }
#       .map { |c| YAML.parse c }
#     end
#
#     def files
#       if @dir_files.size == 0
#         return "no content found"
#       end
#       @dir_files.select! { |f|  @pattern =~ f }
#     end
#   end
#
#   class Stress
#     def initialize(name : String)
#       case(name.to_lower)
#       when "normal"
#         0
#       when "bad"
#         1
#       when "overflow"
#         2
#       when "danger"
#         3
#       end
#     end
#   end
#
#   # TODO : refactor – splits date in a class
#   # TODO: goal of analyzer is to sort datas, not compose them
#   class Analyzer
#     @content: Array(YAML::Any)
#     @working_total : Counter = Counter.new
#     # TODO : composition
#     @stats : Array(Tuple(Int32, Tuple(Int32, Int32, Int32), Int32, String, Int32))
#
#     def initialize(@content)
#       @working_per_month = Nil
#
#       # TODO : composition
#       @stats = [] of (Tuple(Int32, Tuple(Int32, Int32, Int32), Int32, String, Int32))
#     end
#
#     def date(content : YAML::Any)
#       content["date"].to_s
#     end
#
#     def work?(content : YAML::Any)
#       if content["travail"] == true.to_s
#         return 1.to_i
#       end
#       0.to_i
#     end
#
#     def mood(content : YAML::Any)
#       content["humeur"].to_s
#     end
#
#     def stress(content : YAML::Any)
#       # value = content["stress"].to_s
#       1
#     end
#
#     def date_of_content(date : String ="")
#       r = date.match(/(.+)\-(.+)\-(.+)/)
#       if r
#         # TODO : validation service
#         return { r[1].to_i, r[2].to_i, r[3].to_i }
#       end
#       # TODO : throw e
#       # "month not found"
#       {0, 0, 0} # 4Head
#     end
#
#
#     def execute
#       @content.each do |md|
#         md_date = date(md)
#         next_index = @stats.size + 1
#         date_list = date_of_content(md_date)
#         has_worked = work?(md)
#         stress_value = stress(md)
#         mood_name = mood(md)
#         # compute from state or do like below?
#         if has_worked == 1
#           @working_total.increments
#         end
#         tuple =  {next_index, date_list , has_worked, mood_name, stress_value}
#         @stats << tuple
#       end
#       @stats
#     end
#
#     def working_total
#       @working_total.count
#     end
#
#     def working_days_of_month (month_name : Int32, initial : Int32 = 0)
#       @stats.reject { |entry| entry[1][1] != month_name || entry[2] == 0 } .size
#     end
#
#     def mood_count(mood_name : String)
#       @stats.reject { |entry| entry[3]}
#     end
#   end
# end
#
# log_dirs = "data"
# file_pattern = /md/
#
# log = MeokLog::Log.new(log_dirs, file_pattern)
# log.files()
# analyzer = MeokLog::Analyzer.new(log.content)
# p analyzer.execute
# p analyzer.working_total
# p analyzer.working_days_of_month(10)
