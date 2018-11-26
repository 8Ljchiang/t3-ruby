require_relative '../lib/parser.rb'
require_relative '../helpers/options_tables.rb'

new_options = lambda { |args| return ["ready"]}
new_default = lambda { |args| new_options_table[args.input].call(args) }
new_ready = lambda { |args| puts args[:game][:started] } #= "started" }
new_error = lambda { |args| return "error" }
 
new_options_table = {
    options: new_options,
    default: new_default,
    ready: new_ready,
    error: new_error
}

RSpec.describe(Parser) do
    def create_parser(options_table)
        return Parser.new({ options_table: options_table })
    end

    def create_mock_game
        instance_double('Game', :state => "new")
    end

    context "When creating Parser" do
        before(:each) do
            @parser = create_parser(new_options_table)
        end

        it "should intialize a Handler object", positive: true do
            expect(@parser).to_not be(nil)
        end
    end
    
    context "#parse" do
        before(:each) do
            @parser = create_parser(new_options_table)
        end

        it "should respond to #parse" do
            expect(@parser).to respond_to(:parse)
        end
    end

    context "#parse when initialized with new_options_table" do
        before(:each) do
            @parser = create_parser(new_options_table)
        end

        it "should return options as an array" do
            game = create_mock_game 
            expect(@parser.options_table[:options].call({ input: "ready", game: game })).to contain_exactly("ready")
        end

        it "should change game state to 'started' from 'new'" do
            game = create_mock_game
            @parser.parse("ready", game)
            expect(game.state).to eq("started")
        end
    end
end