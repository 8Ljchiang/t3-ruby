require_relative './player.rb'
require_relative './game.rb'
require_relative './game_renderer.rb'
require_relative './renderer_interface_spec.rb'
require_relative './renderer_subclass_interface_spec.rb'

RSpec.describe(GameRenderer) do
    context "When creating GameRenderer" do
        game_args = { players: [Player.new("Mike", "X"), Player.new("Will", "O")]}
        game = Game.new(game_args)
        game_renderer = GameRenderer.new
        include_examples("RendererInterfaceTests", game_renderer)
        include_examples("RendererSubclassInterfaceTests", game_renderer)

        context "When testing GameRenderer 'render' method" do

            before(:each) do
                game_args = { players: [Player.new("Mike", "X"), Player.new("Will", "O")]}
                @game = Game.new(game_args)
                @renderer = GameRenderer.new
            end

            it "should create the game welcome message", positive: true do
                welcome_string = "welcome"
                expect(@renderer.welcome(@game)).to eq(welcome_string)
            end

            it "should create the game started message", positive: true do
                started_string = "game started"
                expect(@renderer.render(@game)).to eq(started_string)
            end

            it "should create the game end message", positive: true do
                end_string = "the game has ended"
                expect(@renderer.finale(@game)).to eq(end_string)
            end
        end
    end
end