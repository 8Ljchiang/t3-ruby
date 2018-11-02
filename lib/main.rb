require_relative './app.rb'
require_relative './delegator.rb'
require_relative './parser.rb';

new_options = lambda { |args| return ["ready"]}
new_default = lambda { |args| new_options_table[args.input].call(args) }
new_ready = lambda { |args| args[:game][:state] = "started" }
new_error = lambda { |args| return "error" }
 
new_options_table = {
    options: new_options,
    default: new_default,
    ready: new_ready,
    error: new_error
}

started_options = lambda { |args| return args[:game].empty_positions }
started_default = lambda { |args| return "" }
started_error = lambda { |args| return "" }

started_options_table = {
    options: started_options,
    default: started_default,
    error: started_error
}

end_options = lambda { |args| return ["new", "quit"] }
end_default = lambda { |args| return "" }
end_error = lambda { |args| return "" }

end_options_table = {
    options: end_options,
    default: end_default,
    error: end_error
}

newParser = Parser.new({options_table: new_options_table})
startedParser = Parser.new({options_table: started_options_table})
endParser = Parser.new({options_table: end_options_table})

parsersHash = {
    new: newParser,
    started: startedParser,
    end: endParser
}

delegator = Delegator.new(parsersHash)

t3 = App.new({delegator: delegator})
t3.run()