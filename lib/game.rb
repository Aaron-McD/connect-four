require_relative "board.rb"

class Game
    attr_reader :board, :symbol1, :symbol2
    def initialize(symbol1, symbol2)
        @symbol1 = symbol1
        @symbol2 = symbol2
        @board = Board.new
    end

    def player_insert(sym, x_coor)
        return self.board.insert(sym, x_coor)
    end

    def reset
        self.board.reset
    end
end