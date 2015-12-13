#encoding: utf-8

module NapakalakiGame

require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
require_relative 'Napakalaki.rb'
require_relative 'CardDealer.rb'
require_relative 'Dice.rb'

class Player
  
  @@MAXLEVEL=10
  
  attr_accessor :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures, :pendingBadConsequence, :enemy
  
  def initialize(name)
    @name=name
    @level=1
    @dead=true
    @canISteal=false
    @hiddenTreasures=Array.new
    @visibleTreasures=Array.new
    @pendingBadConsequence=nil
    @enemy=nil
  end

  def isDead
    return @dead
  end

   def getVisibleTreasures
       return  @visibleTreasures
   end
   
   def getHiddenTreasures
       return @hiddenTreasures
   end

  def makeTreasureVisible(t)
    canI=canMakeTreasureVisible(t)
    if(canI)
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
    end
  end

  def discardVisibleTreasure(t)
      if(@visibleTreasures != nil)
         @visibleTreasures.delete(t)
      if(@pendingBadConsequence!=nil && !@pendingBadConsequence.isEmpty)
          @pendingBadConsequence.substractVisibleTreasures(t)
      end
      dieIfNoTreasures
      end
  end

  def discardHiddenTreasure(t)
      if(@hiddenTreasures != nil)
        @hiddenTreasures.delete(t)
      if(@pendingBadConsequence!=nil && !@pendingBadConsequence.isEmpty)
          @pendingBadConsequence.substractHiddenTreasures(t)
      end
      dieIfNoTreasures
      end
  end

  def validState
    if(@pendingBadConsequence==nil)
      return true
    end
    if(@pendingBadConsequence.isEmpty && @hiddenTreasures.size <= 4)
      return true
    else
      return false
    end
  end

  def initTreasures
      dealer=CardDealer.instance
      dice=Dice.instance
      bringToLife
      
      treasure=dealer.nextTreasure
      @hiddenTreasures << treasure
      
      number=dice.nextNumber
      if(number>1)
          treasure=dealer.nextTreasure
          @hiddenTreasures << treasure
      end
      
      if(number == 6)
          treasure=dealer.nextTreasure
          @hiddenTreasures << treasure
      end
  end

  def stealTreasure
     canI=canISteal
     canYou = @enemy.CanYouGiveMeATreasure
     if(canI && canYou)
         treasure=@enemy.giveMeATreasure
         @hiddenTreasures << treasure
         haveStolen
         return treasure
     end
     return nil
  end

  def canISteal
    return @canISteal
  end

  def discardAllTreasures
      for i in 0..@visibleTreasures.size
          discardVisibleTreasure(@visibleTreasures.at(i))
      end
      
      for i in 0..@hiddenTreasures.size
          discardHiddenTreasure(@hiddenTreasures.at(i))
      end
  end
  
  def setEnemy(enemy)
       @enemy=enemy
   end

private
    
  def bringToLife
    @dead=false;
  end
  
  def getCombatLevel
    total=@level
    for treasure in @visibleTreasures
      total += treasure.bonus
    end
    for treasure2 in @hiddenTreasures
      total += treasure2.bonus
    end
     return total
  end
    
  def incrementLevels(i)
    @level=@level+i
  end
  
  def decrementLevels(i)
    if(@level-i<=1)
      @level=@level-i
    else
      @level=1 
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence=b
  end
   
  def applyPrize(m)
    nLevels=m.getLevelsGained
    incrementLevels(nLevels)
    nTreasures=m.getTreasuresGained
    if(nTreasures>0)
        dealer=CardDealer.getInstance
        for i in 0..nTreasures
            treasure=dealer.nextTreasure
            @hiddenTreasures << treasure
        end
    end
  end

  def applyBadConsequence(m)
    badConsequence = m.mal_rollo
    nLevels = badConsequence.level
    decrementLevels(nLevels)
    pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  
  def canMakeTreasureVisible(t)
      tipo = t.type

    if(tipo == TreasureKind::ARMOR)
      for treasure in @visibleTreasures
        if(treasure.type == TreasureKind::ARMOR)
          return false
        end
      end
        return true

    elsif(tipo == TreasureKind::ONEHAND)
      tesoros_onehand = 0
      for treasure in @visibleTreasures
        if(treasure.type == TreasureKind::ONEHAND)
          tesoros_onehand+=1;
        end
        if(tesoros_onehand>1)
          return false
        else
          for treasure in @visibleTreasures
            if(treasure.type == TreasureKind::BOTHHANDS)
              return false
            end
          end
        end
      end
      return (tesoros_onehand <= 1)

    elsif(tipo == TreasureKind::BOTHHANDS)
      tesoros_onehand = 0
      for treasure in @visibleTreasures
        if(treasure.type == TreasureKind::ONEHAND || treasure.type == TreasureKind::BOTHHANDS)
          return false
        end
      end
      return true

    elsif(tipo == TreasureKind::HELMET)
      for treasure in @visibleTreasures
        if(treasure.type == TreasureKind::HELMET)
          return false
        end
      end
      return true

    else
      for treasure in @visibleTreasures
        if(treasure.type == TreasureKind::SHOES)
          return false
        end
      end
      return true
    end
  end

  def howManyVisibleTreasures(tKind)
    total_visibles=0
    @visibleTreasures.each do |vT|
      if(vT.type == tKind)
        total_visibles+=1
      end
    end     
    total_visibles
  end
      
  def dieIfNoTreasures()
    if(hiddenTreasures.empty? && visibleTreasures.empty?)
      @dead=true
    end
  end
  
  def giveMeATreasure()
      number=@hiddenTreasures.size
      indice = Rand(number)
      robado=@hiddenTreasures.at(i)
      @hiddenTreasures.delete_at(indice)
      return robado
  end
  
  def canYouGiveMeATreasure()
  tienetesoros=true
  if(visibleTreasures.empty? && hiddenTreasures.empty?)
    tienetesoros=false
  end
    return tienetesoros
  end
  
  def haveStolen()
    @canISteal=false
  end

public

  def to_s
    "#{@name}   CombatLevel -> #{getCombatLevel}   Level -> #{@level}"
  end
  
  
end
end
