class Parser
    attr_reader :handlers

    def initialize(args={})
        @handlers = args.fetch(:handlers)
    end
end