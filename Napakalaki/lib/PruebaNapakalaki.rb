#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
module NapakalakiGame

require_relative 'Prize.rb'
require_relative 'BadConsequence.rb'
require_relative 'Monster.rb'
require_relative 'TreasureKind.rb'

reward = Prize.new(2, 1)
#puts reward.to_s

reward.level

malrollo = BadConsequence.newLevelSpecificTreasures("PARMOR",1,TreasureKind::ARMOR,TreasureKind::HELMET)
#puts malrollo.to_s

monstruo=Monster.new("Prueba",2,reward,malrollo)
#puts monstruo.to_s

monsters=Array.new

P1 = Prize.new(2,1)
BC1 = BadConsequence.newLevelNumberOfTreasures("Pierdes tu armadura visible y otra oculta", 0, 1, 1)
monsters << Monster.new("3 Byakhees de bonanza", 8, P1, BC1)

# Mostrar todos los monstruos que tengan un nivel de combate superior a 10.
    monsters.each do |monstruo|
        if(monstruo.combat_level>10)
           # puts monstruo
        end
    end
        
# Mostrar todos los monstruos que tengan un mal rollo que implique sólo pérdida de niveles.
    monsters.each do |monstruo|
        if(monstruo.mal_rollo.nVisibleTreasures == 0 && monstruo.mal_rollo.nHiddenTreasures == 0 && monstruo.mal_rollo.level>0)
            #puts monstruo
        end
    end
    
# Mostrar todos los monstruos que tengan un buen rollo que indique una ganancia de niveles superior a 1.
    monsters.each do |monstruo|
        if(monstruo.reward.level>1)
            #puts monstruo
        end
    end
    
# Mostrar todos los monstruos que tengan un mal rollo que suponga la pérdida de un determinado tipo de tesoros
# ya sea visibles y/o ocultos.
    monsters.each do |monstruo|
        if(!monstruo.mal_rollo.specificHiddenTreasures.empty? || !monstruo.mal_rollo.specificVisibleTreasures.empty?)
            #puts monstruo
        end
    end

        
 monsters.each do |monstruo|
        if(monstruo.mal_rollo.specificHiddenTreasures == TreasureKind::ONEHAND)
            puts monstruo.to_s
        else if(monstruo.mal_rollo.specificVisibleTreasures == TreasureKind::ONEHAND)
            puts monstruo.to_s
        end
        end
            
 end
end
