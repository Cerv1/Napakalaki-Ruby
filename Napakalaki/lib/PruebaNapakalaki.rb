#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

require 'Prize.rb'
require 'BadConsequence.rb'
require 'Monster.rb'
require 'TreasureKind.rb'

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

#---------------------------------------------------------------------------------------------------------------------------------#

P2 = Prize.new(1, 1)
BC2 = BadConsequence.newLevelSpecificTreasures("Embobados con el lindo primigenio te descartas de tu casco visible", 0, 
            TreasureKind::HELMET, TreasureKind)
 monsters << Monster.new("Chibithulhu", 2, P2, BC2)                                                                                          
  
#---------------------------------------------------------------------------------------------------------------------------------#

P3 = Prize.new(1, 1)
BC3 = BadConsequence.newLevelSpecificTreasures("El primordial bostezo contagioso. Pierdes el calzado visible. ", 0,
                TreasureKind::SHOES, TreasureKind)
monsters << Monster.new("El sopor de Dunwich", 2, P3, BC3)

#---------------------------------------------------------------------------------------------------------------------------------#

P4 = Prize.new(4, 1)
BC4 = BadConsequence.newLevelSpecificTreasures("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. 
              Descarta 1 mano visible y 1 mano oculta", 0,  TreasureKind::ONEHAND, TreasureKind::ONEHAND)
monsters << Monster.new("Ángeles de la noche ibicenca ", 14, P4, BC4)

#---------------------------------------------------------------------------------------------------------------------------------#

P5 = Prize.new(3, 1)
BC5 = BadConsequence.newLevelNumberOfTreasures("Pierdes todos tus tesoros visibles. ", 0, 100, 0)
monsters << Monster.new("El gorrón en el umbral ", 10, P5, BC5)

#---------------------------------------------------------------------------------------------------------------------------------#

P6 = Prize.new(2, 1)
BC6 = BadConsequence.newLevelSpecificTreasures("Pierdes la armadura visible. ",0 , TreasureKind::ARMOR, TreasureKind)
monsters << Monster.new("H.P Munchcraft ", 6, P6, BC6)

#---------------------------------------------------------------------------------------------------------------------------------#

P7 = Prize.new(1, 1)
BC7 = BadConsequence.newLevelSpecificTreasures("Sientes bichos bajo la ropa. Descarta la armadura visible. ", 0, 
              TreasureKind::ARMOR, TreasureKind)
monsters << Monster.new("Bichgooth " , 2, P7, BC7)

#---------------------------------------------------------------------------------------------------------------------------------#

P8 = Prize.new(4, 2)
BC8 = BadConsequence.newLevelNumberOfTreasures("Pierdes 5 niveles y 3 tesoros visibles. ", 5, 3, 0)
monsters << Monster.new("El rey de rosa ", 13, P8, BC8)

#---------------------------------------------------------------------------------------------------------------------------------#

P9 = Prize.new(1, 1)
BC9 = BadConsequence.newLevelNumberOfTreasures("Toses los pulmones y pierdes 2 niveles. ", 2, 0, 0)
monsters << Monster.new("La que redacta en las tinieblas ", 2, P9, BC9)

#---------------------------------------------------------------------------------------------------------------------------------#

P10 = Prize.new(2, 1)
BC10 = BadConsequence.newDeath("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto. ")
monsters << Monster.new("Los hondos ", 8, P10, BC10)

#---------------------------------------------------------------------------------------------------------------------------------#

P11 = Prize.new(2, 1)
BC11 = BadConsequence.newLevelNumberOfTreasures("Pierdes 2 niveles y 2 tesoros ocultos. ", 2, 0, 2)
monsters << Monster.new("Semillas Cthulhu ", 4, P11, BC11)

#---------------------------------------------------------------------------------------------------------------------------------#

P12 = Prize.new(2, 1)
BC12 = BadConsequence.newLevelSpecificTreasures("Te intentas escaquear. Pierdes una mano visible. " , 0, 
                  TreasureKind::ONEHAND, TreasureKind)
monsters << Monster.new("Dameargo ", 1, P12, BC12)

#---------------------------------------------------------------------------------------------------------------------------------#

P13 = Prize.new(1, 1)
BC13 = BadConsequence.newLevelNumberOfTreasures("Da mucho asquito. Pierdes 3 niveles. ", 3, 0, 0)
monsters << Monster.new("Pollipólipo volante ", 3, P13, BC13)

#---------------------------------------------------------------------------------------------------------------------------------#

P14 = Prize.new(3, 1)
BC14 = BadConsequence.newDeath("No le hace gracia que pronuncien mal su nombre. Estás muerto. ")
monsters << Monster.new("Yskhtihyssg-Goth ", 12, P14, BC14)

#---------------------------------------------------------------------------------------------------------------------------------#

P15 = Prize.new(4, 1)
BC15 = BadConsequence.newDeath("La familia te atrapa. Estás muerto. ")
monsters << Monster.new("Familia feliz ", 1, P15, BC15)

#---------------------------------------------------------------------------------------------------------------------------------#

P16 = Prize.new(2, 1)
BC16 = BadConsequence.newLevelSpecificTreasures("La quinta directiva primaria te obliga a perder 2 niveles y un
                tesoro 2 manos visible. ", 2, TreasureKind::BOTHHANDS, TreasureKind)
monsters << Monster.new("Roboggoth ", 8, P16, BC16)

#---------------------------------------------------------------------------------------------------------------------------------#

P17 = Prize.new(1, 1)
BC17  = BadConsequence.newLevelSpecificTreasures("Te asusta en la noche. Pierdes un casco visible. ", 0, 
                TreasureKind::HELMET, TreasureKind)
monsters << Monster.new("El espía ", 5, P17, BC17)

#---------------------------------------------------------------------------------------------------------------------------------#

P18 = Prize.new(1, 1)
BC18 = BadConsequence.newLevelNumberOfTreasures("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles. ", 2, 5, 0)
monsters << Monster.new("El lenguas ", 20, P18, BC18)

#---------------------------------------------------------------------------------------------------------------------------------#

P19 = Prize.new(1, 1)
BC19 = BadConsequence.newLevelSpecificTreasures("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos. ", 
                3, TreasureKind::BOTHHANDS, TreasureKind)
            monsters << Monster.new("Bicéfalo ", 20, P19, BC19)
            
#---------------------------------------------------------------------------------------------------------------------------------#

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

        







