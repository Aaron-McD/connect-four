
class Board
    attr_reader :board
    def initialize
        @board = []
        6.times do
            @board.append(Array.new(7, nil))
        end
    end

    def [](index)
        return @board[index]
    end

    def insert(value, index)
        depth = 0
        if(self.board[0][index] == nil)
            while(self.board[depth + 1][index] == nil)
                depth += 1
                if(depth + 1 == 6)
                    break
                end
            end
            board[depth][index] = value
            return true
        else
            return false
        end
    end

    def reset
        @board = []
        6.times do
            @board.append(Array.new(7, nil))
        end
    end
end