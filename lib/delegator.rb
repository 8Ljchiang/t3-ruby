class Delegator
    def initialize(parsers)
        # @parsers = args.fetch(:parsers)
        @parsers = parsers
    end

    def delegate(input, game)
        if contains_parser(input, game)
            parser = @parsers[game.state.to_sym]
            parser.parse(input, game)
        end
    end

    # def add_parser(name, parser)
    #     if contains_parser(name)
    #         @parsers[name] = parser
    #     end
    # end

    # def remove_parser(name)
    #     @parsers.detele(name)
    # end

    private
    def contains_parser(input, game)
        # return @parsers.keys.include? game.state
        return true
    end
end