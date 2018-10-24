class InputHandler
    def get_input(prompt)
        puts(prompt)
        input = gets.chomp()
        return input
    end
end