require_relative '../lib/parser.rb'

def default(args={})

end

def error(args={})

end

def options(args={})

end

parserHandlers = {
    default: default,
    error: error,
    options: options
}


def create_parser(handlers)
    parser = Parser.new({ handlers: handlers })
    return parser
end

RSpec.describe(Parser) do

    def create_mock_parser_handlers
        mockHandlers = double("handlers")
        allow(mockHandlers).to receive(:error)
        allow(mockHandlers).to receive(:default)
        allow(mockHandlers).to receive(:options).and_return(["valid_input"]) #.and_return("valid_input")
        return mockHandlers
    end

    context "When creating a Parser class" do 
        it "should return an instantiated Parser object", positive: true do
            parser = create_parser(parserHandlers)
            expect(parser).to_not be(nil)
        end
    end

    context "#parse" do
        before(:each) do
            mockHandlers = create_mock_parser_handlers()
            @parser = create_parser(mockHandlers)
            @game = double("game")
        end

        it "should take valid input and call the default handler", positive: true do
            input = "valid_input"
            @parser.parse(input, @game)
            expect(@parser.handlers).to have_received(:options)
            expect(@parser.handlers).to have_received(:default)
        end
        
        it "should take invalid input and call the error handler", positiive: true do
            input = "invalid_input"
            @parser.parse(input, @game)
            expect(@parser.handlers).to have_received(:options)
            expect(@parser.handlers).to have_received(:error)
        end
    end
end