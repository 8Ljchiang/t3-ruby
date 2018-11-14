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

started_options = lambda { |args| return [1,2,3] }
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
