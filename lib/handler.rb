class Handler
    def initialize(args={})
        @optionsTable = args.fetch(:optionsTable)
    end

    def default(args={})
        
    end

    def error(args={})

    end

    def options(args={})
        return @optionsTable.options.call(args)
    end
end
