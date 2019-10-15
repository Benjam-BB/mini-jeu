require 'bundler'
Bundler.require
require 'pry'
require_relative 'lib/game'
require_relative 'lib/player'


puts "                  _......._"
puts "              .-'.'.'.'.'.'.`-."
puts "            .'.'.'.'.'.'.'.'.'.`."
puts "           /.'.'               '.\ "
puts "           |.'    _.--...--._     |"
puts "           \    `._.-.....-._.'   /"
puts "           |     _..- .-. -.._   |"
puts "        .-.'    `.   ((@))  .'   '.-."
puts "       ( ^ \      `--.   .-'     / ^ )"
puts "        \  /         .   .       \  /"
puts "        /          .'     '.  .-    \ "
puts "       ( _.\    \ (_`-._.-'_)    /._\)"
puts "        `-' \   ' .--.          / `-'"
puts "            |  / /|_| `-._.'\   |"
puts "            |   |       |_| |   /-.._"
puts "        _..-\   `.--.______.'  |"
puts "             \       .....     |"
puts "              `.  .'      `.  /"
puts "                \           .'"
puts "                 `-..___..-`"
puts "-------- WELCOME IN SUPER FIGHT GAME --------"
puts "  L'objectif est de défoncer tous les vilains ! "
puts "       $$$$    INSERT COIN TO START  $$$$          "
puts "-------------------------------------------------"
puts "                  LET'S START"
puts " "
puts "Quel est le nom de ton guerrier ? "
print "> "
name = gets.chomp
my_game = Game.new(name)
puts " "
puts "#{name}, une grande mission t'attend..."
puts "...de nombreux méchants te guettent sur la route !"
puts "Es-tu prêt jeune padawan? "
print "> "
gets.chomp

while my_game.is_still_ongoing? == true
	puts "---"
	my_game.show_players #affiche les personnages restants
	puts "---"
	my_game.menu #affiche le menu
	puts "\nQue veux tu faire ? Reflechis bien..."
	print "> "
    action = gets.chomp
    my_game.menu_choice(action) #prend en compte le choix de l'utilisateur
    my_game.enemies_attack 
    puts "\nPress ENTER to continue"
    print "> "
    gets.chomp
end

my_game.the_end