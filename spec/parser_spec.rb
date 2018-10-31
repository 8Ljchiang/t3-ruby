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
    context "When creating a Parser class" do 
        it "should return an instantiated Parser object", positive: true do
            parser = create_parser(parserHandlers)
            expect(parser).to_not be(nil)
        end
    end
end