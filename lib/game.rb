class Game
    attr_accessor :human_player, :enemies
  
    def initialize(human_player_name)
      @human_player = HumanPlayer.new(human_player_name)
      @enemies = []
      
      4.times do |i|
        @enemies << Player.new("Player#{i + 1}")
      end
    end
  
    def kill_player(player)
      @enemies.delete(player)
    end
  
    def is_still_ongoing?
      @human_player.life_points > 0 && !@enemies.empty?
    end
  
    def show_players
      puts @human_player.show_state
      puts "Il reste #{enemies.length} ennemis sur le champ de bataille."
    end
  
    def menu
      puts "Quelle action veux-tu effectuer ?"
      puts "a - chercher une meilleure arme"
      puts "s - chercher à se soigner"
      puts ""
      puts "attaquer un joueur en vue :"
  
      @enemies.each_with_index do |player, index|
        puts "#{index} - #{player.show_state}" if player.life_points > 0
      end
    end
  
    def menu_choice(choice)
      case choice
      when "a"
        @human_player.search_weapon
      when "s"
        @human_player.search_health_pack
      else
        if choice.to_i.between?(0, @enemies.length - 1) && @enemies[choice.to_i].life_points > 0
          @human_player.attacks(@enemies[choice.to_i])
          kill_player(@enemies[choice.to_i]) if @enemies[choice.to_i].life_points <= 0
        else
          puts "Action non reconnue, veuillez choisir une action valide."
        end
      end
    end
  
    def enemies_attack
      puts "Les autres joueurs t'attaquent !"
  
      @enemies.each do |player|
        player.attacks(@human_player) if player.life_points > 0
      end
    end
  
    def end
      puts "La partie est finie"
      if @human_player.life_points > 0
        puts "BRAVO ! TU AS GAGNE !"
      else
        puts "Loser ! Tu as perdu !"
      end
    end
  end
  