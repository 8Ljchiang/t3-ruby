class Parser
    attr_reader :options_table

    def initialize(args={})
        @options_table = args.fetch(:options_table)
    end

    def parse(input, game)
        if is_valid_option(input, game)
            if contains_parser(input, game)
                @options_table[input.to_sym].call({ input: input, game: game })
            else
                @options_table[:default].call({ input: input, game: game })
            end
        else 
            @options_table[:error].call({ input: input, game: game })
        end
    end

    # def add_option_parser(option_name, handler)
    #     if !contains_parser(option_name)
    #         @options_table[name] = handler
    #     end
    # end

    # def remove_option_parser(option_name)
    #     if contains_parser(option_name)
    #         @options_table.delete(option_name)
    #     end
    # end
    
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
