require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

print "Entrez votre nom : "
player_name = gets.chomp
my_game = Game.new(player_name)

while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  puts "Votre choix : "
  user_choice = gets.chomp
  my_game.menu_choice(user_choice)
  my_game.enemies_attack if my_game.is_still_ongoing?
end

my_game.end
