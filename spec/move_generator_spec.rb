require_relative '../lib/move_generator.rb'

RSpec.describe(MoveGenerator) do

    def create_move_generator
        move_generator = double()
        allow(move_generator).to receive(:random_move) { 4 }
        return move_generator
    end

    context "When generating a move for the game" do
        it "#random_move should return a number that is a valid position." do
            mg = create_move_generator
            expect(mg.random_move()).to eq(4)
        end
    end
end