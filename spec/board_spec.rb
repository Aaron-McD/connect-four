require './lib/board.rb'

describe "Board" do
    board = Board.new
    it "is always 6 deep" do
        expect(board.board.length).to eql(6)
    end

    it "is always 7 wide" do
        expect(board.board[0].length).to eql(7)
    end

    describe "#[]" do
        it "returns the value of the board at that point" do
            board.board[5][5] = 5
            expect(board[5][5]).to eql(5)
            board.board[5][5] = nil
        end
    end

    describe "#insert" do
        it "accepts a value and an x location and puts the value as deep as it can go" do
            board.insert("red", 3)
            expect(board[5][3]).to eql("red")
        end

        it "stacks ontop of the previous items" do
            board.insert("red", 3)
            expect(board[4][3]).to eql("red")
        end

        it "returns false if the slot is full" do
            board.insert("red", 3)
            board.insert("red", 3)
            board.insert("red", 3)
            board.insert("red", 3)
            expect(board.insert("red", 3)).to eql(false)
        end
    end
    
    describe "#reset" do
        it "sets all board slots back to nil" do
            board.reset
            expect(board.board.all? { |arr| arr.all? { |item| item == nil } }).to eql(true)
        end
    end
end