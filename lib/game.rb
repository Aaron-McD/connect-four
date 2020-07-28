require_relative "board.rb"

class Game
    attr_reader :board, :winner
    def initialize(symbol1, symbol2)
        @symbol1 = symbol1
        @symbol2 = symbol2
        @board = Board.new
        @winner = nil
        @previous_pos = []
        @rounds = 0
        @previous_player = nil
        @current_player = @symbol1
    end

    def player_insert(sym, x_coor)
        if self.board.insert(sym, x_coor)
            i = 0
            while self.board[i][x_coor] != sym
                i += 1
            end
            @previous_pos = [i, x_coor]
            return true
        else
            return false
        end
    end

    def reset
        self.board.reset
        @winner = nil
        @rounds = 0
    end

    def won?
        if(@rounds < 7)
            return false
        else
            if(four_horizontal? || four_verticle? || four_diagonal?)
                @winner = @previous_player
                return true
            else
                return false
            end
        end
    end

    def play_round
        puts "It is #{@current_player == @symbol1 ? "player 1" : "player 2"}'s turn, please type in a slot number to drop your piece in: "
        input = gets.chomp.to_i
        until player_insert(@current_player, input)
            puts "Please enter a valid location that is not full already: "
            input = gets.chomp.to_i
        end
        @rounds += 1
        @previous_player = @current_player
        @current_player = @current_player == @symbol1 ? @symbol2 : @symbol1
    end

    def pretty_print
        out_string = "  0   1   2   3   4   5   6  \n"
        self.board.board.each do |array|
            array.each do |item|
                out_string += "| #{item == nil ? " " : item} "
            end
            out_string += "|\n"
        end
        return out_string
    end

    private

    def four_horizontal?
        amount = 1
        x = @previous_pos[1]
        y = @previous_pos[0]
        while x < 6
            x += 1
            if self.board[y][x] == @previous_player
                amount += 1
            else
                break
            end
        end
        x = @previous_pos[1]
        while x > 0
            x -= 1
            if self.board[y][x] == @previous_player
                amount += 1
            else
                break
            end
        end
        return amount >= 4
    end

    def four_verticle?
        amount = 1
        x = @previous_pos[1]
        y = @previous_pos[0]
        while y < 5
            y += 1
            if self.board[y][x] == @previous_player
                amount += 1
            else
                break
            end
        end
        y = @previous_pos[0]
        while y > 0
            y -= 1
            if self.board[y][x] == @previous_player
                amount += 1
            else
                break
            end
        end
        return amount >= 4
    end

    def four_diagonal?
        amount_left_to_right = 1
        amount_right_to_left = 1
        x = @previous_pos[1]
        y = @previous_pos[0]
        while x < 6 && y > 0
            x += 1
            y -= 1
            if self.board[y][x] == @previous_player
                amount_left_to_right += 1
            else
                break
            end
        end
        x = @previous_pos[1]
        y = @previous_pos[0]
        while x > 0 && y < 5
            x -= 1
            y += 1
            if self.board[y][x] == @previous_player
                amount_left_to_right += 1
            else
                break
            end
        end
        x = @previous_pos[1]
        y = @previous_pos[0]
        while x < 6 && y < 5
            x += 1
            y += 1
            if self.board[y][x] == @previous_player
                amount_right_to_left += 1
            else
                break
            end
        end
        x = @previous_pos[1]
        y = @previous_pos[0]
        while x > 0 && y > 0
            x -= 1
            y -= 1
            if self.board[y][x] == @previous_player
                amount_right_to_left += 1
            else
                break
            end
        end
        if amount_left_to_right >= 4
            return true
        elsif amount_right_to_left >= 4
            return true
        else
            return false
        end
    end
end