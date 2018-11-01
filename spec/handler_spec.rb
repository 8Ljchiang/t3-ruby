require_relative '../lib/handler.rb'

RSpec.describe(Handler) do
    def create_handler()
        return Handler.new({ optionsTable: nil })
    end

    context "When creating Handler" do

        before(:each) do
            @handler = create_handler
        end

        it "should intialize a Handler object", positive: true do
            expect(@handler).to_not be(nil)
        end
        
        it "should respond to #handle" do
            expect(@handler).to respond_to(:handle)
        end
    end
end