# TODO: DELETE

require_relative './app.rb'
require_relative './delegator.rb'
require_relative './parser.rb'
require_relative './handler_end.rb'
require_relative './handler_new.rb'
require_relative './handler_started.rb'

default_win_patterns = [
  '1,5,9',
  '3,5,7',
  '1,2,3',
  '4,5,6',
  '7,8,9',
  '1,4,7',
  '2,5,8',
  '3,6,9'
]

pattern_checker = PatternChecker.new(patterns: default_win_patterns)

new_handler = NewHandler.new
started_handler = StartedHandler.new(pattern_checker: pattern_checker)
end_handler = EndHandler.new

handler_table = {
  "new": new_handler,
  "started": started_handler,
  "end": end_handler,
}

t3 = App.new(delegator: nil, handler_table: handler_table)
t3.run
