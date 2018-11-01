require_relative '../lib/delegator.rb'
require_relative '../helpers/options_tables.rb'

new_options = lambda { |args| return ["ready"]}
new_default = lambda { |args| new_options_table[args.input].call(args) }
new_ready = lambda { |args| args[:game][:started]  = "started" }
new_error = lambda { |args| return "error" }
 
new_options_table = {
    options: new_options,
    default: new_default,
    ready: new_ready,
    error: new_error
}

RSpec.describe(Delegator) do
    def create_mock_parsers
        mockParsers = double("parsers")
        allow(mockParsers).to receive(:new)
        allow(mockParsers).to receive(:started)
        allow(mockParsers).to receive(:end)
        return mockParsers
    end

    def create_delegator
        mockParsers = create_mock_parsers
        delegator = Delegator.new({parsers: mockParsers})
        return delegator
    end

    def create_game(state)
        game = instance_double("Game", :state => state)
        return game
    end

    context "When creating a Delegator class" do 
        it "should return an instantiated Delegator object", positive: true do
            delegator = create_delegator
            expect(delegator).to_not be(nil)
        end
    end

    context "#delegate" do
        before(:each) do
            @delegator = create_delegator
        end

        it "should call the new parser", positive: true do
            input = "valid_input"
            game = create_game("new")
            @delegator.delegate(input, game)
            expect(@delegator.parsers).to have_received(:new)
        end

        it "should call the started parser", positive: true do
            input = "valid_input"
            game = create_game("started")
            @delegator.delegate(input, game)
            expect(@delegator.parsers).to have_received(:started)
        end

        it "should call the end parser", positive: true do
            input = "valid_input"
            game = create_game("end")
            @delegator.delegate(input, game)
            expect(@delegator.parsers).to have_received(:end)
        end
        
        # it "should take invalid input and call the error handler", positiive: true do
        #     input = "invalid_input"
        #     @delegator.parse(input, @game)
        #     expect(@parser.handlers).to have_received(:options)
        #     expect(@parser.handlers).to have_received(:error)
        # end
    end
end