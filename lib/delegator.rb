# TODO: DELETE

class Delegator
  def initialize(parsers)
    @parsers = parsers
  end

  def delegate(input, game)
    if contains_parser(input, game)
      parser = @parsers[game.state.to_sym]
      parser.parse(input, game)
    end
  end

  private

  def contains_parser(_input, game)
    @parsers.key?(game.state)
  end
end
