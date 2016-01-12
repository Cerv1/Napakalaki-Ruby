#

module NapakalakiGame
  
  class DeathBadConsequence < NumericBadConsequence
    
    attr_accessor :death
    
    def initialize(aText)
      super(aText, 0, -1, -1)
      @death=true
    end

  end
  
end