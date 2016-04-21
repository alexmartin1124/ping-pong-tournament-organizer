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


def five_player_tournament
  bye
end

def bye
  puts "#{player[0].name} has a bye and will move automatically to the next round."
  byed_player = players.shift
end

def four_player_tournament
  semi_finals
  finals
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
  puts "PLAYERA -------"
  puts "               |--PLAYERA -------"
  puts "PLAYERB -------                  |"
  puts "                                 |--PLAYERA"        
  puts "PLAYERC -------                  |"
  puts "               |--PLAYERC -------"
  puts "PLAYERD -------"
  puts ""
  puts "PLAYERE -------"
  puts "               |--PLAYERE -------"
  puts "PLAYERF -------                  |"
  puts "                                 |--PLAYERE"        
  puts "PLAYERG -------                  |"
  puts "               |--PLAYERG -------"
  puts "PLAYERH -------"
  puts ""
  puts "PLAYERI -------"
  puts "               |--PLAYERI -------"
  puts "PLAYERJ -------                  |"
  puts "                                 |--PLAYERI"        
  puts "PLAYERK -------                  |"
  puts "               |--PLAYERK -------"
  puts "PLAYERL -------"
  puts ""
  puts "PLAYERM -------"
  puts "               |--PLAYERM -------"
  puts "PLAYERN -------                  |"
  puts "                                 |--PLAYERM"        
  puts "PLAYERO -------                  |"
  puts "               |--PLAYERO -------"
  puts "PLAYERP -------"
end



def round(number_of_games)
  x, y = 0, 1
  number_of_games.times do 
    game(players[x], players[y])
    x+=2 
    y+=2
  end
end

def sweet_sixteen
  puts "SWEET SIXTEEN"
  round(8)
  round_ender
end

def elite_eight
  puts "ELITE EIGHT"
  round(4)
  round_ender
end

def semi_finals
  puts "SEMIFINALS:"
  round(2)
  round_ender
end

def finals
  puts "FINALS:"
  round(1)
  round_ender("finals")
end

def round_ender(arg = nil)
  players.delete_if {|player| !round_winners.include?(player)}
  round_winners.clear unless arg == "finals"
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
#Make a bracket name formatter


end