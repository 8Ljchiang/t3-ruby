require_relative './player.rb'

# Testing helper to create a player object
def create_player(args={})
    player = Player.new(args[:name], args[:mark])
    return player
end

RSpec.describe(Player) do
    context "When creating Player class" do
        it "should instantiate a new Player object", positive: true do
            player_name = "Sam"
            player_marker = "X"
            player = create_player({ name: player_name, mark: player_marker})
            expect(player).to_not be(nil)
        end
    end

    context "when calling Player class methods" do
        
        before(:each) do
            player_name = "Sam"
            player_marker = "X"
            @player = create_player({ name: player_name, mark: player_marker})
        end
        
        it "should return 'Sam' when 'name' method is called", positive: true do
            expect(@player.name).to eq("Sam")
        end

        it "should return 'X' when 'mark' method is called", positive: true do
            expect(@player.mark).to eq("X")
        end
    end
end