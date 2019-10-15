require 'bundler'
require 'pry'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

player1 = Player.new("Sangoku")
player2 = HumanPlayer.new("Gros-Costaud")
player3 = Player.new("Lufi")
player4 = Player.new("Chirac")

puts "À ma droite le légendaire #{player1.name} !"
puts "À ma gauche le féroce #{player2.name} !"
puts " "
tour = 0

while player1.life_points > 0 && player2.life_points > 0
puts "--------------- Tour #{tour+=1} ---------------"
puts "Voici l'état des joueurs :"
player1.show_state
player2.show_state
puts " "
puts "Passons à la phase d'attaque :"
puts player1.attacks(player2)
if player2.life_points <= 0 #au cas où le joueur 2 est mort, il ne peut pas lancer d'attaque
    break
end
puts player2.attacks(player1)
puts " "
end




binding.pry