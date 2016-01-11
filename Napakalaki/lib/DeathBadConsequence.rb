#

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(aText)
      BadConsequence.new(aText, 0, 0, 0, Array.new, Array.new, true)
    end
  
  end
  
end