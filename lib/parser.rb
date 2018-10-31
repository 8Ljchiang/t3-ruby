class Parser
    attr_reader :handlers

    def initialize(args={})
        @handlers = args.fetch(:handlers)
    end

    def parse(input, game)
        options = @handlers.options(input, game)
        puts options
        if options.include? input
            @handlers.default(input, game)
        else
            @handlers.error(input, game)
        end
    end
end