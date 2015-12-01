#encoding: utf-8

module NapakalakiGame

require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'

class Player
  
  @@MAXLEVEL=10
  
  attr_reader :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures
  attr_writer :pendingBadConsequence, :enemy
  
  def initialize(name)
    @name=name
    @level=1
    @dead=false
    @canISteal=false
    @hiddenTreasures=Array.new
    @visibleTreasures=Array.new
    @pendingBadConsequence=nil
    @enemy=nil
  end

  def isDead()
    return @dead
  end

  def combat(m)
    myLevel=@combatLevel
    monsterLevel=m.getCombatLevel
    if(myLevel>monsterLevel)
        applyPrize(m)
        if(@level>=@@MAXLEVEL)
            return CombatResult::WINGAME
        else
            return CombatResult::WIN
        end
        applyBadConsequence(m)
        return CombatResult::LOSE
    end   
  end

  def makeTreasureVisible(t)
    canI=canMaketreasureVisible(t)
    if(canI)
        @visibleTreasures << t
        @hiddenTreasures.delete(t)
    end
  end

  def discardVisibleTreasure(t)
      @visibleTreasures.delete(t)
      if(@pendingBadConsequence!=nil && !@pendingBadConsequence.empty?)
          @pendingBadConsequence.substractVisibleTreasures(t)
      end
      dieIfNoTreasures
  end

  def discardHiddenTreasure()
      @visibleTreasures.delete(t)
      if(@pendingBadConsequence!=nil && !@pendingBadConsequence.empty?)
          @pendingBadConsequence.substractVisibleTreasures(t)
      end
      dieIfNoTreasures
  end

  def validState()
    if(@pendingBadConsquence.isEmpty? && @hiddenTreasures.size <= 4)
      return true
    else
      return false
    end
  end

  def initTreasures()

  end

  def stealTreasure()
     # return @hiddenTreasures[0]
  end

  def canISteal()
    return @canISteal
  end

  def discardAllTreasures()
  
  end
  
  
private
    
  def bringToLife()
    @dead=false;
  end
  
  def getCombatLevel()
    total=level
    i=0
    while i<@visibleTreasures.size
      total+=@visibleTreasures[i].getBonus  
    end
    while i<@hiddenTreasures.size
      total+=@hiddenTreasures[i].getBonus
    end
     total
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
            @hiddenTreasres << treasure
        end
    end
  end

  def applyBadConsequence(m)
    badConsequence = m.getBadConsequence
    nLevels = badConsequence.level
    decrementLevels(nLevels)
    pendingBad = badConsequence.adjustToFitTreasureLists(@visibleTreasures, @hiddenTreasures)
    setPendingBadConsequence(pendingBad)
  end
  
  def canMakeTreasureVisible(t)
      resultado=true
      tipo=t.type
      tesoros_onehand=0
      
      for i in 0..@visibleTreasures.size-1
          if(@visibleTreasures[i].type==TreasureKind::ONEHAND && tipo==TreasureKind::ONEHAND)
              tesoros_onehand=tesoros_onehand+1
          end
          if(tesoros_onehand>=2)
              resultado=false
          else if(tesoros_nehand == 1 && tipo==TreasureKind.BOTHHANDS)
                  resultado=false
          else if(@visibleTreasures[i].type == tipo)
                  resultado=false
          end
          end
      
        end
      end
      return resultado
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
      robado=@hiddenTreasures[i]
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
  
end
end
