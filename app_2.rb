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
puts "-------- WELCOME IN SUPER FIGHT GAMES --------"
puts "L'objectif est de défoncer un maximum de monde ! "
puts "         $$$$    INSERT COIN    $$$$          "
puts "-------------------------------------------------"
puts "                  LET'S START"
puts " "
puts "Quel est le nom de ton guerrier ? "
name = gets.chomp
hero = HumanPlayer.new(name)
puts " "
puts "#{name}, une grande mission t'attend..."
puts "...de nombreux méchants te guettent sur la route !"

@enemies =  []
player1 = Player.new("Gros Pas Bo")
player2 = Player.new("Super Vilain")
@enemies << player1
@enemies << player2

while hero.life_points >0 && (player1.life_points > 0 || player2.life_points >0)
    puts hero.show_state
    puts "Quelle action veux-tu effectuer ? "
    puts "a - chercher une meilleure arme"
    puts "s - chercher à se soigner "
    puts " "
    puts "Attaquer un joueur en vue :"
    print "0 - "
    print player1.show_state
    print "1 - "
    print player2.show_state
    action = gets.chomp
    puts " "
    if action == "a" #les différentes actions
        hero.search_weapon
    elsif action == "s"
       hero.search_health_pack
       hero.show_state
    elsif action == "0"
        hero.attacks(player1)
    elsif action == "1"
        hero.attacks(player2)
    else 
        puts "Veuillez choisir une des actions"
    end
    puts " "
    total_life_points = [] #définition de la somme de tous les points de vie des ennemis
    @enemies.each do |enemy| #ajout des points de vies dans cette array
        total_life_points << enemy.life_points
    end

    if total_life_points.sum <= 0 #si la somme des points de vie des ennemis est nulle alors on stop la boucle while en cours
        break
    else
        puts "Les autres joueurs t'attaquent !" #attaque des ennemis
        @enemies.each{ |enemy|
            if enemy.life_points > 0 then enemy.attacks(hero) end}
            puts "\n"
            puts "> press ENTER to continue"
            gets.chomp
    end
end

puts "-------- BRAVO TU AS GAGNÉ --------"
puts "     $$$$    INSERT COIN    $$$$          "
puts "------------------------------------------"

#binding.pry