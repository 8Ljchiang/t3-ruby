require_relative '../parser.rb'


parserHandlers = {
    default: method(:default),
    error: method(:error),
    options: method(:options)
}

def default(args={})

end

def error(args={})

end

def options(args={})

end

def create_parser()
    parser = Parser.new({ handlers: handlers })
    return parser
end

RSpec.describe(Parser) do
    context "When creating a Parser class" do 
        it "should return an instantiated Parser object", positive: true do
            parser = create_parser()
            expect(parser).to_not be(nil)
        end
    end
end