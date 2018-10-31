require_relative '../lib/parser.rb'

RSpec.describe(Parser) do
    context "When creating a Parser" do
        it "should instantiate a Parser object", positive: true do
            parser = Parser.new
            expect(parser).to_not be(nil)
        end
    end

    # I am not sure how to test this.
end
