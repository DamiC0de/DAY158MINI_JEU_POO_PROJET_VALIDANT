class Player
    attr_accessor :name, :life_points
  
    def initialize(name)
      @name = name
      @life_points = 10
    end
  
    def show_state
      if @life_points > 0
        puts "#{@name} a #{@life_points} points de vie"
      end
    end
  
    def gets_damage(damage)
      @life_points -= damage
  
      if @life_points <= 0
        puts "Le joueur #{@name} a été tué !"
      end
    end
  
    def attacks(target)
        puts "Le joueur #{@name} attaque le joueur #{target.name}"
        damage = compute_damage
        target.gets_damage(damage)
        
        # Ajouter cette condition pour vérifier si le joueur cible est encore en vie avant d'afficher les dégâts
        if target.life_points > 0
          puts "Il lui inflige #{damage} points de dommages"
        end
      end
      
  
    def compute_damage
      return rand(1..6)
    end
end



class HumanPlayer < Player
    attr_accessor :weapon_level
  
    def initialize(name)
      super(name)
      @life_points = 100
      @weapon_level = 1
    end
  
    def show_state
      puts "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
    end

    def compute_damage
        rand(1..6) * @weapon_level
    end

    def search_weapon
        new_weapon_level = rand(1..6)
        puts "Tu as trouvé une arme de niveau #{new_weapon_level}"
    
        if new_weapon_level > @weapon_level
          @weapon_level = new_weapon_level
          puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
        else
          puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
        end
    end

    def search_health_pack
        health_pack_dice = rand(1..6)
    
        case health_pack_dice
        when 1
          puts "Tu n'as rien trouvé... "
        when 2..5
          @life_points += 50
          # Vérifie si les points de vie dépassent 100 et les limite à 100
          @life_points = [@life_points, 100].min
          puts "Bravo, tu as trouvé un pack de +50 points de vie !"
        when 6
          @life_points += 80
          # Vérifie si les points de vie dépassent 100 et les limite à 100
          @life_points = [@life_points, 100].min
          puts "Waow, tu as trouvé un pack de +80 points de vie !"
        end
    end
end
  