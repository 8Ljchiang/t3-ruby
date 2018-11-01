class Handler
    def initialize(args={})
        @options_table = args.fetch(:optionsTable)
    end

    def handle(input, game)
        if is_valid_option(input)
            if contains_handler(input)
                @options_table[input.to_sym].call({ input: input, game: game })
            else
                @options_table[:default].call({ input: input, game: game })
            end
        else 
            @options_table[:error].call({ input: input, game: game })
        end
    end

    private
    def contains_handler(key)
        handlerNames = @options_table.keys.select{|handler| return !(["error", "default", "options"].include? handler) } 
        return handlerNames.include? input
    end
    
    def is_valid_option(input, game)
        options = @options_table[:options].call({ input: input, game: game })
        return options.include? input
    end
end
