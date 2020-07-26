require './lib/grid.rb'

describe "Grid" do
    describe "#test" do
        it "returns hello test" do
            grid = Grid.new
            expect(grid.test).to eql("hello test")
        end
    end
end