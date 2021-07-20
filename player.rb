 require 'pry'
class Player
    attr_accessor :name, :life_points

def initialize(player_name)
    @name = player_name
    @life_points = 10
    #@all_users = Array.new
    #@all_users << self
end

def show_state
    puts "#{name} à #{life_points} points de vie"
end

def gets_damage(damage)
    if @life_points>0 
        @life_points = @life_points - damage
    elsif @life_points <=0 
        puts "Le joueur #{name} à été tué !"
    end
end

def compute_damage
    return rand(1..6)
end

def atacks(player)
    damage_done = compute_damage
    puts " Bam..#{name} à enlever #{damage_done} PV #{player.name} "
    player.gets_damage(damage_done)
    puts " Ouch ! #{player.name} à subi #{damage_done} PV"
end
def restant
    puts "Le match se termine #{@name} avec #{@life_points} PV restant !"
end

end

player1 = Player.new("José")
player2 = Player.new("Amanda")

while player1.life_points>0 && player2.life_points>0
player1.atacks(player2)
break if player1.life_points<=0 || player2.life_points<=0
player2.atacks(player1)

player1.show_state
player2.show_state
end
player1.restant
player2.restant




