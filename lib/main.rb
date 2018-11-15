require_relative './app.rb'
require_relative './delegator.rb'
require_relative './parser.rb'
require_relative './handler_end.rb'
require_relative './handler_new.rb'
require_relative './handler_started.rb'

new_handler = NewHandler.new
started_handler = StartedHandler.new
end_handler = EndHandler.new

handler_table = {
  "new": new_handler,
  "started": started_handler,
  "end": end_handler
}

t3 = App.new(delegator: nil, handler_table: handler_table)
t3.run
