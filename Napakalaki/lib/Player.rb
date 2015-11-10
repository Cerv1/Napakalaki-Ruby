#encoding: utf-8
# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.


module NapakalakiGame

require 'Treasure.rb'
require 'BadConsequence.rb'

class Player
  @@MAXLEVEL=10
  attr_reader :name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures
  attr_writer :pendingBadConsequence, :enemy
  
  def initialize(name)
    @name=name
    @level=0
    @dead=false
    @canISteal=false
    @hiddenTreasures=Array.new
    @visibleTreasures=Array.new
    @pendingBadConsequence=Array.new
  end

  def isDead()
    return @dead
  end

  def combat(m)

  end

  def makeTreasureVisible(t)
    @hiddenTreasures.delete(t)
    @visibleTreasures.add(t)
  end

  def discardVisibleTreasure()

  end

  def discardHiddenTreasure()

  end

  def validState()
    if(pendingBadConsquence.empty? && hiddenTreasures.size < 4)
      return true
    else
      return false
    end
  end

  def initTreasures()

  end

  def stealTreasure()
  
  end

  def canISteal()
  
  end

  def discardAllTreasures()
  
  end
  
  private
  #/////////////////////////////////                     PRIVATE                 /////////////////////////////////
    
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
    if(@level-i<=0)
      @level=@level-i
    else
      @level=0 
    end
  end
  
  def setPendingBadConsequence(b)
    @pendingBadConsequence=b
  end
   
  def applyPrize(m)
    
  end

  def applyBadConsequence(m)
    
  end
  
  def canMakeTreasureVisible(t)

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
