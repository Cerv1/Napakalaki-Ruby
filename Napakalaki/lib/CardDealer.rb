#encoding: utf-8

require 'singleton'

require_relative 'Prize.rb'
require_relative 'Monster.rb'
require_relative 'BadConsequence.rb'
require_relative 'TreasureKind.rb'
require_relative 'Treasure.rb'
require_relative 'Cultist.rb'

module NapakalakiGame

class CardDealer
  
  include Singleton

  attr_reader :unusedTreasures, :usedTreasures, :unusedMonsters, :usedMonsters, :unusedCultists
 
  def initialize ()
    @unusedTreasures=Array.new
    @usedTreasures=Array.new
    @unusedMonsters=Array.new
    @usedMonsters=Array.new
    @unusedCultists=Array.new
  end
   
  def nextTreasure
      if(@unusedTreasures.empty?)
          aux=@unusedTreasures
          @unusedTreasures=@usedTreasures
          @usedTreasures=aux
          shuffleTreasures()
      end
       nexttreasure=@unusedTreasures[0]
       @unusedTreasures.delete_at(0)
       return nexttreasure
  end
  
  def nextMonster
    if(@unusedMonsters.empty?)
          aux=@unusedMonsters
          @unusedMonsters=@usedMonsters
          @usedMonsters=aux
          shuffleMonsters()
      end
       nextmonster=@unusedMonsters[0]
       @unusedMonsters.delete_at(0)
       return nextmonster
  end
  
  def nextCultist
      if(!@unusedCultists.empty?)
         nextcultist=@unusedCultists[0]
        @unusedCultists.delete_at(0)
        return nextcultist
      end
  end

  def giveTreasureBack(t)
    @usedTreasures << t
    @unusedTreasures.delete(t)
  end
  
  def giveMonsterBack(m)
    @usedMonsters << m
    @unusedMonsters.delete(m)
  end
  
  def initCards
    initTreasureCardDeck
    initMonsterCardDeck
    initCultistCardDeck
    shuffleTreasures
    shuffleMonsters
    shuffleCultists
  end
  
private
  
  def initTreasureCardDeck
    
    t1 = Treasure.new("¡Sí mi amo!", 4, TreasureKind::HELMET)
    @unusedTreasures << t1
    
    t2 = Treasure.new("Botas de investigación", 3, TreasureKind::SHOES)
    @unusedTreasures << t2
    
    t3 = Treasure.new("Capucha de Cthulhu", 3, TreasureKind::HELMET)
    @unusedTreasures << t3
    
    t4 = Treasure.new("A prueba de babas", 2, TreasureKind::ARMOR)
    @unusedTreasures << t4
    
    t5 = Treasure.new("Botas de lluvia ácida", 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << t5
    
    t6 = Treasure.new("Casco minero", 2, TreasureKind::HELMET)
    @unusedTreasures << t6
    
    t7 = Treasure.new("Ametralladora Thompson", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << t7
    
    t8 = Treasure.new("Camiseta de la UGR", 1, TreasureKind::ARMOR)
    @unusedTreasures << t8
    
    t9 = Treasure.new("Clavo de rail ferroviario", 3, TreasureKind::ONEHAND)
    @unusedTreasures << t9
    
    t10 = Treasure.new("Cuchillo de sushi arcano", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t10
    
    t11 = Treasure.new("Fez alópodo", 3, TreasureKind::HELMET)
    @unusedTreasures << t11
    
    t12 = Treasure.new("Hacha prehistórica", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t12
    
    t13 = Treasure.new("El aparato del Pr. Tesla", 4, TreasureKind::ARMOR)
    @unusedTreasures << t13
    
    t14 = Treasure.new("Gaita", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << t14
    
    t15 = Treasure.new("Insecticida", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t15
    
    t16 = Treasure.new("Escopeta de 3 cañones", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << t16
    
    t17 = Treasure.new("Garabato místico", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t17
    
    t18 = Treasure.new("La rebeca metálica", 2, TreasureKind::ARMOR)
    @unusedTreasures << t18
    
    t19 = Treasure.new("Lanzallamas", 4, TreasureKind::BOTHHANDS)
    @unusedTreasures << t19
    
    t20 = Treasure.new("Necrocomicón", 1, TreasureKind::ONEHAND)
    @unusedTreasures << t20
    
    t21 = Treasure.new("Necronomicón", 5, TreasureKind::BOTHHANDS)
    @unusedTreasures << t21
    
    t22 = Treasure.new("Linterna a 2 manos", 3, TreasureKind::BOTHHANDS)
    @unusedTreasures << t22
    
    t23 = Treasure.new("Necrognomicón", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t23
    
    t24 = Treasure.new("Necrotelecom", 2, TreasureKind::HELMET)
    @unusedTreasures << t24
    
    t25 = Treasure.new("Mazo de los antiguos", 3, TreasureKind::ONEHAND)
    @unusedTreasures << t25
    
    t26 = Treasure.new("Necroplayboycón", 3, TreasureKind::ONEHAND)
    @unusedTreasures << t26
    
    t27 = Treasure.new("Porra preternatural", 2, TreasureKind::ONEHAND)
    @unusedTreasures << t27
    
    t28 = Treasure.new("Shogulador", 1, TreasureKind::BOTHHANDS)
    @unusedTreasures << t28
    
    t29 = Treasure.new("Varita de atizamiento", 3, TreasureKind::ONEHAND)
    @unusedTreasures << t29
    
    t30 = Treasure.new("Tentáculo de pega", 2, TreasureKind::HELMET)
    @unusedTreasures << t30
    
    t31 = Treasure.new("Zapato deja-amigos", 1, TreasureKind::SHOES)
    @unusedTreasures << t31  
  end
  
def initMonsterCardDeck
 
    pr = Prize.new(2,1)
    bc = NumericBadConsequence.new("Pierdes tu armadura visible y otra oculta", 0, 1, 1)
    @unusedMonsters << Monster.new("3 Byakhees de bonanza", 8, bc, pr,0)

    pr = Prize.new(1, 1)
    bc = SpecificBadConsequence.new("Embobados con el lindo primigenio te descartas de tu casco visible", 0, 
            TreasureKind::HELMET, Array.new)
    @unusedMonsters << Monster.new("Chibithulhu", 2, bc, pr,0)     

    pr = Prize.new(1, 1)
    bc = SpecificBadConsequence.new("El primordial bostezo contagioso. Pierdes el calzado visible. ", 0,
                TreasureKind::SHOES, Array.new)
    @unusedMonsters<< Monster.new("El sopor de Dunwich", 2, bc, pr, 0)

    pr = Prize.new(4, 1)
    bc = SpecificBadConsequence.new("Te atrapan para llevarte de fiesta y te dejan caer en mitad del vuelo. 
              Descarta 1 mano visible y 1 mano oculta", 0,  TreasureKind::ONEHAND, TreasureKind::ONEHAND)
    @unusedMonsters << Monster.new("Ángeles de la noche ibicenca ", 14, bc ,pr, 0)

    pr = Prize.new(3, 1)
    bc = NumericBadConsequence.new("Pierdes todos tus tesoros visibles. ", 0, 100, 0)
    @unusedMonsters << Monster.new("El gorrón en el umbral ", 10, bc ,pr, 0)

    pr = Prize.new(2, 1)
    bc = SpecificBadConsequence.new("Pierdes la armadura visible. ",0 , TreasureKind::ARMOR,  Array.new)
    @unusedMonsters << Monster.new("H.P Munchcraft ", 6, bc ,pr, 0)

    pr = Prize.new(1, 1)
    bc = SpecificBadConsequence.new("Sientes bichos bajo la ropa. Descarta la armadura visible. ", 0, 
              TreasureKind::ARMOR,  Array.new)
    @unusedMonsters << Monster.new("Bichgooth " , 2, bc ,pr, 0)

    pr = Prize.new(4, 2)
    bc = NumericBadConsequence.new("Pierdes 5 niveles y 3 tesoros visibles. ", 5, 3, 0)
    @unusedMonsters << Monster.new("El rey de rosa ", 13, bc ,pr, 0)

    pr = Prize.new(1, 1)
    bc = NumericBadConsequence.new("Toses los pulmones y pierdes 2 niveles. ", 2, 0, 0)
    @unusedMonsters << Monster.new("La que redacta en las tinieblas ", 2, bc ,pr, 0)

    pr = Prize.new(2, 1)
    bc = DeathBadConsequence.new("Estos monstruos resultan bastante superficiales y te aburren mortalmente. Estás muerto. ")
    @unusedMonsters << Monster.new("Los hondos ", 8, bc, pr, 0)

    pr = Prize.new(2, 1)
    bc = NumericBadConsequence.new("Pierdes 2 niveles y 2 tesoros ocultos. ", 2, 0, 2)
    @unusedMonsters << Monster.new("Semillas Cthulhu ", 4, bc ,pr, 0)

    pr = Prize.new(2, 1)
    bc = SpecificBadConsequence.new("Te intentas escaquear. Pierdes una mano visible. " , 0, 
                  TreasureKind::ONEHAND,  Array.new)
    @unusedMonsters << Monster.new("Dameargo ", 1, bc ,pr, 0)

    pr = Prize.new(1, 1)
    bc = NumericBadConsequence.new("Da mucho asquito. Pierdes 3 niveles. ", 3, 0, 0)
    @unusedMonsters << Monster.new("Pollipólipo volante ", 3, bc ,pr, 0)

    pr = Prize.new(3, 1)
    bc = DeathBadConsequence.new("No le hace gracia que pronuncien mal su nombre. Estás muerto. ")
    @unusedMonsters << Monster.new("Yskhtihyssg-Goth ", 12, bc ,pr, 0)

    pr = Prize.new(4, 1)
    bc = DeathBadConsequence.new("La familia te atrapa. Estás muerto. ")
    @unusedMonsters << Monster.new("Familia feliz ", 1, bc ,pr, 0)

    pr = Prize.new(2, 1)
    bc = SpecificBadConsequence.new("La quinta directiva primaria te obliga a perder 2 niveles y un
                tesoro 2 manos visible. ", 2, TreasureKind::BOTHHANDS,  Array.new)
    @unusedMonsters << Monster.new("Roboggoth ", 8, bc ,pr, 0)

    pr = Prize.new(1, 1)
    bc  = SpecificBadConsequence.new("Te asusta en la noche. Pierdes un casco visible. ", 0, 
                TreasureKind::HELMET,  Array.new)
    @unusedMonsters << Monster.new("El espía ", 5, bc,pr, 0)

    pr = Prize.new(1, 1)
    bc = NumericBadConsequence.new("Menudo susto te llevas. Pierdes 2 niveles y 5 tesoros visibles. ", 2, 5, 0)
    @unusedMonsters << Monster.new("El lenguas ", 20, bc ,pr, 0)

    pr = Prize.new(1, 1)
    bc = SpecificBadConsequence.new("Te faltan manos para tanta cabeza. Pierdes 3 niveles y tus tesoros visibles de las manos. ", 
                3, TreasureKind::BOTHHANDS,  Array.new)
    @unusedMonsters << Monster.new("Bicéfalo ", 20, bc ,pr, 0)
    
    
    #---------------- CULTIST MONSTERS ----------------#
    
    pr = Prize.new(3,1)
    bc=SpecificBadConsequence.new("Pierdes 1 mano visible. ",0, TreasureKind::ONEHAND, Array.new)
    @unusedMonsters << Monster.new("El mal indecible impronunciable", 10, bc, pr, -2)
    
    pr = Prize.new(2,1)
    bc=NumericBadConsequence.new("Pierdes todos tus tesoros visibles. Jajaja ", 0, 100, 0)
    @unusedMonsters << Monster.new("Testigos oculares", 6, bc, pr, 2)
    
    pr = Prize.new(2,5)
    bc=DeathBadConsequence.new("Hoy no es tu día de suerte. Mueres.")
    @unusedMonsters << Monster.new("El gran cthulhu", 20, bc, pr, 4)
    
    pr = Prize.new(2,1)
    bc=NumericBadConsequence.new("Tu gobierno te recorta 2 niveles.",2,0,0)
    @unusedMonsters << Monster.new("Serpiente Politico", 8, bc, pr, -2)
    
    pr = Prize.new(1,1)
    bc=SpecificBadConsequence.new("Pierdes tu casco y armadura visible. Pierdes tus manos ocultas.",0,
              [TreasureKind::HELMET,TreasureKind::ARMOR],[TreasureKind::ONEHAND,TreasureKind::BOTHHANDS])
    @unusedMonsters << Monster.new("Felpuggoth", 2, bc, pr, 5)
    
    pr = Prize.new(4,2)
    bc=NumericBadConsequence.new("Pierdes 2 niveles. ",2,0,0)
    @unusedMonsters << Monster.new("Shoggoth", 16, bc, pr, -4)
    
    pr = Prize.new(1,1)
    bc=NumericBadConsequence.new("Pintalabios negro. Pierdes 2 niveles. ",2,0,0)
    @unusedMonsters << Monster.new("Lolitagooth", 2, bc, pr, 3)
    
  end
  
  def initCultistCardDeck
      cultist=Cultist.new("Sectario",1)
      @unusedCultists << cultist
      
      cultist=Cultist.new("Sectario",2)
      @unusedCultists << cultist
      
      cultist=Cultist.new("Sectario",1)
      @unusedCultists << cultist
      
      cultist=Cultist.new("Sectario",2)
      @unusedCultists << cultist
      
      cultist=Cultist.new("Sectario",1)
      @unusedCultists << cultist
      
      cultist=Cultist.new("Sectario",1)
      @unusedCultists << cultist
      
  end

  def shuffleTreasures
    @unusedTreasures.shuffle!
  end
  
  def shuffleMonsters
    @unusedMonsters.shuffle!
  end
  
  def shuffleCultists
      @unusedCultists.shuffle!
  end
  
end
end
