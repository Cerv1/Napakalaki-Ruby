# To change this license header, choose License Headers in Project Properties.
# To change this template file, choose Tools | Templates
# and open the template in the editor.

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(aText)
      super(aText, 0, -1, -1, Array.new, Array.new, true)
    end
  
  end
  
end