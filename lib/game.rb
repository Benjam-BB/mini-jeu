class Game
    attr_accessor :human_player
    attr_accessor :enemies
    
    def initialize(name)
        @enemies = []
        for i in 0..3
			@enemies << Player.new("vilain_#{i}") 
		end
        @human_player = HumanPlayer.new(name)
    end

    def kill_player(player) #supprime un ennemi mort de l'array
            @enemies.delete_if{|enemi| enemi.name == player.name}
    end

    def is_still_ongoing? #si la partie continue toujours
           if  @enemies.size > 0 && @human_player.life_points > 0
            return true
           end
    end

    def show_players
        @human_player.show_state
        puts "Il reste #{@enemies.size} vilain(s)"
    end

    def menu
        puts "\nQuelle action veux-tu effectuer ?\na - Chercher une meilleure arme\ns - Chercher une potion de soin"
		puts "\nAttaquer un vilain en vue :"
		for i in 0...@enemies.size
			print "#{i} - "
			print @enemies[i].show_state
		end
    end

    def menu_choice(action)
        if action == "a" then @human_player.search_weapon
        elsif action == "s"
             @human_player.search_health_pack
             @human_player.show_state
        else
			for i in 0...@enemies.size
				if action.to_i == (i)
					puts "> FIGHT!"
					@human_player.attacks(@enemies[i])
					if @enemies[i].life_points <= 0 then kill_player(@enemies[i]) end
				end
				
			end
		end
    end

    def enemies_attack
        if @enemies.size > 0 #condition pour éviter que les ennemis attaquent alors qu'ils sont tous mort
		puts "\n> Attention le(s) vilain(s) attaque(nt) :"
        @enemies.each {|enemi| enemi.attacks(@human_player)}
        else
        puts "\nHey me je crois bien que tu as dégommé tous les vilains ! "
        end
    end
    
    def the_end
        unless @human_player.life_points > 0
             puts "------- GAME OVER -------"
             puts "------- TRY AGAIN -------"
             puts "$$$$    INSERT 2 COINS    $$$$          "
             puts "------------------------------------------"
        else 
            puts "-------- BRAVO TU AS GAGNÉ --------"
            puts "     $$$$    INSERT COIN    $$$$          "
            puts "------------------------------------------"
		end
	end
end