require_relative './app.rb'
require_relative './delegator.rb'
require_relative './parser.rb'
require_relative './handler_end.rb'
require_relative './handler_new.rb'
require_relative './handler_started.rb'

# new_options = lambda { |args| return ["ready"]}
# new_default = lambda { |args| new_options_table[args.input].call(args) }
# new_ready = lambda { |args| args[:game][:state] = "started" }
# new_error = lambda { |args| return "error" }
 
# new_options_table = {
#     options: new_options,
#     default: new_default,
#     ready: new_ready,
#     error: new_error
# }

# started_options = lambda { |args| return args[:game].empty_positions }
# started_default = lambda { |args| return "" }
# started_error = lambda { |args| return "" }

# started_options_table = {
#     options: started_options,
#     default: started_default,
#     error: started_error
# }

# end_options = lambda { |args| return ["new", "quit"] }
# end_default = lambda { |args| return "" }
# end_error = lambda { |args| return "" }

# end_options_table = {
#     options: end_options,
#     default: end_default,
#     error: end_error
# }

# newParser = Parser.new({options_table: new_options_table})
# startedParser = Parser.new({options_table: started_options_table})
# endParser = Parser.new({options_table: end_options_table})

# parsersHash = {
#     new: newParser,
#     started: startedParser,
#     end: endParser
# }

# delegator = Delegator.new(parsersHash)

new_handler = NewHandler.new()
started_handler = StartedHandler.new()
end_handler = EndHandler.new()

handler_table = {
    "new": new_handler,
    "started": started_handler,
    "end": end_handler
}

t3 = App.new({delegator: nil, handler_table: handler_table})
t3.run()