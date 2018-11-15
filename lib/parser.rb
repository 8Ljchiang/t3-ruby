class Parser
    attr_reader :options_table

    def initialize(args={})
        @options_table = args.fetch(:options_table)
    end

    def parse(input, game)
        if is_valid_option(input, game)
            if contains_parser(input, game)
                func = @options_table[input.to_sym]
                puts func({ input: input, game: game })
                func.call({input: input, game: game})
            else
                @options_table[:default].call({ input: input, game: game })
            end
        else 
            @options_table[:error].call({ input: input, game: game })
        end
    end

    private
    def contains_parser(key, game)
        handlerNames = @options_table.keys.select{|handler| return !(["error", "default", "options"].include? handler) } 
        return handlerNames.include? input
    end
    
    def is_valid_option(input, game)
        options = @options_table[:options].call({ input: input, game: game })
        return options.include? input
    end
end
