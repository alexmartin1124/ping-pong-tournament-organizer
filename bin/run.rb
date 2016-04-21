require_relative '../app/runners/cli.rb'

program = Program.new
program.intro
program.setup
program.run_tournament
program.play_again?