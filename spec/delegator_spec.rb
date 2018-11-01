require_relative '../lib/parser.rb'
require_relative '../helpers/options_tables.rb'

RSpec.describe(Delegator) do
    def create_mock_parser_handlers
        mockHandlers = double("handlers")
        allow(mockHandlers).to receive(:error)
        allow(mockHandlers).to receive(:default)
        allow(mockHandlers).to receive(:options).and_return(["valid_input"]) #.and_return("valid_input")
        return mockHandlers
    end

    def create_delegator
        parsers = {
            new: Parser.new({options_table: new_options_table}),
            started: Parser.new({options_table: started_options_table}),
            end: Parser.new({options_table: end_options_table})
        }
        delegator = Delegator.new({parsers: parsers})
        return delegator
    end

    context "When creating a Delegator class" do 
        it "should return an instantiated Delegator object", positive: true do
            delegator = create_delegator
            expect(delegator).to_not be(nil)
        end
    end

    context "#delegate" do
        before(:each) do
            @delegator = create_parser(mockHandlers)
            @game = double("game")
        end

        


        it "should take valid input and call the default handler", positive: true do
            input = "valid_input"
            @delegator.parse(input, @game)
            expect(@parser.handlers).to have_received(:options)
            expect(@parser.handlers).to have_received(:default)
        end
        
        it "should take invalid input and call the error handler", positiive: true do
            input = "invalid_input"
            @delegator.parse(input, @game)
            expect(@parser.handlers).to have_received(:options)
            expect(@parser.handlers).to have_received(:error)
        end
    end
end