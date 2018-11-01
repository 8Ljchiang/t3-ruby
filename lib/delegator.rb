class Delegator
    def initialize(args={})
        @parsers = args.fetch(:parsers)
    end

    def delegate(input, game)
        if contains_parser(input, game)
            parser = @parsers[game.state]
            parser.parser({ input: input, game: game })
        end
    end

    def add_parser(name, parser)
        if contains_parser(name)
            @parsers[name] = parser
        end
    end

    def remove_parser(name)
        @parsers.detele(name)
    end

    private
    def contains_parser(input, game)
        return @parsers.keys.include? game[:state]
    end
end