#

module NapakalakiGame
  
  class NumericBadConsequence < BadConsequence
    
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      super(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new, false)
    end
    
  end
  
end