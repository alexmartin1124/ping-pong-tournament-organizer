require_relative '../models/Player.rb'
require_relative '../models/Tournament.rb'
require 'pry'

class Program

attr_reader :players
attr_accessor :number_of_players

def initialize
  @players = []
end


def intro
  puts "Welcome to Ping Pong! How many people will be playing in this tournament? Choose 4, 8, or 16."
  @number_of_players = get_user_input.to_i
  if number_of_players != 4 && number_of_players != 8 && number_of_players != 16
    puts "Sorry. Wrong number of players."
    abort
  end
end

def get_user_input
  gets.chomp.strip
end

def get_players
  number_of_players.times do
    player_name = get_user_input
    player = Player.new(player_name)
    players << player
  end
  # puts "Please enter the name of each player:"
  # @@number_of_players.times do
  #   player_name = get_user_input
  #   User.all.each do |user|
  #     @count = 0
  #     if user.name.downcase == player_name.downcase
  #       players << user
  #       @count +=1
  #     end
  #   end
  #   if @count == 0
  #       user = User.new(player_name)
  #       players << user
  #   end
  # end
  # tournament = Tournament.new(players, @@number_of_players)
end

def setup
  puts "Would you like to (1) choose the order or (2) have the order randomized for you?"
  answer = get_user_input.to_i
  if answer == 1
    puts "Please enter the name of each player in the order of the first round:"
    get_players
  elsif answer == 2
    puts "Please enter the name of each player:"
    get_players
    players.shuffle!
  else 
    puts "Invalid response."
    setup
  end
end



def run_tournament
  tournament = Tournament.new(players, number_of_players)
  tournament.run
end

def play_again?
  puts "Start a new tournament? Y/N"
  answer = get_user_input
  loop do
    if answer.downcase == "y"
      reset
      intro
      setup
      run_tournament
      play_again?
    elsif answer.downcase == "n"
      puts "Thanks for playing."
      abort
    else
      puts "Invalid input."
      play_again?
    end
  end
end


def reset
  players.clear
  @number_of_players = 0
end



end