# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class NumericBadConsequence < BadConsequence
    
    def initialize(aText, someLevels, someVisibleTreasures, someHiddenTreasures)
      super(aText, someLevels, someVisibleTreasures, someHiddenTreasures, Array.new, Array.new, false)
    end
    
  end
  
end