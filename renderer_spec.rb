require_relative './renderer.rb'
require_relative './renderer_interface_spec.rb'

RSpec.describe(Renderer) do
    context "When testing Render class" do
        @object = Renderer.new
        include_examples "RendererInterfaceTests", @object

        context "When testing Renderer class specific methods" do
            it "should raise NotImplementedError on 'render' method", positive: true do
                @renderer = Renderer.new
                expect{ @renderer.render }.to raise_error(NotImplementedError)
            end
        end
    end
end