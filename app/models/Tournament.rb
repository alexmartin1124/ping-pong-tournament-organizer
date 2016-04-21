require_relative 'Player.rb'
require 'pry'
class Tournament


attr_accessor :players, :size, :count
attr_reader :round_winners 


def initialize(players, size)
  @players = players
  @size = size
  @round_winners = []
  @count = 0
end

def run
  if size == 4
    four_player_tournament
  elsif size == 8
    eight_player_tournament
  elsif size == 16
    sixteen_player_tournament
  end
  puts "Congratulations, #{round_winners[0].name}!"
end

def four_player_tournament
  semi_finals
  finals
end

def five_player_tournament
  bye
end

def bye
  puts "#{player[0].name} has a bye and will move automatically to the next round."
  byed_player = players.shift
end

def eight_player_tournament
  elite_eight
  semi_finals
  finals
end

def sixteen_player_tournament
  sweet_sixteen
  elite_eight
  semi_finals
  finals
end


def bracket_display
  puts "PLAYER1 -------"
  puts "               |--PLAYER1 -------"
  puts "PLAYER2 -------                  |"
  puts "                                 |--PLAYER1"        
  puts "PLAYER3 -------                  |**WINNER**"
  puts "               |--PLAYER3 -------"
  puts "PLAYER4 -------"
end


def sweet_sixteen
  puts "SWEET SIXTEEN"
  game(players[0], players[1])
  game(players[2], players[3])
  game(players[4], players[5])
  game(players[6], players[7])
  game(players[8], players[9])
  game(players[10], players[11])
  game(players[12], players[13])
  game(players[14], players[15])
  round_ender
end

def idk(number)
  x, y = 0, 1
  number.times do 
    game(players[x], players[y])
    x+=2 & y +=2
  end
end

def elite_eight
  puts "ELITE EIGHT"
  game(players[0], players[1])
  game(players[2], players[3])
  game(players[4], players[5])
  game(players[6], players[7])
  round_ender
end

def semi_finals
  puts "SEMIFINALS:"
  game(players[0], players[1])
  game(players[2], players[3])
  round_ender
end

def finals
  puts "FINALS:"
  game(players[0], players[1])
  players.delete_if {|player| !round_winners.include?(player)}
end

def round_ender
  players.delete_if {|player| !round_winners.include?(player)}
  round_winners.clear
end

def get_user_input
  gets.chomp.strip
end

def game(player1, player2)
  @count += 1
  puts "Game #{count}: #{player1.name} vs. #{player2.name}"
  puts "Enter winner:"
  loop do
    answer = get_user_input
    if answer.downcase == player1.name.downcase
     round_winners << player1 
     break
    elsif answer.downcase == player2.name.downcase 
      round_winners << player2
      break
    else
      puts "Invalid input."
    end
  end
end

#Find a way to at least view all matchups for a given round, if not 



end