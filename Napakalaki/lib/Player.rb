#encoding: utf-8

module NapakalakiGame

require_relative 'Treasure.rb'
require_relative 'BadConsequence.rb'
require_relative 'Napakalaki.rb'

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

  def isDead
    return @dead
  end

   def getVisibleTreasures
       return  @visibleTreasures
   end
   
   def getHiddenTreasures
       return @hiddenTreasures
   end

  def combat(m)
    myLevel=@level
    monsterLevel=m.combat_level
    if (myLevel > monsterLevel)
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
      if(@visibleTreasures != nil)
         @visibleTreasures.delete(t)
      if(@pendingBadConsequence!=nil)
          @pendingBadConsequence.substractVisibleTreasures(t)
      end
      dieIfNoTreasures
     end
  end

  def discardHiddenTreasure()
      if(@hiddenTreasures != nil)
        @hiddenTreasures.delete(t)
      if(@pendingBadConsequence!=nil && !@pendingBadConsequence.empty?)
          @pendingBadConsequence.substractVisibleTreasures(t)
      end
      dieIfNoTreasures
      end
  end

  def validState
    if(@pendingBadConsequence.isEmpty? && @hiddenTreasures.size <= 4)
      return true
    else
      return false
    end
  end

  def initTreasures()
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
          treasure=delaer.nextTreasure
          @hiddenTreasures << treasure
      end
  end

  def stealTreasure()
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

  def canISteal()
    return @canISteal
  end

  def discardAllTreasures()
      for i in 0..@visibleTreasures.size-1
          discardVisibleTreasure(@visibleTreasures.at(i))
      end
      
      for i in 0..@hiddenTreasures.size-1
          discardVisibleTreasure(@hiddenTreasures.at(i))
      end
  end
  
  def setEnemy(enemy)
       @enemy=enemy
   end
      
  def to_s
    "#{@name}   CombatLevel -> #{@level}"
  end
  
private
    
  def bringToLife()
    @dead=false;
  end
  
  def getCombatLevel()
    total=level
    i=0
    while i<@visibleTreasures.size
      total+=@visibleTreasures.at(i).getBonus  
    end
    while i<@hiddenTreasures.size
      total+=@hiddenTreasures.at(i).getBonus
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
      tipo = t.tkind
    # Si es ARMOR
    if(tipo == TreasureKind::ARMOR)
      for treasure in @visibleTreasures
        if(treasure.tkind == TreasureKind::ARMOR)
          return false
        end
      end
        return true
      
    # Si es ONEHAND
    elsif(tipo == TreasureKind::ONEHAND)
      numUnaMano = 0
      for treasure in @visibleTreasures
        if(treasure.tkind == TreasureKind::ONEHAND)
          numUnaMano+=1;
        end
      end
      return (numUnaMano <= 1)
    
    # Si es BOTHHANDS
    elsif(tipo == TreasureKind::BOTHHANDS)
      numUnaMano = 0
      for treasure in @visibleTreasures
        if(treasure.tkind == TreasureKind::ONEHAND || treasure.tkind == TreasureKind::BOTHHANDS)
          return false
        end
      end
      return true
     
    # Si es HELMET
    elsif(tipo == TreasureKind::HELMET)
      for treasure in @visibleTreasures
        if(treasure.tkind == TreasureKind::HELMET)
          return false
        end
      end
      return true
      
    #Si es SHOE
    else
      for treasure in @visibleTreasures
        if(treasure.tkind == TreasureKind::SHOES)
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

end
end
