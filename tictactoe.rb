require 'pry'

module Board
    #Creates the board and displays it. In module so the Game class can access it.
      def new_board
        @@lines = [1, 2, 3, 4, 5, 6, 7, 8, 9]
      end
  
      def display_board
          puts ""
          print @@lines[0..2].to_s.gsub('"', '')
          puts ""
          print @@lines[3..5].to_s.gsub('"', '')
          puts ""
          print @@lines[6..8].to_s.gsub('"', '')
          puts ""
      end
  end
  
  class Game
    include Board
  #When Game.new is called, sets up the game
    def initialize
      new_board
      start
    end
  
    def start
      puts "New game has begun! Enter a name for P1: X"
      $p1_name = gets.chomp
      puts "X: #{$p1_name}"
      puts "Enter a name for P2: O"
      $p2_name = gets.chomp
      puts "X: #{$p1_name}"
      puts "O: #{$p2_name}"
      puts "--------------"
      x_choice
    end
  
    # Takes P1 and P2's inputs for their moves
    def x_choice
      display_board
      puts "#{$p1_name}: Where will X go (between 1-9)?"
      move = gets.chomp.to_i
      if @@lines[move - 1] == "X"
        puts "A move was already played in that space. Try again!"
        x_choice
      elsif @@lines[move - 1] == "O"
        puts "A move was already played in that space. Try again!"
        x_choice
      else
      x_move(move)
  
      end
    end
  
    def o_choice
      display_board
      puts "#{$p2_name}: Where will O go (between 1-9)?"
      move = gets.chomp.to_i
      if @@lines[move - 1] == "X"
        puts "A move was already played in that space. Try again!"
        o_choice
      elsif @@lines[move - 1] == "O"
        puts "A move was already played in that space. Try again!"
        o_choice
      else
      o_move(move)
      end
    end
  
    #Places X and O on board, displays the updated board, and checks for the win
    def x_move(placement)
      @@lines[placement - 1] = "X"
      if draw? == true
        display_board
        puts "Draw! Start a new game? (y/n)"
        next_game_start = gets.chomp.downcase
        if next_game_start == 'y'
          initialize
        end
      elsif x_win? == true
        display_board
        puts "#{$p1_name} wins!"
        puts "Start a new game? (y/n)"
        next_game_start = gets.chomp.downcase
        if next_game_start == 'y'
          initialize
        end
      else o_choice
      end
    end
  
    def o_move(placement)
      @@lines[placement - 1] = "O"
      if draw? == true
        display_board
        puts "Draw! Start a new game? (y/n)"
        next_game_start = gets.chomp.downcase
        if next_game_start == 'y'
          initialize
        end
      elsif o_win? == true
        display_board
        puts "#{$p2_name} wins!"
        puts "Start a new game? (y/n)"
        next_game_start = gets.chomp.downcase
        if next_game_start == 'y'
          initialize
        end
      else x_choice
      end
    end
  
    def x_win?
      if (@@lines[0] == "X" && @@lines[1] == "X" && @@lines[2] == "X") || (@@lines[3] == "X" && @@lines[4] == "X" && @@lines[5] == "X") || (@@lines[6] == "X" && @@lines[7] == "X" && @@lines[8] == "X") || (@@lines[0] == "X" && @@lines[3] == "X" && @@lines[6] == "X") || (@@lines[1] == "X" && @@lines[4] == "X" && @@lines[7] == "X") || (@@lines[2] == "X" && @@lines[5] == "X" && @@lines[8] == "X") || (@@lines[0] == "X" && @@lines[4] == "X" && @@lines[8] == "X") || (@@lines[2] == "X" && @@lines[4] == "X" && @@lines[6] == "X")
        return true
      else return false
      end
    end
  
    def o_win?
      if (@@lines[0] == "O" && @@lines[1] == "O" && @@lines[2] == "O") || (@@lines[3] == "O" && @@lines[4] == "O" && @@lines[5] == "O") || (@@lines[6] == "O" && @@lines[7] == "O" && @@lines[8] == "O") || (@@lines[0] == "O" && @@lines[3] == "O" && @@lines[6] == "O") || (@@lines[1] == "O" && @@lines[4] == "O" && @@lines[7] == "O") || (@@lines[2] == "O" && @@lines[5] == "O" && @@lines[8] == "O") || (@@lines[0] == "O" && @@lines[4] == "O" && @@lines[8] == "O") || (@@lines[2] == "O" && @@lines[4] == "O" && @@lines[6] == "O")
        return true
      else return false
      end
    end

  def draw?
    board_full? && !x_win? && !o_win?
  end

  def board_full?
    @@lines.all?{ |element| element == "X" || element == "O"}
  end
  
  end
  
  def new_game
      puts "Start a new game? (y/n)"
      new_game_start = gets.chomp.downcase
      if new_game_start == 'y'
          play = Game.new
      end
  end
  
  new_game