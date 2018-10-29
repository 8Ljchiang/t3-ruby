require_relative '../lib/player.rb'
require_relative '../lib/game.rb'

RSpec.describe(Game) do

    # Testing helper to create a new Game
    def create_game(args={})
        game = Game.new(args)
    end

    context "When creating a Game class" do

        before(:each) do
            plyrs = [Player.new("Tom", "X"), Player.new("John", "O")]
            initial_player = 0
            args = { players: plyrs, active_player: initial_player }
            @game = create_game(args)
        end

        it "should be instantiated with default properties", positive: true do
            expect(@game).to_not be(nil)
            expect(@game.players.length).to eq(2)
            expect(@game.state).to eq("new")
            expect(@game.active_player_index).to eq(0)
            expect(@game.board).to_not be(nil)
        end
    end

    context "When a Game is started and the state of the game is set" do
        before(:each) do
            plyrs = [Player.new("Tom", "X"), Player.new("John", "O")]
            initial_player = 0
            args = { players: plyrs, active_player: initial_player }
            @game = create_game(args)
        end
        
        it "should change the Game state to 'started'", positive: true do
           @game.set_state("started")
           expect(@game.state).to eq("started")             
        end
    end

    context "When a Game is started and a player makes a move" do
        before(:each) do
            plyrs = [Player.new("Tom", "X"), Player.new("John", "O")]
            initial_player = 0
            args = { players: plyrs, active_player: initial_player }
            @game = create_game(args)
        end

        it "should change the active_player_index up by 1", positive: true do
            @game.set_state("started")
            @game.play_a_position(1)
            expect(@game.active_player_index).to eq(1)
        end
    end

    context "When a Game board is full" do
        before(:each) do
            plyrs = [Player.new("Tom", "X"), Player.new("John", "O")]
            initial_player = 0
            args = { players: plyrs, active_player: initial_player }
            @game = create_game(args)
        end

        it "should change the Game state to 'end'", positive: true do
            for i in 1..9 do
                @game.play_a_position(i)
            end
            expect(@game.state).to eq('end')
        end
    end
end