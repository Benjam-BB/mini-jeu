#require "pry"

class Player
    attr_accessor :name, :life_points
    @@all_players = []

    def initialize (name)
        @name = name.to_s
        @life_points = 10
        @@all_players << self
    end

    def self.all
        return @@all_players
    end

    def show_state
        unless life_points > 0
        puts "#{@name} est mort avec #{@life_points} points de vie"
        else 
        puts "#{@name} a #{@life_points} points de vie"
        end
    end 

    def gets_damage(damage)
        damage = damage.to_i
        @life_points -= damage 
        if @life_points <= 0
           #pour que jamais la valeur de life_point soit en dessous de 0
           puts "Le joueur #{@name} a été tué !"
        end
    end

    def attacks(target)
        puts "Le joueur #{@name} attaque le joueur #{target.name}..."
        attack = compute_damage()
        puts "il lui inflige #{attack} points de dommage"
        target.gets_damage(attack)
    end

    def compute_damage
        return rand (1..6)
    end
end 

class HumanPlayer < Player 
    attr_accessor :weapon_level

    def initialize (name)
        super(name)
        @weapon_level = 1
        @life_points = 100
    end

    def show_state
        puts "#{@name} a #{@life_points} points de vie, et une arme de niveau #{@weapon_level}"
    end 

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon = rand (1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon}"
        if new_weapon > @weapon_level
            @weapon_level = new_weapon
            puts "Youhou ! Elle est meilleure que ton arme actuelle : tu la prends."
        else 
            puts "Fooooock... elle n'est pas mieux que ton arme actuelle...tu la laisses"
        end
    end

    def search_health_pack
        health_pack = rand (1..6)
        puts "Tu tentes de trouver une potion de soin dans un buisson..."
        if health_pack == 1
            puts "...Scheisse, tu n'as rien trouvé... "
        elsif health_pack == 6
            if life_points <= 20
            @life_points += 80
            else 
                @life_points = 100
            end
            puts "...Waow, tu as trouvé un pack de +80 points de vie !"
        else
            if life_points <= 50
            @life_points += 50
            else
                life_points = 100
            end
            puts "...Bravo, tu as trouvé un pack de +50 points de vie !"
        end
    end
end
#binding.pry
#puts "end of file"