# 1. All players pick either Rock, Paper, or Scissors.
# 2. Compare: rock > scissors, scissors > paper, paper > rock, or tie if same.
# 3. play again?

class Player
  def move
    begin
      puts "Pick one: (r, p, s):"
      player_choice = gets.chomp.downcase
    end until Game::CHOICES.keys.include?(player_choice)
    return player_choice
  end
end

class Computer
  def move
    return Game::CHOICES.keys.sample
  end
end

class Game
  CHOICES = {'r' => 'Rock', 'p' => 'Paper', 's' => 'Scissors'}
  attr_reader :player, :computer

  def initialize
    @player = Player.new
    @computer = Computer.new
  end

  def determine_winner(player_choice, computer_choice)
    tie = false
    if player_choice == computer_choice
      puts "It's a tie!"
      tie = true
    elsif (player_choice == 'r' && computer_choice == 's')
      puts "Rock smashes Scissors!, Player wins!"
    elsif (player_choice == 's' && computer_choice == 'r')
      puts "Rock smashes Scissors!, Player loses!"
    elsif (player_choice == 's' && computer_choice == 'p')
      puts "Scissors cuts Paper! Player wins!"
    elsif (player_choice == 'p' && computer_choice == 's')
      puts "Scissors cuts Paper! Player loses!"
    elsif (player_choice == 'p' && computer_choice == 'r')
      puts "Paper wraps Rock! Player wins!"
    elsif (player_choice == 'r' && computer_choice == 'p')
      puts "Paper wraps Rock! Player loses!"
    end
    return tie
  end

  def play_again
    puts "Play again? (y/n)"
    if gets.chomp.downcase == 'y'
      rematch = Game.new
      rematch.play
    end
  end

  def play
    puts "Welcome to Rock, Paper, Scissors"
    begin
      player_choice = player.move
      computer_choice = computer.move
    end until determine_winner(player_choice, computer_choice) == false
    play_again
  end
end

game = Game.new
game.play