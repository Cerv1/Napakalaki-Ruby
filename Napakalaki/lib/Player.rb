# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.
@@MAXLEVEL=10

class Player
  attr_reader:name, :level, :dead, :canISteal, :hiddenTreasures, :visibleTreasures
  
  def initialize(name)
    @name=name
  end
  
  def bringToLife()
    
  end
  
  def incrementLevels(i)
    @level=@level+i
  end
  
  def decrementLevels(i)
    @level=@level-i
  end
  
  def setPendingBadConsequence(b)
    
  end

def applyPrize(m)

end

def applyBadConsequence(m)

end

def canMakeTreasureVisible(t)

end

def howManyVisibleTreasures(tkind)

end

def dieIfNoTreasures()

end

def isDead()

end

def combat(m)

end

def makeTreasureVisible(t)

end

def discardVisibleTreasure()

end

def discardHiddenTreasure()

end

def validState()

end

def initTreasures()

end

def stealTreasure()
  
end

def setEnemyPlayer(enemy)
  
end

def giveMeATreasure()
  
end

def canISteal()
  
end

def canYouGiveMeATreasure()
  
end

def haveStolen()
  
end

def discardAllTreasures()
  
end

end
