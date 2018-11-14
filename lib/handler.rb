class Handler
    def options(input, game)
        raise NotImplementedError
    end

    def error(input, game)
        raise NotImplementedError
    end

    def default(input, game)
        raise NotImplementedError
    end

    private 
    def is_valid_option(input, game)
        return options(input, game).include?(input)
    end
end