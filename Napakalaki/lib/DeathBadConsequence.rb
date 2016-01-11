#

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    def initialize(aText)
      super(aText, 0, -1, -1, Array.new, Array.new, true)
    end
  
  end
  
end