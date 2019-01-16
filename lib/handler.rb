# TODO: DELETE

class Handler
  def options(_input, _game)
    raise NotImplementedError
  end

  def error(_input, _game)
    raise NotImplementedError
  end

  def default(_input, _game)
    raise NotImplementedError
  end

  private

  def is_valid_option(input, game)
    options(input, game).include?(input)
  end
end
