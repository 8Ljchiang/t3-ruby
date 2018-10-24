RSpec.shared_examples("RendererInterfaceTests") do |parameter|
    let(:something) { parameter }

    context "When implementing RendererInterface" do
        it "should implement 'render' method", interface: true do
            expect(parameter).to respond_to(:render)
        end
    end
end