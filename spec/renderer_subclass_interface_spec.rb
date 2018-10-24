RSpec.shared_examples("RendererSubclassInterfaceTests") do |parameter|
    let(:something) { parameter }
    context "When testing Renderer Subclasses for subclass method implementation requirements" do
        it "should respond to 'render' method", interface: true do
            expect(parameter).to respond_to(:render)
        end
    end
end
