# TODO: DELETE

class InputHandler
  def initialize(io)
    @io = io
  end

  def get_input(prompt)
    puts(prompt)
    input = @io.gets.chomp
    input
  end
end
