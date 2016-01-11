#

module NapakalakiGame
  
  class SpecificBadConsequence < BadConsequence
    
    def initialize(aText, someLevels, someSpecificVisibleTreasures, someSpecificHiddenTreasures)
      super(aText, someLevels, -1, -1,someSpecificHiddenTreasures, someSpecificVisibleTreasures, false)
    end
 
  end
  
end