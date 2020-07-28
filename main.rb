require_relative "lib/game.rb"

# Example code to run the game and work with the API

=begin
puts "Please enter the single character symbol for player one: "
player1 = get_symbol
puts "Please enter the single character symbol for player two: "
player2 = get_symbol
=end
player1 = "r"
player2 = "b"

game = Game.new(player1, player2)

until game.won?
    puts game.pretty_print
    game.play_round
end

puts game.pretty_print
puts "#{game.winner == player1 ? "Player 1" : "Player 2"} has won!"