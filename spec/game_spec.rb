require "./lib/game.rb"

describe Game do
    game = Game.new("r", "b")
    it "has a game board that is of class Board" do
        expect(game.board.class).to eql(Board)
    end

    describe "#player_insert" do
        it "inserts a symbol into the games board" do
            game.player_insert("r", 3)
            expect(game.board[5][3]).to eql("r")
        end

        it "returns true if a piece successfully entered the board" do
            expect(game.player_insert("r", 3)).to eql(true)
        end
    end

    describe "#reset" do
        it "resets the game board" do
            game.reset
            expect(game.board.board.all? { |arr| arr.all? { |item| item == nil } }).to eql(true)
        end
    end

    describe "#win?" do
        it "returns false when the game has just begun" do
            game = Game.new("r","b")
            expect(game.won?).to eql(false)
        end
    end
end