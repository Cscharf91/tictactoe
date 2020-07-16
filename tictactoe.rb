require 'pry'

def new_game
    puts "Start a new game? (y/n)"
    new_game_start = gets.chomp.downcase
    if new_game_start == 'y'
        play = Game.new
    end
end

